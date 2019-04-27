class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :frontEnd]
  # def home
  #   @tshirts = Tshirt.all
  #   authorize(@tshirt)
  # end

  def frontEnd
    @tshirts = Tshirt.all
    # authorize(@tshirts)
  end
end
