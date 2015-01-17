class PagesController < ApplicationController
  def homepage
    redirect_to posts_path unless current_user
  end

  def terms_of_condtions
  end

  def support
  end

end