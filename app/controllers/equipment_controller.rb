class EquipmentController < ApplicationController
    before_action :set_user, only: [:index, :show, :new, :create] 

    def index
        @all_equipment = Equipment.all
        render json: @all_equipment.to_json, status: 200
    end

    def show
        @equipment = Equipment.find_by(id: params[:id])
        render json: @equipment, status: 200
    end

    def new 
        @equipment = Equipment.new
    end

    def create
        @equipment = Equipment.new(equipment_params)
        if @equipment.save
            render json: @equipment, status: 200
        else
            flash[:message] = "Something went wrong: #{@equipment.errors.full_messages.to_sentence}"
            render new_user_equipment_path
        end
    end

    private

    def set_user
        @user = User.find_by(id: params[:id])
    end

    def equipment_params
        params.require(:equipment).permit(
            :name,
            :code,
            :location,            
            :calibration_unit,
            :calibration_start,
            :calibration_end,
            :uncertainty
        )
    end
end