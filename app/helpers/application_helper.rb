module ApplicationHelper
  def set_title(comment, action, user)
    vote = comment.votes.find_by(user_id: user&.id)
    vote&.choice == action ? 'undo vote' : action
  end

  def up_title(comment, static)
    static ? 'up_vote' : set_title(comment, 'up_vote', current_user)
  end

  def down_title(comment, static)
    static ? 'down_vote' : set_title(comment, 'down_vote', current_user)
  end
end
