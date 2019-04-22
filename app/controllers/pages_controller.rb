class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :frontEnd]
  def home
    @tshirts = Tshirt.all
  end

  def frontEnd
  end
end
