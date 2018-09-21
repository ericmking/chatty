class AddCreatedByAndResponsibleUserToTasks < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :created_by, foreign_key: { to_table: :users }
    add_reference :tasks, :responsible_user, foreign_key: { to_table: :users }
  end
end
