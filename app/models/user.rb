class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise:database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
         
  has_many :novels
  has_many :novel_comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :read_counts, dependent: :destroy
        
end
