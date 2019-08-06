class Vet < ApplicationRecord
    has_many :appointments
    has_many :pets, through: :appointments
    has_many :charts
    belongs_to :clinic
    has_secure_password
end
