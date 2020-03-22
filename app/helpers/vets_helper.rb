module VetsHelper

    #def vet_upcoming_appts(vet)
       # Appointment.upcoming_appts_for_vet(vet)
    #end

    def vet_upcoming_appts(vet)
        Appointment.future_vet_apts(vet)
    end

    def vet_past_appts(vet)
        Appointment.prev_vet_apts(vet)
    end

    #def vet_past_appts(vet)
        #Appointment.past_appts_for_vet(vet)
    #end
end
