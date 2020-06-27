class HomeController < ApplicationController
  def index
    @posts = Post.all.approved_posts.order("published_at DESC")
  end
end
