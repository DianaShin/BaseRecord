# BaseRecord

BaseRecord is a lightweight Ruby object relational mapping (ORM) library that is based on Rails' ActiveRecord. It translates rows from a SqLite3 database into Ruby objects  while maintaining readability and DRYness of your code. 

It incorporates metaprogramming techniques, and allows you to perform database operations in an object-oriented manner without having to write SQL code!

## Features and Implementation 

   * Implements the core functionality of ActiveRecord::Base.
   * Follows Ruby's 'convention over configuration' paradigm.
   * Utilizes SQLite3 (gem) and ActiveSupport::Inflector libraries. 
   * Supports ActiveRecord's core associations, ```belongs_to```, ```has_many```, and ```has_one_through```, providing sensible default class_name, foreign_key, and primary_key values if not provided by user.
   
## DEMO 

1. Clone this repository and ```cd``` to it.
2. Run ```bundle install```.
3. In terminal, navigate to the demo directory of this repo,  and then open pry or irb.
4. Run ```load 'musicals_demo.rb'```.
5. Use the API below to play around with the data.

## API 

SQLObject provides similar core ActiveRecord associations as well as other methods to query the database: 
  * has_many
  * belongs_to
  * has_one_through
  * ::first
  * ::last
  * ::find
  * ::columns -> Prints out a list of columns from given table
  * ::all -> Finds all items
  * ::where -> Fins all items that meet the query constraint 
  * ::parse_all -> Take in an array and turns all items into table objects

