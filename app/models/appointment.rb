class Appointment < ApplicationRecord
  belongs_to :vet
  belongs_to :pet

  validates_presence_of :vet_id, :pet_id, :date, :time
  validates_uniqueness_of :time, {scope: [:date, :vet_id], message: "unavailable, please choose a different time"}
  validate :date_cannot_be_in_the_past
  validate :time_cannot_be_in_the_past

  def date_cannot_be_in_the_past
    errors.add(:date, "can't be in the past") if date < Date.today
  end

  def time_cannot_be_in_the_past
    errors.add(:time, "can't be in the past") if date == Date.today && time.strftime("%T") < Time.current.strftime("%T")
  end

  def self.upcoming_appts
    where('appointments.date >= ?', DateTime.now).order(date: :asc).order(time: :asc)
  end

  def self.past_appts
    where('appointments.date < ?', DateTime.now).order(date: :desc).order(time: :desc)
  end

  def self.upcoming_appts_for_vet(vet)
    self.upcoming_appts.where('appointments.vet_id == ?', vet.id)
  end

  def self.past_appts_for_vet(vet)
    self.past_appts.where('appointments.vet_id == ?', vet.id)
  end

  def self.upcoming_appts_for_pet(pet)
    self.upcoming_appts.where('appointments.pet_id == ?', pet.id)
  end

  def self.past_appts_for_pet(pet)
    self.past_appts.where('appointments.pet_id == ?', pet.id)
  end
end