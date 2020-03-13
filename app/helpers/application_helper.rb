module ApplicationHelper

  def commented_by(user)
    user.fullname
  end  

  def persisted_comments(comments)
    # reject comments that have not been saved with reject
    comments.reject{ |comment| comment.new_record? }
  end
end
