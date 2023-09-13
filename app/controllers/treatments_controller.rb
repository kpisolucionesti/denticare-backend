class TreatmentsController < ApplicationController
    rescue_from  ActiveRecord::RecordNotFound, with: :treatment_not_found
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

    def show
        render json: TreatmentRepresenter.new(@treatment),status: :ok
    end

    def destroy
        @treatment.destroy
        render json: {}, status: :no_content
    end

    private
    def treatment_params
        params.permit(:name, :amount)
    end

    def set_treatment
        @treatment = Treatment.find(params[:id])
    end

    def treatment_not_found
        render json: { error: "Treatment not found" }, status: :not_found
    end
end
