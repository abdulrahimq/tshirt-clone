class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  def home
    @tshirts = Tshirt.all
  end
end
