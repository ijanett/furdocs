class PetsController < ApplicationController
    before_action :login_required, only: [:show, :new]

    def show
        @pet = Pet.find(params[:id])
    end

    def new
        @pet = Pet.new(owner_id: params[:owner_id])
    end

    def create
        @pet = Pet.find_or_create_by(pet_params)

        if @pet.save
            redirect_to owner_pet_url(@pet.owner, @pet)
        end
    end

    private

    def pet_params
        params.require(:pet).permit(:name, :color, :breed, :dob, :gender, :owner_id)
    end
end
