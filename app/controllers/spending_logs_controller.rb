class SpendingLogsController < ApplicationController
  def index
    @spending_logs = SpendingLog.all.order("created_at DESC")
  end

  def new
    @spending_log = SpendingLog.new
  end

  def create
    @spending_log = SpendingLog.new(spending_logs_params)
    if @spending_log.save
      redirect_to spending_logs_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def spending_logs_params
    params.require(:spending_log).permit(:spending_type, :action, :amount, :quantity, :description)
  end
end
