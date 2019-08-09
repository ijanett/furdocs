class Vet < ApplicationRecord
    has_many :appointments
    has_many :pets, through: :appointments
    has_many :charts
    belongs_to :clinic
    has_secure_password
    
    validates :email, presence: true, uniqueness: true, format: { with: /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i }
    validates :password, presence: true, confirmation: true, length: { minimum: 6 }

    def full_name
        self.first_name.capitalize + " " + self.last_name.capitalize
    end

    def full_dr_name
        "Dr. " + self.full_name
    end

    def appointment_count
        "You have " + self.appointments.count.to_s + " upcoming appointments."
    end
end
