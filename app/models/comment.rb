class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user, :reject_if => :missing_both_user_id_and_username

  def missing_user_id_or_username(attributes)
    attributes[:user_id].nil? && attributes[:username].nil?
  end

  def user_attributes=(user_attributes)
    if user_attributes[:username] != ""
      self.user = User.create(username: user_attributes[:username])
    end
  end

end
