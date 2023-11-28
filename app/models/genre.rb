class Genre < ApplicationRecord
  
  has_many :noves
  validates :name, presence: true, uniqueness: true
  
end
