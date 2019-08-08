class OwnersController < ApplicationController
    before_action :login_required

    def show
        @owner = Owner.find(params[:id])
    end
end
