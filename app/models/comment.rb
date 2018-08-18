class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates :user_id, uniqueness: true
  accepts_nested_attributes_for :user, reject_if: :all_blank

  def user_attributes=(user_attributes)
  	if user_attributes[:username] != ""
  		user = User.find_or_create_by(user_attributes)
  		user.comments << self
  		user.save
  	end
  end

end
