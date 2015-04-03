class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.html do
          flash[:notice] = "Comment successfully saved!"
          redirect_to post_path(@comment.post)
        end

        format.js do
          flash.now[:notice] = "Comment successfully saved!"
        end
      end
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if @comment.update(comment_params)
      respond_to do |format|
        format.html do
          flash[:notice] = 'Comment successfully updated!'
          redirect_to post_path(@comment.post)
        end

        format.js do
          flash.now[:notice] = 'Comment successfully updated!'
        end
      end
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html do
        flash[:notice] = "Comment successfully deleted!"
        redirect_to post_path(@post)
      end

      format.js do
        flash.now[:notice] = "Comment successfully deleted!"
      end
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :user_id)
    end
end
