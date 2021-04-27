module UsersHelper
  def is_follower?(user, current_user)
    return false unless current_user.present?
    Follower.where(followed_id: user.id, follower_id: current_user.id).present?
  end

end
