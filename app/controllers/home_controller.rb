class HomeController < ApplicationController
  def page
    @posts = Post.all
  end
end
