class Appointment < ApplicationRecord
  belongs_to :vet
  belongs_to :pet

  validates_presence_of :vet_id, :pet_id, :date, :time

  def self.upcoming_appts
    where("date ")
  end

  
end
