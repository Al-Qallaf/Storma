class CreateCustomers < ActiveRecord::Migration
	def self.up
		create_table :customers, { :primary_key => :idcustomers } do |t|
			t.column :idcustomers, :integer, :null => false
			t.column :name, :string, :default => nil
			t.column :email, :string, :default => nil
			t.column :phone, :integer, :default => nil
		end
	end

	def self.down
		drop_table :customers
	end
end
