class ChangeTimeInAppointmentsToDatetime < ActiveRecord::Migration[5.2]
  def change
    change_column :appointments, :time, :datetime
  end
end
