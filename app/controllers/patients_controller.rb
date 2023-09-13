class PatientsController < ApplicationController
    rescue_from  ActiveRecord::RecordNotFound, with: :patient_not_found
    before_action :set_patient, only: [:update, :destroy, :show]
    
    def index
        patients = Patient.all
        render json: PatientRepresenter.for_collection.new(patients),status: :ok
    end

    def create
        patient = Patient.new(patient_params)
        if patient.save
            render json: PatientRepresenter.new(patient),status: :created
        else
            render json: {error: "No se pudo guardar"},status: :unprocessable_entity
        end
    end

    def update
        if @patient.update(patient_params)
            render json: PatientRepresenter.new(@patient),status: :ok
        else
            render json: {error: "No se pudo guardar"},status: :unprocessable_entity
        end    
    end

    def show
        render json: PatientRepresenter.new(@patient),status: :ok
    end

    def destroy
        @patient.destroy
        render json: {}, status: :no_content
    end

    private
    def patient_params
        params.permit(:ci, :first_name, :last_name, :gender, :birth_date, :balance, :phone)
    end

    def set_patient
        @patient = Patient.find(params[:id])
    end

    def patient_not_found
        render json: { error: "Patient not found" }, status: :not_found
    end
end
