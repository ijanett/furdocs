class VetsController < ApplicationController
    before_action :login_required, only: :show

    def show
        @vet = Vet.find_by(id: params[:id])
        if @vet.nil? || @vet.id != is_vet.id
            redirect_to vet_url(is_vet), alert: "Something went wrong."
        end
    end

    def new
        @vet = Vet.new
    end

    def create
        @vet = Vet.create(vet_params)

        # byebug
        if @vet.save
            log_in(@vet)
            redirect_to vet_url(@vet)
        else
            render :new
        end
    end


    private

    def vet_params
        params.require(:vet).permit(:first_name, :last_name, :email, :password, :password_confirmation, :clinic_id)
    end
end
