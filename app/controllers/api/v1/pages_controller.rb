class Api::V1::PagesController < Api::V1::BaseController
  skip_before_action :authenticate_user!, only: [:home]
  def home
    @tshirts = Tshirt.all
  end
end