class AddDateToStatus < ActiveRecord::Migration
  def change
    add_column :statuses, :date, :date
  end
end