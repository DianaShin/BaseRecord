require_relative 'db_connection'
require 'active_support/inflector'

class SQLObject
  def self.columns
    table = table_name
    if @columns == nil
      @columns =  DBConnection.execute2(<<-SQL)
        SELECT
          *
        FROM
          #{table}
        SQL
    else
      @columns
    end
    @columns.first.map {|col| col.to_sym}
  end

  def self.finalize!
    columns.each do |col|
      define_method(col) do
        attributes[col]
      end
      define_method("#{col}=") do |value|
        attributes[col] = value
      end
    end

  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= "#{self}".tableize
  end


  def self.all
    table = table_name
    items = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        #{table}
      SQL
      items.map do |item|
        self.new(item)
      end
  end

  def self.parse_all(results)
    results.map do |result|
      self.new(result)
    end
  end

  def self.find(id)
    table = table_name
    objs= DBConnection.execute(<<-SQL, id)
      SELECT
        *
      FROM
        #{table}
      WHERE
        #{table}.id = ?
      SQL
    parse_all(objs).first
  end

  def initialize(params = {})
    params.each do |attr_name, value|
      attr_name = attr_name.to_sym
      if self.class.columns.include?(attr_name)
         self.send("#{attr_name}=", value)
      else
        raise "unknown attribute '#{attr_name}'"
      end
    end
  end

  def attributes
       @attributes ||= {}
  end

  def attribute_values
    self.class.columns.map do |column|
      self.send(column)
    end
  end

  def insert
    table = self.class.table_name
    col_names = self.class.columns.join(', ')
    question_marks = (['?'] * (self.class.columns.count)).join(", ")
    result = DBConnection.execute(<<-SQL, *attribute_values)
      INSERT INTO
      #{table} (#{col_names})
      VALUES
      (#{question_marks})
    SQL

    self.id = DBConnection.last_insert_row_id
  end

  def update
    set_line = self.class.columns
       .map { |attr| "#{attr} = ?" }.join(", ")
    DBConnection.execute(<<-SQL, *attribute_values, id)
      UPDATE
        #{self.class.table_name}
      SET
        #{set_line}
      WHERE
        #{self.class.table_name}.id = ?
    SQL
  end

  def save
    self.id.nil? ? insert : update
  end
end
