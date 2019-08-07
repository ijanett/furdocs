class Vet < ApplicationRecord
    has_many :appointments
    has_many :pets, through: :appointments
    has_many :charts
    belongs_to :clinic
    has_secure_password

    def full_name
        self.first_name + " " + self.last_name
    end

    def full_dr_name
        "Dr. " + self.first_name + " " + self.last_name
    end
end
