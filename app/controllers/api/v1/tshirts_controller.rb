class Api::V1::TshirtsController < Api::V1::BaseController
  # skip_before_action :authenticate_token!, only: [:index]

  def index
    @tshirts = Tshirt.all
    render json: @tshirts
  end

  def show
    @tshirt = Tshirt.find(params[:id])
    render json: @tshirt
  end

  def create
    puts params
    @tshirt = Tshirt.create!(tshirt_params)
    render json: @tshirt
  end

  # def destroy
  #   authorize @tshirt
  #   @tshirt.destroy
  #   head :no_content
  # end

  private

  # def render_error
  #   render json: { errors: @tshirt.errors.full_messages },
  #   status: :unprocessable_entity
  # end

  def tshirt_params
    params.require(:tshirt).permit(:height, :width, :x, :y, :name, :description, :photo, :query, :tags)
  end

  # def set_tshirt
  #   @tshirt = Tshirt.find(params[:id])
  # end
end
