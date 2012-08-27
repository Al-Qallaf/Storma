require 'rubygems'
require 'active_record'

class Orders < ActiveRecord::Base
	self.table_name = "orders"
	self.primary_key = "idorders"
	belongs_to :customers, :foreign_key => "customerid"
end
