class ReadCount < ApplicationRecord
  
  belongs_to :user
  belongs_to :novel
  
  attribute :views, :integer, default: 0
  
end
