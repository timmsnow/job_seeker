class Api::JobsController < ApplicationController
  def index
    # @jobs = Job.where(user_id: current_user.id)
    @jobs = @current_user.jobs
    render "index.json.jb"
  end

  def show
    @job = Job.find(params[:id])
    render "show.json.jb"
  end

  def create
    @job = Job.new(
      user_id: params[:user_id],
      company_name: params[:company_name],
      position: params[:position],
      description: params[:description],
      status: params[:status],
      salary: params[:salary],
      posting_url: params[:posting_url],
      notes: params[:notes],
      date_updated: params[:date_updated],
    )
    if @job.save
      render "show.json.jb"
    else
      render json: { errors: @job.errors.full_messages }, status: :bad_request
    end
  end

  def update
    @job = Job.find(params[:id])

    # if current_user.id == @job.user_id
    @job.company_name = params[:company_name] || @job.company_name
    @job.position = params[:position] || @job.position
    @job.description = params[:description] || @job.description
    @job.status = params[:status] || @job.status
    @job.salary = params[:salary] || @job.salary
    @job.posting_url = params[:posting_url] || @job.posting_url
    @job.notes = params[:notes] || @job.notes
    @job.date_updated = params[:date_updated] || @job.date_updated
    #happy/sad path
    if @job.save
      render json: { message: "you did it" }
    else
      render json: { error: @job.errors.full_messages }, status: 400
    end
    # end
  end

  def destroy
    @job = Job.find(params[:id])
    job_id = params[:id]
    # if current_user.id == @job.user_id
    @job = Job.find(job_id)
    @job.destroy
    render json: { message: "job DESTROYED" }
    # end
  end
end
