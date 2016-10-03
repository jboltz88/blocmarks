class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  skip_before_action :authenticate_user!

  def create
    @user = User.find_by(email: params[:sender])
    if @user
      @topic = Topic.find_or_create_by(title: params[:subject])
      @url = params["body-plain"]

      @bookmark = @topic.bookmarks.new(
        url: @url,
        user: @user
      )
      @bookmark.save
      head 200
    else
      head 404
    end
  end
end
