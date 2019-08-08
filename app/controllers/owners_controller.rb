class OwnersController < ApplicationController
    before_action :login_required, only: :show
    
    def show
        @owner = Owner.find(params[:id])
    end
end
