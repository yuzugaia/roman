class Novel < ApplicationRecord
  
  belongs_to :user
  belongs_to :genre
  has_many :bookmarks, dependent: :destroy
  has_many :novel_comments, dependent: :destroy
  has_many :read_counts, dependent: :destroy

  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
  
  scope :created_today, -> { where(created_at: Time.zone.now.all_day) } 
  scope :created_yesterday, -> { where(created_at: 1.day.ago.all_day) } 
  scope :created_this_week, -> { where(created_at: 6.day.ago.beginning_of_day..Time.zone.now.end_of_day) } 
  scope :created_last_week, -> { where(created_at: 2.week.ago.beginning_of_day..1.week.ago.end_of_day) } 
  
  scope :created_2day_ago, -> { where(created_at: 2.day.ago.all_day) }
  scope :created_3day_ago, -> { where(created_at: 3.day.ago.all_day) }
  scope :created_4day_ago, -> { where(created_at: 4.day.ago.all_day) }
  scope :created_5day_ago, -> { where(created_at: 5.day.ago.all_day) }
  scope :created_6day_ago, -> { where(created_at: 6.day.ago.all_day) }

  enum status: { published: 0, draft: 1,  unpublished: 2 }

  def bookmarked_by?(user)
    bookmarks.exists?(user_id: user.id)
  end

  def self.search_for(content, method)
    if method == 'perfect'
      Novel.where(title: content)
    elsif method == 'forward'
      Novel.where('title LIKE ?', content+'%')
    elsif method == 'backward'
      Novel.where('title LIKE ?', '%'+content)
    else
      Novel.where('title LIKE ?', '%'+content+'%')
    end
  end
  
  
end
