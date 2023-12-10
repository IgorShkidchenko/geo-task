class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :ip, index: { unique: true }
      t.jsonb :geo_data, default: {}, null: false

      t.timestamps
    end
  end
end
