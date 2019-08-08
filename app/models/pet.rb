class Pet < ApplicationRecord
  belongs_to :owner
  has_many :appointments
  has_many :vets, through: :appointments
  has_many :charts

  enum gender: [ :male, :female ]

  def age
    now = Time.current
    now.year - self.dob.year - ((now.month > self.dob.month || (now.month == self.dob.month && now.day >= self.dob.day)) ? 0 : 1)
  end
end
