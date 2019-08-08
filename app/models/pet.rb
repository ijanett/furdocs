class Pet < ApplicationRecord
  belongs_to :owner
  has_many :appointments
  has_many :vets, through: :appointments
  has_many :charts

  enum gender: [ :male, :female ]

  def age
    ((Time.zone.now - self.dob.to_time) / 1.year.seconds).floor
  end
end
