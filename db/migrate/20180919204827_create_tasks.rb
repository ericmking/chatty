class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.references :band, foreign_key: true
      t.integer :position

      t.timestamps
    end
  end
end
