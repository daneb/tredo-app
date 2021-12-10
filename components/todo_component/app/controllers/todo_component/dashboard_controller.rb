require_dependency "todo_component/application_controller"

module TodoComponent
  class DashboardController < ApplicationController
    def index
    end

    def create
      if helpers.create_a_todo(params[:name])
        flash[:notice] = "Created successfully."
        redirect_to action: "index"
      else
        flash.now[:error] = "Failed to created todo."
        render :new
      end
    end

    def new
    end
  end
end
