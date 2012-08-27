require 'rubygems'
require 'active_record'

class Customers < ActiveRecord::Base
	self.table_name = "customers"
	self.primary_key = "idcustomers"
	has_many :orders
end
