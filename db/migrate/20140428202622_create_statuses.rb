class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
    	t.boolean :dairy
    	t.boolean :wheat
    	t.boolean :meat
    	t.integer :coffee_cups
    	t.text :notes
      t.timestamps
    end
  end
end
