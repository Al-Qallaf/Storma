require 'rubygems'
require 'active_record'

class Hello < ActiveRecord::Base
	self.table_name = "Hello"
	self.primary_key = "idorders"
	belongs_to :AnotherTableClass, :foreign_key => "TheForeignKey_name"

end
