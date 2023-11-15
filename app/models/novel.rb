class Novel < ApplicationRecord
  
  belongs_to :user
  has_many :novel_comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :read_counts, dependent: :destroy
  
  enum status: { published: 0, draft: 1, unpublished: 2 }
  
  validates :title,presence:true
  validates :body,presence:true
  
  def bookmarked_by?(user)
    return false if user.nil?
    bookmarks.exists?(user_id: user.id)
  end
  
  def self.bookmarks(user, page, per_page)
  includes(:bookmarks)
    .where(bookmarks: { user_id: user.id })
    .order(created_at: :desc)
    .page(page)
    .per(per_page)
  end
  
  
end
