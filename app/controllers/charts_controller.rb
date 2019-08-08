class ChartsController < ApplicationController

    def show
    end

    def new
        @chart = Chart.new(vet_id: params[:vet_id])
    end

    def create
        chart = Chart.find_or_create_by(chart_params)
        if chart.save
            redirect_to vet_chart_url(chart.vet, chart)
        else
            render :new
        end
    end
end
