class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :help, :about_us, :why_papyru]

  def home
  end

  def help
  end

  def about_us
  end

  def why_papyru
  end
end
