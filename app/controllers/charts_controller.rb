class ChartsController < ApplicationController
    before_action :login_required, only: [:show, :new, :edit]
    before_action :set_chart, only: [:show, :update, :destroy]

    def show
    end

    def new
        if is_vet.id != params[:vet_id].to_i
            flash[:notice] = "Uh-oh! Wrong vet."
            redirect_to vet_url(is_vet)
        else
            @chart = Chart.new(vet_id: params[:vet_id])
        end
    end

    def create
        @chart = Chart.find_or_create_by(chart_params)
        if @chart.save
            redirect_to vet_chart_url(@chart.vet, @chart)
        else
            render :new
        end
    end

    def edit
        if params[:vet_id]
            vet = Vet.find_by(id: params[:vet_id])
            if vet.nil?
                redirect_to vet_url(is_vet), alert: "Vet not found."
            else
                @chart = vet.charts.find_by(id: params[:id])
                redirect_to vet_url(is_vet), alert: "Chart not found." if @chart.nil?
            end
        else
            @chart = Chart.find(params[:id])
        end
    end

    def update
        if @chart.update(chart_params)
            redirect_to vet_chart_url(@chart.vet, @chart)
        else
            render :edit
        end
    end

    def destroy
        @chart.destroy
        redirect_to vet_path(@chart.vet)
    end

    private

    def chart_params
        params.require(:chart).permit(:vet_id, :pet_id, :vaccination, :medication, :diagnosis, :note)
    end

    def set_chart
        @chart = Chart.find(params[:id])
    end
end
