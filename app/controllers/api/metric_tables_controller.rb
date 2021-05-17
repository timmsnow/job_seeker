class Api::MetricTablesController < ApplicationController

  def index
    @metric_tables = MetricTable.where(user_id: current_user.id)
    render "index.json.jb"
  end

  def show
    @metric_table = MetricTable.find(params[:id])
    render "show.json.jb"
  end

  def create
    @metric_table = MetricTable.new(
      user_id: current_user.id,
      quick_apply: 0,
      intentional_apply: 0,
      info_interview: 0,
      white_boarding_minutes: 0,
      portfolio_minutes: 0,
    )

    if @metric_table.save
      render "show.json.jb"
    else
      render json: {errors: @metric_table.error.full_messages}, status: bad_request
    end
  end

  def update
    @metric_table = MetricTable.find(params[:id])

    if current_user.id == @metric_table.user_id
      @metric_table.quick_apply = params[:quick_apply] || @metric_table.quick_apply
      @metric_table.intentional_apply = params[:intentional_apply] || @metric_table.intentional_apply
      @metric_table.info_interview = params[:info_interview] || @metric_table.info_interview
      @metric_table.white_boarding_minutes = params[:white_boarding_minutes] || @metric_table.white_boarding_minutes
      @metric_table.portfolio_minutes = params[:portfolio_minutes] || @metric_table.portfolio_minutes
     
      if @metric_table.save
        render "show.json.jb"
      else
        render json: {errors: @metric_table.error.full_messages}, status: bad_request
      end
    end
  end


end