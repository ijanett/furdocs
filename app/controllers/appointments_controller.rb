class AppointmentsController < ApplicationController
    before_action :login_required, only: [:show, :new]

    def show
        @appointment = Appointment.find(params[:id])
    end

    def new
        if is_vet
            @appointment = Appointment.new(vet_id: params[:vet_id])
        else
            @appointment = Appointment.new(pet_id: params[:pet_id])
        end
    end
  
    def create
        @appointment = Appointment.find_or_create_by(appt_params)

        if @appointment.save
            if is_vet
                redirect_to vet_appointment_path(@appointment.vet, @appointment)
            elsif current_owner
                redirect_to pet_appointment_path(@appointment.pet, @appointment)
            end
        end
    end

    private

    def appt_params
        params.required(:appointment).permit(:vet_id, :pet_id, :date, :time)
    end
end
