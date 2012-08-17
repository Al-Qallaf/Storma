class Createorders < ActiveRecord::Migration
	def self.up
		create_table :orders do |t|
			t.column :id, :integer, :null => false
			t.column :name, :string, :default => nil
			t.column :date, :date, :default => nil
		end
	end

	def self.down
		drop_table :orders
	end
end
