class AddProgressdayToReservation < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :progressday, :integer
  end
end
