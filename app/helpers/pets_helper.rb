module PetsHelper

    def birthdate(pet)
        pet.dob.strftime("%b %d, %Y")
    end

    def pet_upcoming_appts(pet)
        Appointment.upcoming_appts_for_pet(pet)
    end

    def pets_ordered
        Pet.all.order(:name)
    end

    # creates a hash with the two species as keys, each pointing at an array of pets
    # this hash is then passed to the grouped_options_for_select which converts it to the 
    # <OPTIONS> tags including proper <OPTGROUP> tags. This helper also supports setting the currently selected
    # value in the select options. Its output is then passed to the select tag in the view template
    def grouped_pets_for_select(selected_pet_id = nil)
        options = {}
        Pet.species.keys.each do |s| 
          options[s.capitalize] = Pet.with_species(s).pluck(:name, :id)
        end
        grouped_options_for_select(options, selected_pet_id)
    end
end
