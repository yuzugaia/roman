class Novel < ApplicationRecord
  
  belongs_to :user
  has_many :novel_comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
end
