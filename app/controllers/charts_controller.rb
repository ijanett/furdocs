class ChartsController < ApplicationController
    before_action :login_required, only: [:show, :new]

    def show
        @chart = Chart.find(params[:id])
    end

    def new
        @chart = Chart.new(vet_id: params[:vet_id])
    end

    def create
        @chart = Chart.find_or_create_by(chart_params)
        if @chart.save
            redirect_to vet_chart_url(@chart.vet, @chart)
        else
            render :new
        end
    end

    private

    def chart_params
        params.require(:chart).permit(:vet_id, :pet_id, :vaccination, :medication, :diagnosis, :note)
    end
end
