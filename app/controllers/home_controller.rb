class HomeController < ApplicationController
  def index
    #@posts = Post.all.approved_posts.order("published_at DESC")
    @pagy, @posts = pagy(Post.all.approved_posts.order("published_at DESC"))

  end
end
