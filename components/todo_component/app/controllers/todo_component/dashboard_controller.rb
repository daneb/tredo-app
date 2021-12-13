require_dependency "todo_component/application_controller"

module TodoComponent
  class DashboardController < ApplicationController
    skip_before_action :verify_authenticity_token, :only => [:callback]

    def index
    end

    def create
      if helpers.create_a_todo(params[:name])
        flash[:notice] = "Created successfully."
        Rails.cache.clear
        redirect_to action: "index"
      else
        flash.now[:error] = "Failed to created todo."
        render :new
      end
    end

    def new
    end

    def callback
      list_before = params["dashboard"]["action"]["data"]["listBefore"]["id"]
      list_after = params["dashboard"]["action"]["data"]["listAfter"]["id"]
      list_name = params["dashboard"]["action"]["data"]["listAfter"]["name"]
      card_name = params["dashboard"]["action"]["data"]["card"]["name"]
      logger.debug "Card '#{card_name}' moved to '#{list_name}'"

      render status: 200, json: @controller
    rescue NoMethodError
      logger.warn "Failure in webhooks"
      render status: 500, json: @controller
    end
  end
end
