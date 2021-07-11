class Api::ContactsController < ApplicationController
  def index
    @contacts = Contact.where(user_id: current_user.id)
    render "index.json.jb"
  end

  def create
    @contact = Contact.new(
      user_id: params[:user_id],
      job_id: params[:job_id],
      name: params[:name],
      email: params[:email],
      job_title: params[:job_title],
      linkedin_url: params[:linkedin_url],
      phone: params[:phone],
      date_contacted: params[:date_contacted],
    )

    if @contact.save
      render "show.json.jb"
    else
      render json: { errors: @contact.error.full_messages }, status: bad_request
    end
  end

  def show
    @contact = Contact.find(params[:id])
    render "show.json.jb"
  end

  def update
    @contact = Contact.find(params[:id])

    @contact.job_id = params[:job_id] || @contact.job_id
    @contact.name = params[:name] || @contact.name
    @contact.email = params[:email] || @contact.email
    @contact.job_title = params[:job_title] || @contact.job_title
    @contact.linkedin_url = params[:linkedin_url] || @contact.linkedin_url
    @contact.phone = params[:phone] || @contact.phone
    @contact.date_contacted = params[:date_contacted] || @contact.date_contacted

    if @contact.save
      render "show.json.jb"
    else
      render json: { errors: @contact.error.full_messages }, status: bad_request
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    if current_user.id == @contact.user_id
      @contact.destroy
      render json: { message: "the contact was destroyed" }
    else
      render json: { message: "unauthorized" }, status: bad_request
    end
  end
end
