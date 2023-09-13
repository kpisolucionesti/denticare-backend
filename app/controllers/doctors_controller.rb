class DoctorsController < ApplicationController
    rescue_from  ActiveRecord::RecordNotFound, with: :doctor_not_found
    before_action :set_doctor, only: [:update, :destroy, :show]
    
    def index
        doctors = Doctor.all
        render json: DoctorRepresenter.for_collection.new(doctors),status: :ok
    end

    def create
        doctor = Doctor.new(doctor_params)
        if doctor.save
            render json: DoctorRepresenter.new(doctor),status: :created
        else
            render json: {error: "No se pudo guardar"},status: :unprocessable_entity
        end
    end

    def update
        if @doctor.update(doctor_params)
            render json: DoctorRepresenter.new(@doctor),status: :ok
        else
            render json: {error: "No se pudo guardar"},status: :unprocessable_entity
        end    
    end

    def show
        render json: DoctorRepresenter.new(@doctor),status: :ok
    end

    def destroy
        @doctor.destroy
        render json: {}, status: :no_content
    end

    private
    def doctor_params
        params.permit(:first_name, :last_name)
    end

    def set_doctor
        @doctor = Doctor.find(params[:id])
    end

    def doctor_not_found
        render json: { error: "Doctor not found" }, status: :not_found
    end
end
