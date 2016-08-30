class HomeController < ApplicationController

  def index
    redirect_to properties_path
  end
end
