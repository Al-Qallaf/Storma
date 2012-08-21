class CreateSalary < ActiveRecord::Migration
	def self.up
		create_table :Salary do |t|
			t.column :id, :string, :null => false, :default => 1
			t.column :date, :date, :default => nil
		end
	end

	def self.down
		drop_table :Salary
	end
end
