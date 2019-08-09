class ClinicsController < ApplicationController
    before_action :login_required
    
    def index
        @clinics = Clinic.all
    end

    def show
        @clinic = Clinic.find(params[:id])
    end
end
