class CreateParkingPasses < ActiveRecord::Migration[8.0]
  def change
    create_table :parking_passes do |t|
      t.string :expiration_date
      t.string :qr_code
      t.integer :valid_days
      t.references :guest, null: false, foreign_key: true

      t.timestamps
    end
  end
end
