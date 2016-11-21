class StatusesController < ApplicationController
  def index
    @statuses = Status.all.order(created_at: :desc)

    render("statuses/index.html.erb")
  end

  def show
    @status = Status.find(params[:id])

    render("statuses/show.html.erb")
  end

  def new
    @status = Status.new

    render("statuses/new.html.erb")
  end

  def create
    @status = Status.new

    @status.status = params[:status]
    @status.user_id = params[:user_id]

    save_status = @status.save

    if save_status == true
      redirect_to(:back)
    else
      render("statuses/new.html.erb")
    end
  end

  def edit
    @status = Status.find(params[:id])

    render("statuses/edit.html.erb")
  end

  def update
    @status = Status.find(params[:id])

    @status.status = params[:status]
    @status.user_id = params[:user_id]

    save_status = @status.save

    if save_status == true
      redirect_to("/users/#{@status.user_id}")
    else
      render("statuses/edit.html.erb")
    end
  end

  def destroy
    @status = Status.find(params[:id])

    @status.destroy

    if URI(request.referer).path == "/statuses/#{@status.id}"
      redirect_to("/")
    else
      redirect_to(:back)
    end
  end
end
