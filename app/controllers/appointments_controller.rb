class AppointmentsController < ApplicationController

    def new
        @appointment = Appointment.new(vet_id: params[:vet_id])
    end
  
    def create
        @appointment = Appointment.new(appt_params)

        if @appointment.valid?
            @appointment.save
            redirect_to vet_appointment(@appointment)
    end

    private

    def appt_params
        params.required(:appointment).permit(:vet_id, :vet_id, :date, :time)
    end
end
