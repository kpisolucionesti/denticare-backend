class MedicalSessionsController < ApplicationController
    before_action :set_medicalsession, only: [:update, :destroy, :show]
    
    def index
        medicalsessions = MedicalSession.all
        render json: MedicalSessionRepresenter.for_collection.new(medicalsessions),status: :ok
    end

    def create
        medicalsession = MedicalSession.new(medicalsession_params)
        if medicalsession.save
            render json: MedicalSessionRepresenter.new(medicalsession),status: :created
        else
            render json: {error: "No se pudo guardar"},status: :unprocessable_entity
        end
    end

    def update
        if @medicalsession.update(medicalsession_params)
            render json: MedicalSessionRepresenter.new(@medicalsession),status: :ok
        else
            render json: {error: "No se pudo guardar"},status: :unprocessable_entity
        end    
    end

    private
    def medicalsession_params
        params.permit(:status, :check_in, :room_id, :patient_id, :doctor_id, :treatment_id)
    end

    def set_medicalsession
        @medicalsession = MedicalSession.find(params[:id])
    end
end
