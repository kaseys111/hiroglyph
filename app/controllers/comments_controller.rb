class CommentsController < ApplicationController
  def index
    @comments = Comment.all

    render("comments/index.html.erb")
  end

  def show
    @comment = Comment.find(params[:id])

    render("comments/show.html.erb")
  end

  def new
    @comment = Comment.new
    @status = Status.find(params[:id])

    render("comments/new.html.erb")
  end

  def create
    @comment = Comment.new

    @comment.body = params[:body]
    @comment.status_id = params[:status_id]
    @comment.user_id = params[:user_id]

    save_status = @comment.save

    if save_status == true
      redirect_to(:back)
    else
      render("comments/new.html.erb")
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @status = Status.find(@comment.status_id)

    render("comments/edit.html.erb")
  end

  def update
    @comment = Comment.find(params[:id])

    @comment.body = params[:body]
    @comment.status_id = params[:status_id]
    @comment.user_id = params[:user_id]

    save_status = @comment.save

    if save_status == true
      redirect_to(:back)
    else
      render("comments/edit.html.erb")
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    @comment.destroy

    if URI(request.referer).path == "/comments/#{@comment.id}"
      redirect_to("/")
    else
      redirect_to(:back)
    end
  end
end
