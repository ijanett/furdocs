module PetsHelper

    def birthdate(pet)
        pet.dob.strftime("%b %d, %Y")
    end
end
