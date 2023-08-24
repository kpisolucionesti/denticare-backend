class TreatmentsController < ApplicationController
    before_action :set_treatment, only: [:update, :destroy, :show]
    
    def index
        treatments = Treatment.all
        render json: TreatmentRepresenter.for_collection.new(treatments),status: :ok
    end

    def create
        treatment = Treatment.new(treatment_params)
        if treatment.save
            render json: TreatmentRepresenter.new(treatment),status: :created
        else
            render json: {error: "No se pudo guardar"},status: :unprocessable_entity
        end
    end

    def update
        if @treatment.update(treatment_params)
            render json: TreatmentRepresenter.new(@treatment),status: :ok
        else
            render json: {error: "No se pudo guardar"},status: :unprocessable_entity
        end    
    end

    private
    def treatment_params
        params.permit(:name, :amount)
    end

    def set_treatment
        @treatment = Treatment.find(params[:id])
    end
end
