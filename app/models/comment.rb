class Comment < ApplicationRecord
  belongs_to :user
  has_rich_text :content
  has_many :votes, dependent: :destroy

  after_create_commit do
    broadcast_append_to :comments, target: "comments", partial: "comments/comment_for_stream", locals: { comment: self }
    update_counter
  end

  after_destroy_commit do
    broadcast_remove_to :comments
    update_counter
  end

  def vote_count
    votes.sum(:choice)
  end

  def render_not_allowed(user, flash)
     broadcast_update_to([user, :comments], target: :notifications, partial: 'shared/flash', locals: { flash: flash })
  end

  private

  def update_counter
    broadcast_update_to :comments, target: "comments_counter", partial: 'comments/count', locals: { count: Comment.count }
  end
end
