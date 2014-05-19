class AddExerciseToStatuses < ActiveRecord::Migration
  def change
  	add_column :statuses, :exercise, :boolean
  end
end
