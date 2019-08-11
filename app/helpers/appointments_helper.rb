module AppointmentsHelper

    def appt_date(appt)
        appt.date.strftime("%b %d, %Y")
    end
    
    def appt_time(appt)
        appt.time.strftime("%l:%M %p")
    end

    def vet_clinic(appt)
        appt.vet.clinic
    end
end
