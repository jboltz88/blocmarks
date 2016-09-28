class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    @user = User.find(params[:sender])
    @topic = Topic.find(params[:subject])
    url = params["body-plain"]

    unless @user
      @user = User.new(
        name:                   params[:sender],
        email:                  params[:sender],
        password:               params[:sender],
        password_confirmation:  params[:sender]
      )
      @user.save
    end

    unless @topic
      @topic = @user.topics.create(title: params[:subject])
    end

    @bookmark = @topic.bookmarks.new(
      url: @url
    )
    @bookmark.save
    head 200
  end
end
