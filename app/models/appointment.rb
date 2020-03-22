class Appointment < ApplicationRecord
  belongs_to :vet
  belongs_to :pet

  validates_presence_of :vet_id, :pet_id, :date, :time
  validates_uniqueness_of :time, {scope: [:date, :vet_id], message: "unavailable, please choose a different time"}
  validate :date_cannot_be_in_the_past
  validate :time_cannot_be_in_the_past

  def date_cannot_be_in_the_past
    errors.add(:date, "can't be in the past") if !date.blank? && date < Date.today
  end

  def time_cannot_be_in_the_past
    errors.add(:time, "can't be in the past") if date == Date.today && time.strftime("%T") < Time.current.strftime("%T")
  end

  # def self.upcoming_appts
  #   # only seeing upcoming appointments with: Time.current.strftime("%l:%M") , but still time is not accurate
  #   where('date >= ? AND time >= ?', Date.today, Time.current.strftime("%k:%M")).order(date: :asc, time: :asc)
  # end

  def self.future_date_apts
    where('date > ?', Date.today)
  end

  def self.future_time_apts
    where('date = ? AND time > ?', Date.today, Time.new(2000, 1, 1, Time.current.hour, Time.current.min))
  end

  # def self.past_appts
  #   where('date <= ? AND time < ?', Date.today, Time.current.strftime("%T")).where('date = ? AND time < ?').order(date: :desc, time: :desc)
  # end

  def self.prev_date_apts
    where('date < ?', Date.today)
  end

  def self.prev_time_apts
    where('date = ? AND time < ?', Date.today, Time.new(2000, 1, 1, Time.current.hour, Time.current.min))
  end

  def self.future_vet_apts(v)
    self.future_date_apts.where('appointments.vet_id = ?', v.id) + self.future_time_apts.where('appointments.vet_id = ?', v.id).order(date: :asc, time: :asc)
  end

  def self.prev_vet_apts(v)
    self.prev_date_apts.where('appointments.vet_id = ?', v.id) + self.prev_time_apts.where('appointments.vet_id = ?', v.id).order(date: :desc, time: :desc)
  end

  # def self.upcoming_appts_for_vet(vet)
  #   self.upcoming_appts.where('appointments.vet_id = ?', vet.id)
  # end

  # def self.past_appts_for_vet(vet)
  #   self.past_appts.where('appointments.vet_id = ?', vet.id)
  # end

  def self.future_pet_apts(p)
    self.future_date_apts.where('appointments.pet_id = ?', p.id) + self.future_time_apts.where('appointments.pet_id = ?', p.id).order(date: :asc, time: :asc)
  end

  def self.prev_pet_apts(p)
    self.prev_date_apts.where('appointments.pet_id = ?', p.id) + self.prev_time_apts.where('appointments.pet_id = ?', p.id).order(date: :desc, time: :desc)
  end

  # def self.upcoming_appts_for_pet(pet)
  #   self.upcoming_appts.where('appointments.pet_id = ?', pet.id)
  # end

  # def self.past_appts_for_pet(pet)
  #   self.past_appts.where('appointments.pet_id = ?', pet.id)
  # end
end