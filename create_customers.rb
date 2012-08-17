class Createcustomers < ActiveRecord::Migration
	def self.up
		create_table :customers do |t|
			t.column :id, :integer, :null => false
			t.column :name, :string, :default => nil
			t.column :address, :string, :default => nil
		end
	end

	def self.down
		drop_table :customers
	end
end
