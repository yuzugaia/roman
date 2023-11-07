class Novel < ApplicationRecord
  
  belongs_to :user
  has_many :novel_comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  
end
