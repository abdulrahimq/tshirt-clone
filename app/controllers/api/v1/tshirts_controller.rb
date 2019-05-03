class Api::V1::TshirtsController < Api::V1::BaseController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    puts "in the index!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    @tshirts = Tshirt.all
    render :index
  end

  def show
    @tshirt = Tshirt.find(params[:id])
    render json: @tshirt
  end

  def create
    @tshirt = Tshirt.new(tshirt_params)
    @tshirt.user = current_user
    @tshirt.photo.attach(tshirt_params[:photo])
    @tshirt.save!
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
