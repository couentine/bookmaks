class BookmarksController < ApplicationController
include BookmarksHelper

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @bookmark = Bookmark.new
    @topic = Topic.find(params[:topic_id])
  end

  def create
    @bookmark = current_user.bookmarks.create(bookmark_params)
    @bookmark.url = params[:bookmark][:url]
    @topic = Topic.find(params[:topic_id])
    @bookmark.topic = @topic

    if @bookmark.save
      flash[:notice] = "Bookmark was saved."
      redirect_to [@topic, @bookmark]
    else
      flash.now[:alert] = "There was an error saving the bookmark.  Please try again."
      render :new
    end
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    @bookmark.url = params[:bookmark][:url]
    authorize @bookmark

    if @bookmark.save
      flash[:notice] = "Bookmark was updated."
      redirect_to [@bookmark.topic, @bookmark]
    else
      flash.now[:alert] = "There was an error saving the bookmark.  Please try again."
      render :edit
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark

    if @bookmark.destroy
      flash[:notice] = "\"#{@bookmark.url}\" was deleted successfully."
      redirect_to @bookmark.topic
    else
      flash.now[:alert] = "There was an error deleting the bookmark."
      render :show
    end
  end

private


    def bookmark_params
    params.require(:bookmark).permit(:url,:private)
end

end
