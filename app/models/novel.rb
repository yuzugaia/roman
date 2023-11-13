class Novel < ApplicationRecord
  
  belongs_to :user
  has_many :novel_comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :read_counts, dependent: :destroy
  
  enum status: { published: 0, draft: 1, unpublished: 2 }
  
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
  def self.bookmarks(user, page, per_page)
  includes(:bookmarks)
    .where(bookmarks: { user_id: user.id })
    .order(created_at: :desc)
    .page(page)
    .per(per_page)
  end
  
  
end
