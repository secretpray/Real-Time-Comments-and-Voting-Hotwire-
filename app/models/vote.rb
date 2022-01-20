class Vote < ApplicationRecord
  include ActionView::RecordIdentifier
  include ApplicationHelper

  belongs_to :user
  belongs_to :comment
  enum choice: { up_vote: 1, down_vote: -1, cancel: 0 }

  def voted(choice)
    return unless choice.in?(Vote::choices.keys)

    case choice
    when 'up_vote'
      up_vote? ? cancel! : up_vote!
    when 'down_vote'
      down_vote? ? cancel! : down_vote!
    end
  end

  after_update_commit do
    broadcast_update_to("comments", target: "#{dom_id(comment)}_count", html: comment.vote_count)
  end

  def render_flash_rating(user, flash)
     broadcast_update_to([user, :comments], target: :notifications, partial: 'shared/flash', locals: { flash: flash })
  end

  def update_title(user, choice)
    parse_icon = choice == 'up_vote' ? up_vote_icon : down_vote_icon
    new_title = set_title(self.comment, choice, parse_icon, user)
    broadcast_update_to([user, :comments], target: "#{dom_id(comment)}_#{choice}_title", html: new_title)
  end
end
