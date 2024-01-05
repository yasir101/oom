class SpendingLogsController < ApplicationController
  before_action :set_spending_log, only: %i[edit update]

  def index
    @spending_logs = SpendingLog.all.order("spending_date DESC")
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

  def edit; end

  def update
    if @spending_log.update!(spending_logs_params)
      redirect_to spending_logs_path
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  private

  def set_spending_log
    @spending_log = SpendingLog.find_by(id: params['id'])
  end

  def spending_logs_params
    params.require(:spending_log).permit(:spending_date, :spending_type, :action, :amount, :quantity, :description)
  end
end
