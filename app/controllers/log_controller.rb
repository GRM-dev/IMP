class LogController < ApplicationController
  before_action :require_user

  def show
    @logs = Log.all
  end

  def create
    @logs = Log.new(log_params)
    if @log.save
      format.js
    else
      format.js
    end
  end

  private
    def log_params
      params.require(:log).permit(:user, :log_type)
    end
end