class PagesController < ApplicationController
  def home
  	@mix = Mix.get_latest
  end

  def about
  end
end
