class PetsController < ApplicationController

    def index
        @pets = Pet.all.where(owner_id: params[:owner_id])
    end

    def show
        @pet = Pet.find(params[:id])
    end

    def new
        @pet = Pet.new(owner_id: params[:owner_id])
    end

    def create
        @pet = Pet.new(pet_params)

        if @pet.valid?
            @pet.save
            redirect_to owner_pet_url(@pet.owner, @pet)
        end
    end

    private

    def pet_params
        params.require(:pet).permit(:name, :color, :breed, :dob, :gender, :owner_id)
    end
end
