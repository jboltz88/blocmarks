class Bookmark < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user

  has_many :likes, dependent: :destroy

  validates :url, presence: true

  before_save :set_embedly_url


  private

  def set_embedly_url
    embedly_api = Embedly::API.new :key => ENV['EMBEDLY_KEY'],
          :user_agent => 'Mozilla/5.0 (compatible; mytestapp/1.0; my@email.com)'

    obj = embedly_api.extract :url => self.url
    o = obj.try(:first)
    Rails.logger.info ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    image = o.images.try(:first)
    # assign thumbnail image if an image exists
    assign_attributes(thumbnail_url: image['url']) if image && image['url'].present?
    true
  end
end
