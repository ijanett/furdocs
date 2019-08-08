class ClinicsController < ApplicationController
    before_action :login_required only: :index
    
    def index
        @clinics = Clinic.all
    end
end
