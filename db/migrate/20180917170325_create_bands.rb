class CreateBands < ActiveRecord::Migration[5.2]
  def change
    create_table :bands do |t|
      t.string :name
      t.references :created_by, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
