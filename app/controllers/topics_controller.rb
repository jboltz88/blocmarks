class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.friendly.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.new(topic_params)

    if @topic.save
      flash[:notice] = "Topic was saved successfully."
      redirect_to topics_path
    else
      flash.now[:alert] = "Error creating topic. Please try again."
      render :new
    end
  end

  def edit
    @topic = Topic.friendly.find(params[:id])
  end

  def update
    @topic = Topic.friendly.find(params[:id])
    @topic.assign_attributes(topic_params)

    if @topic.save
      flash[:notice] = "Topic was updated successfully."
      redirect_to @topic
    else
      flash.now[:alert] = "Error saving topic updates. Please try again."
      render :show
    end
  end

  def destroy
    @topic = current_user.topics.find(params[:id])

    if @topic.destroy
      flash[:notice] = "Topic was successfully deleted."
      redirect_to topics_path
    else
      flash[:alert] = "There was an error deleting the topic. Please try again."
      redirect_to @topic
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title)
  end
end
