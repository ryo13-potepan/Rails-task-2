class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.date :check_in_date
      t.date :check_out_date
      t.integer :num_of_people
      t.integer :total_price
      t.datetime :confirmed_at

      t.timestamps
    end
  end
end
