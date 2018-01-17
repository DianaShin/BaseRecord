require_relative 'lib/01_sql_object'
require 'pry'

class Theme_Song < SQLObject
  self.finalize!
end

class Musical < SQLObject
  self.finalize!
end

class Playwright < SQLObject
  self.finalize!
end
