module ApplicationHelper
  def set_title(comment, action, user)
    vote = comment.votes.find_by(user_id: user&.id)
    vote&.choice == action ? 'undo vote' : action
  end
end
