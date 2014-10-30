module CommentsHelper

  def comment_user_display(comment)
    if comment.user
      if comment.user.first_name
        comment.user.first_name 
      elsif comment.user.email
        comment.user.email
      end
    else
      "Anonymous"
    end
  end

end
