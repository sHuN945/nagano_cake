class HomesController < ApplicationController
  def index
    @post_images = PostImage.page(params[:page])
  end
end
