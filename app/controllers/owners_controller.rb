class OwnersController < ApplicationController
    before_action :login_required

    def show
        @owner = Owner.find(params[:id])
        if @owner.nil? || @owner.id != current_owner.id
            redirect_to owner_path(current_owner), alert: "Something went wrong."
        end
    end
end
