class Pet < ApplicationRecord
  belongs_to :owner
  has_many :appointments
  has_many :vets, through: :appointments
  has_many :charts

  enum gender: [ :male, :female ]

  validates_presence_of :name, :breed, :color, :dob, :gender

  def age_years
    now = Time.current
    now.year - self.dob.year - ((now.month > self.dob.month || (now.month == self.dob.month && now.day >= self.dob.day)) ? 0 : 1)
  end

  def age_months
    if age_years == 0
      now = Time.current
      now.month - self.dob.month - ((now.day >= self.dob.day || now.day < self.dob.day) ? 0 : 1)
    end
  end
end
