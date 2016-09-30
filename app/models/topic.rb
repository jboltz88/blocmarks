class Topic < ActiveRecord::Base
  has_many :bookmarks, dependent: :destroy

  validates :title, length: { minimum: 1, maximum: 100 }, presence: true

  extend FriendlyId
  friendly_id :title, use: :slugged
end
