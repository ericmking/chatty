class CreateFolders < ActiveRecord::Migration[5.2]
  def change
    create_table :folders do |t|
      t.string :name
      t.references :band, foreign_key: true
      t.references :folder
      t.references :created_by, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
