class RoomsController < ApplicationController
    before_action :set_room, only: [:update, :destroy, :show]
    
    def index
        rooms = Room.all
        render json: RoomRepresenter.for_collection.new(rooms),status: :ok
    end

    def create
        room = Room.new(room_params)
        if room.save
            render json: RoomRepresenter.new(room),status: :created
        else
            render json: {error: "No se pudo guardar"},status: :unprocessable_entity
        end
    end

    def update
        if @room.update(room_params)
            render json: RoomRepresenter.new(@room),status: :ok
        else
            render json: {error: "No se pudo guardar"},status: :unprocessable_entity
        end    
    end

    private
    def room_params
        params.permit(:name)
    end

    def set_patient
        @room = Room.find(params[:id])
    end
end
