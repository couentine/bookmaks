class LikesController < ApplicationController
  def index
  end

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)

    if like.save
      flash[:notice] = 'Your like is saved'
      redirect_to [@bookmark.topic, @bookmark]
    else
    flash[:notice] = 'Your like failed'
    redirect_to [@bookmark.topic, @bookmark]
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
   like = current_user.likes.find_by bookmark_id: @bookmark.id

    if like.destroy
      flash[:notice] = 'Your unlike is saved'
      redirect_to [@bookmark.topic, @bookmark]
    else
      flash[:notice] = 'Your unlike failed'
      redirect_to [@bookmark.topic, @bookmark]
    end
  end

end
