class CreateOrders < ActiveRecord::Migration
	def self.up
		create_table :orders, { :primary_key => :idorders } do |t|
			t.column :idorders, :integer, :null => false
			t.column :order_date, :date, :default => nil
			t.column :order_number, :string, :default => nil
			t.column :customerid, :integer, :default => nil
		end
	end

	def self.down
		drop_table :orders
	end
end
