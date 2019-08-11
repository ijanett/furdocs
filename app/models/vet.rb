class Vet < ApplicationRecord
    has_many :appointments
    has_many :pets, through: :appointments
    has_many :charts
    belongs_to :clinic
    has_secure_password
    
    validates :email, presence: true, uniqueness: true, format: { with: /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i }
    validates :password, presence: true, confirmation: true, length: { minimum: 6 }
    validates_presence_of :first_name, :last_name, :clinic_id

    def full_name
        self.first_name.capitalize + " " + self.last_name.capitalize
    end

    def full_dr_name
        "Dr. " + self.full_name
    end

    def dr_last_name
        "Dr. " + self.last_name
    end

    def appointment_count
        "You have " + Appointment.upcoming_appts_for_vet(self).count.to_s + " upcoming appointment(s)."
    end
end
