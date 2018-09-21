class CreateGigs < ActiveRecord::Migration[5.2]
  def change
    create_table :gigs do |t|
      t.string :name
      t.string :description
      t.references :band, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.string :location_venue
      t.string :location_address_1
      t.string :location_address_2
      t.string :location_city
      t.string :location_state
      t.string :location_postal_code
      t.string :location_country

      t.timestamps
    end
  end
end
