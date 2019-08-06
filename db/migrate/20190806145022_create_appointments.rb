class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.belongs_to :vet, foreign_key: true
      t.belongs_to :pet, foreign_key: true
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
