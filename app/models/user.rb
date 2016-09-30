class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  before_save { self.email = email.downcase if email.present? }

  validates :name, length: { minimum: 1, maximum: 100 }, presence: true

  has_many :topics, dependent: :nullify
  has_many :bookmarks, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_bookmarks, through: :likes, source: :bookmark

  #after_save :set_embeldy_url

  extend FriendlyId
  friendly_id :name, use: :slugged

  def liked(bookmark)
    likes.where(bookmark_id: bookmark.id).first
  end

  def set_embedly_url
    # call api with key (you'll need a real key)
    embedly_api = Embedly::API.new :key => 'xxxxxxxxxxxxxxxxxxxxxxxxxx',
            :user_agent => 'Mozilla/5.0 (compatible; mytestapp/1.0; my@email.com)'
    obj = embedly_api.extract :url => self.url
    Rails.logger.info ">>>> #{JSON.pretty_generate(obj[0].marshal_dump)}"
    # self.embedly_url = obj["image_url"]
    # self.save!

    # to present:
    # <%= image_tag(bookmark.embedly_url) %>
  end
end
