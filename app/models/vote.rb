class Vote < ApplicationRecord
  include ActionView::RecordIdentifier

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

    # update_title(choice)
  end

  after_update_commit do
    broadcast_update_to("comments", target: "#{dom_id(comment)}_count", html: comment.vote_count)
    # broadcast_update_to([self.user, "comments"], target: "#{dom_id(comment)}_count", html: comment.vote_count)
  end

  def render_flash_rating(user, flash)
     broadcast_update_to([user, :comments], target: :notifications, partial: 'shared/flash', locals: { flash: flash })
  end

  def update_title(user, choice)
    new_title = ApplicationController.helpers.set_title(self.comment, choice, user)
    broadcast_update_to([user, :comments], target: "#{dom_id(comment)}_#{choice}_title", html: new_title)
  end

  # private

  # def update_title(choice)
  #   # new_title = ApplicationController.helpers.set_title(self.comment, choice, self.user)
  #   # binding.pry
  #   new_title = ApplicationController.helpers.set_title(self.comment, choice, self.user)
  #   broadcast_update_to [self.user, "comments"], target: "#{dom_id(self.comment)}_#{choice}_title", html: 'sss_vote'
  # end
end
