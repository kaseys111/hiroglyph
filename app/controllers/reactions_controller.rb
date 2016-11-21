class ReactionsController < ApplicationController
  def index
    @reactions = Reaction.all

    render("reactions/index.html.erb")
  end

  def show
    @reaction = Reaction.find(params[:id])

    render("reactions/show.html.erb")
  end

  def new
    @reaction = Reaction.new

    render("reactions/new.html.erb")
  end

  def create
    @reaction = Reaction.new

    @reaction.reaction = params[:reaction]
    @reaction.status_id = params[:status_id]
    @reaction.user_id = params[:user_id]

    save_status = @reaction.save

    if save_status == true
      redirect_to("/reactions/#{@reaction.id}", :notice => "Reaction created successfully.")
    else
      render("reactions/new.html.erb")
    end
  end

  def edit
    @reaction = Reaction.find(params[:id])

    render("reactions/edit.html.erb")
  end

  def update
    @reaction = Reaction.find(params[:id])

    @reaction.reaction = params[:reaction]
    @reaction.status_id = params[:status_id]
    @reaction.user_id = params[:user_id]

    save_status = @reaction.save

    if save_status == true
      redirect_to("/reactions/#{@reaction.id}", :notice => "Reaction updated successfully.")
    else
      render("reactions/edit.html.erb")
    end
  end

  def destroy
    @reaction = Reaction.find(params[:id])

    @reaction.destroy

    if URI(request.referer).path == "/reactions/#{@reaction.id}"
      redirect_to("/", :notice => "Reaction deleted.")
    else
      redirect_to(:back, :notice => "Reaction deleted.")
    end
  end
end
