class Api::MetricTablesController < ApplicationController
  def index
    @metric_tables = MetricTable.where(user_id: current_user.id)
    render "index.json.jb"
  end

  def day_index
    current_user_id = params[:id]
    @metric_tables = MetricTable.where("user_id = ? AND created_at >= ?", current_user_id, 1.month.ago)
    render "index.json.jb"
  end

  def show
    @metric_table = MetricTable.find(params[:id])
    render "show.json.jb"
  end

  def create
    @metric_table = MetricTable.new(
      # user_id: current_user.id,
      user_id: params[:user_id],
      apply: 0,
      breaks: 0,
      info_interview: 0,
      white_boarding_minutes: 0,
      portfolio_minutes: 0,
    )

    if @metric_table.save
      render "show.json.jb"
    else
      render json: { errors: @metric_table.errors.full_messages }, status: bad_request
    end
  end

  def update
    @metric_table = MetricTable.find(params[:id])

    # if current_user.id == @metric_table.user_id
      @metric_table.apply = params[:apply] || @metric_table.apply
      @metric_table.breaks = params[:breaks] || @metric_table.breaks
      @metric_table.info_interview = params[:info_interview] || @metric_table.info_interview
      @metric_table.white_boarding_minutes = params[:white_boarding_minutes] || @metric_table.white_boarding_minutes
      @metric_table.portfolio_minutes = params[:portfolio_minutes] || @metric_table.portfolio_minutes

      if @metric_table.save
        render "show.json.jb"
      else
        render json: { errors: @metric_table.error.full_messages }, status: bad_request
      end
    # end
  end

  def destroy
    @metric_table = MetricTable.find(params[:id])
    metric_table_id = params[:id]
    # if current_user.id == @metric_table.user_id
    @metric_table = MetricTable.find(metric_table_id)
    @metric_table.destroy
    render json: { message: "metric_table DESTROYED" }
    # end
  end
end
