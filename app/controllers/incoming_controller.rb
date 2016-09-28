class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    @user = User.find_by(email: params[:sender])
    Rails.logger.info ">>>>>>>> INCOMING PARAMS HERE: #{params}"
    if @user      
      @topic = @user.topics.find_or_create_by(title: params[:subject])
      url = params["body-plain"]

      @bookmark = @topic.bookmarks.new(
        url: @url
      )
      @bookmark.save
      head 200
    else
      head 404
    end
  end
end
