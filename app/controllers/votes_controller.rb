class VotesController < ApplicationController
  include ActionView::RecordIdentifier
  before_action :authenticate_user!

  def show
    @comment = Comment.find(params[:comment_id])
    @vote = Vote.find_or_create_by(user: current_user, comment: @comment)
    @vote.voted(params[:choice])
    author = @vote.user
    # only author
    flash.now[:notice] = "Thanks for voting!"
    @vote.render_flash_rating(author, flash)
    @vote.update_title(author, params[:choice])
  end
end
