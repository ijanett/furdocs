class PetsController < ApplicationController
    before_action :login_required, only: [:show, :new]

    def show
        @pet = Pet.find(params[:id])
        if is_vet
            render :show
        elsif current_owner.id != @pet.owner.id
            redirect_to owner_url(current_owner), alert: "Uh-oh! Cannot get /owners/#{params[:id]}."
        end
    end

    def new
        if params[:owner_id].to_i != current_owner.id
            redirect_to owner_url(current_owner), alert: "Uh-oh! Wrong owner."
        else
            @pet = Pet.new(owner_id: params[:owner_id])
        end
    end

    def create
        @pet = Pet.find_or_create_by(pet_params)

        if @pet.save
            redirect_to owner_pet_url(@pet.owner, @pet)
        else
            render :new
        end
    end

    private

    def pet_params # would like to add an image attribute somehow
        params.require(:pet).permit(:name, :color, :breed, :dob, :species, :gender, :owner_id)
    end
end
