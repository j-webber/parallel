class ChangeExpirationDateInParkingPasses < ActiveRecord::Migration[8.0]
  def change
    change_column :parking_passes, :expiration_date, :datetime
  end
end
