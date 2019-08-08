class AppointmentsController < ApplicationController

    def show
    end

    def new
        if is_vet
            @appointment = Appointment.new(vet_id: params[:vet_id])
        else
            @appointment = Appointment.new(pet_id: params[:pet_id])
        end
    end
  
    def create
        @appointment = Appointment.new(appt_params)

        if @appointment.valid?
            @appointment.save
            if is_vet
                redirect_to vet_appointment(@appointment)
            elsif current_owner
                redirect_to pet_appointment(@appointment)
            end
        end
    end

    private

    def appt_params
        params.required(:appointment).permit(:vet_id, :pet_id, :date, :time)
    end
end
