class InspectionsController < ApplicationController
    before_action :set_maintenance, only: [:new, :create, :show, :edit, :update, :destroy]
    before_action :redirect_if_not_authorized!, only: [:new, :create, :edit, :update, :destroy]

    def new
        @inspection = @maintenance.inspections.build
    end

    def create
        @inspection = @maintenance.inspections.build(inspections_params)
        if @inspection.save
            redirect_to maintenance_inspection_path(@maintenance, @inspection)
        else
            flash[:message] = "Something went wrong: #{@inspection.errors.full_messages.to_sentence}"
            redirect_to new_maintenance_inspection_path(@maintenance)
        end
    end

    def show
        @inspection = Inspection.find_by(id: params[:id])
    end
    
    def edit
        @inspection = @maintenance.inspections.find_by(id: params[:id])
    end

    def update
        @inspection = @maintenance.inspections.find_by(id: params[:id])
        if @inspection.update(inspections_params)
            redirect_to maintenance_path(@maintenance)
        else
            flash[:message] = "Something went wrong: #{@inspection.errors.full_messages.to_sentence}"
            redirect_to edit_maintenance_inspection_path(@maintenance, @inspection)
        end
    end

    def destroy
        @inspection = Inspection.find_by(id: params[:id])
        @inspection.delete
        redirect_to maintenance_path(@maintenance)
    end

    private
    def inspections_params
        params.require(:inspection).permit(:part_id, :issue_id, :cause_id, :action_id)
    end

    def set_maintenance
        @maintenance = Maintenance.find_by(id: params[:maintenance_id])
    end

    def redirect_if_not_authorized!
        if @maintenance.user != current_user && !current_user.admin
            flash[:message] = "You user don't have the permission to make this action!"
            redirect_to user_path(current_user)
        end
    end



end