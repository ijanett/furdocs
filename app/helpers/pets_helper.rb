module PetsHelper

    def birthdate(pet)
        pet.dob.strftime("%b %d, %Y")
    end

    def pet_upcoming_appts(pet)
        Appointment.upcoming_appts_for_pet(pet)
    end
end
