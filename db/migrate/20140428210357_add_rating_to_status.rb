class AddRatingToStatus < ActiveRecord::Migration
  def change
    add_column :statuses, :rating, :integer
  end
end
