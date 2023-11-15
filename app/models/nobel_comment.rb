class NobelComment < ApplicationRecord
  
  belongs_to :user
  belongs_to :novel
  
  validates :comment, presence: true
  
end
