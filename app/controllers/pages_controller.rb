class PagesController < ApplicationController
  def home
  	@mix = Broadcast.get_latest
  end

  def about
  end
end
