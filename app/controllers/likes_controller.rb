class LikesController < ApplicationController
  after_action :verify_authorized

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark_id: @bookmark.id)
    authorize like

    if like.save
      flash[:notice] = "#{@bookmark.url} liked!"
    else
      flash[:alert] = "Error liking the bookmark."
    end
    redirect_to :back
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.find(params[:id])
    authorize like

    if like.destroy
      flash[:notice] = "#{@bookmark.url} unliked."
    else
      flash[:alert] = "Error unliking the bookmark"
    end
    redirect_to :back
  end
end
