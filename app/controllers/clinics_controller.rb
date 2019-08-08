class ClinicsController < ApplicationController
    before_action :login_required
    
    def index
        @clinics = Clinic.all
    end
end
