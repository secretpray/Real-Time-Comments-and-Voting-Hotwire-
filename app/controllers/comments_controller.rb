class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]

  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = current_user.comments.new
  end

  def edit; end

  def create
    @comment = current_user.comments.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.turbo_stream {
          render turbo_stream: turbo_stream.replace("new_comment",
                                                     partial: "comments/form",
                                                    locals: { comment: Comment.new }
          )
        }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.turbo_stream
      else
        format.turbo_stream
      end
    end
  end

  def destroy
    if current_user.id != @comment.user.id
      flash.now[:alert] = "Not allowed!"
      @comment.render_not_allowed(current_user, flash)
      return
    end

    @comment.destroy
    # redirect_to comments_url, notice: "Comment was successfully destroyed."
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:user_id, :content)
  end
end
