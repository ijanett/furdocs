class AppointmentsController < ApplicationController
    before_action :login_required, only: [:show, :new]
    before_action :set_appt, only: [:show, :update, :destroy]

    def show
    end

    def new
        if is_vet
            if is_vet.id != params[:vet_id].to_i
                flash[:notice] = "Uh-oh! Wrong vet."
                redirect_to vet_url(is_vet)
            else
                @appointment = Appointment.new(vet_id: params[:vet_id])
            end
        else
            pet = Pet.find_by(id: params[:pet_id])
            if current_owner.id != pet.owner.id
                flash[:notice] = "Uh-oh! Cannot get /owners/#{params[:id]}."
                redirect_to owner_url(current_owner)
            else
                @appointment = Appointment.new(pet_id: params[:pet_id])
            end
        end
    end
  
    def create
        @appointment = Appointment.find_or_create_by(appt_params)

        if @appointment.save
            if is_vet
                redirect_to vet_appointment_url(@appointment.vet, @appointment)
            elsif current_owner
                redirect_to pet_appointment_url(@appointment.pet, @appointment)
            end
        else
            render :new
        end
    end

    def edit
        if params[:vet_id]
            vet = Vet.find_by(id: params[:vet_id])
            if vet.nil?
                redirect_to vet_url(is_vet), alert: "Vet not found."
            else
                @appointment = vet.appointments.find_by(id: params[:id])
                redirect_to vet_url(is_vet), alert: "Uh-oh! Something went wrong. Please try again." if @appointment.nil?
            end
        else
            @appointment = Appointment.find(params[:id])
        end
    end

    def update
        if @appointment.update(appt_params)
            redirect_to vet_appointment_url(@appointment.vet, @appointment)
        else
            render :edit
        end
    end

    def destroy
        @appointment.destroy
        redirect_to vet_url(@appointment.vet)
    end

    private

    def appt_params
        params.required(:appointment).permit(:vet_id, :pet_id, :date, :time)
    end

    def set_appt
        @appointment = Appointment.find(params[:id])
    end
end
