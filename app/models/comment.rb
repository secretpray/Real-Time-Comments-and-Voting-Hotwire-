class Comment < ApplicationRecord
  # include ActionView::RecordIdentifier
  belongs_to :user
  has_rich_text :content
  has_many :votes, dependent: :destroy

  after_create_commit do
    broadcast_append_to :comments,
      target: "comments",
      partial: "comments/comment_for_stream",
      locals: { comment: self }
  end

  def vote_count
    votes.sum(:choice)
  end
end
