class AddDatesToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :due_date, :datetime
    add_column :tasks, :completed_date, :datetime
  end
end
