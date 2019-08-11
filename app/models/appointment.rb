class Appointment < ApplicationRecord
  belongs_to :vet
  belongs_to :pet

  validates_presence_of :vet_id, :pet_id, :date, :time
  validates_uniqueness_of :time, {scope: [:date, :vet_id], message: "unavailable, please choose a different time"}

  def self.upcoming_appts
    where('appointments.date >= ?', DateTime.now).order(date: :asc).order(time: :asc)
  end

  def self.past_appts
    where('appointments.date < ?', DateTime.now).order(date: :desc).order(time: :desc)
  end

  def self.upcoming_appts_for(vet)
    self.upcoming_appts.where('appointments.vet_id == ?', vet.id)
  end

  def self.past_appts_for(vet)
    self.past_appts.where('appointments.vet_id == ?', vet.id)
  end
end