class MedicalSessionsController < ApplicationController
    before_action :set_medical_session, only: [:update, :destroy, :show]
    
    def index
        medical_sessions = MedicalSession.all
        render json: ::MedicalSessionRepresenter.for_collection.new(medical_sessions),status: :ok
    end

    def create
        medical_session = MedicalSession.new(medical_session_params)
        if medical_session.save
            render json: ::MedicalSessionRepresenter.new(medical_session),status: :created
        else
            render json: {error: "No se pudo guardar"},status: :unprocessable_entity
        end
    end

    def update
        if @medical_session.update(medical_session_params)
            render json: ::MedicalSessionRepresenter.new(@medical_session),status: :ok
        else
            render json: {error: "No se pudo guardar"},status: :unprocessable_entity
        end    
    end

    private
    def medical_session_params
        params.permit(:date, :status)
    end

    def set_medical_session
        @medical_session = MedicalSession.find(params[:id])
    end
end
