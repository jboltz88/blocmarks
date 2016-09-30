class Topic < ActiveRecord::Base
  belongs_to :user

  has_many :bookmarks, dependent: :destroy
  has_many :likes, dependent: :destroy 

  validates :title, length: { minimum: 1, maximum: 100 }, presence: true

end
