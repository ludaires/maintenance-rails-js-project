class EquipmentController < ApplicationController

    def index
        @user = current_user
        @all_equipment = Equipment.all
        # respond_to do |f|
        #     f.html { render :index}
        #     f.json {render json: @all_equipment}
        render json: @all_equipment.to_json, status: 200
    end

    def show
        @user = current_user.id
        @equipment = Equipment.find_by(id: params[:id])
        render json: @equipment, status: 200
    end

end