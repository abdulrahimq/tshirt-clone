class Api::V1::TshirtsController < Api::V1::BaseController
  before_action :set_tshirt, only: [:show, :destroy]
  acts_as_token_authentication_handler_for User, except: [:index, :show]
  def index
    @tshirts = policy_scope(Tshirt)
  end

  def show
    authorize @tshirt
  end

  def create
    @tshirt = Tshirt.new(tshirt_params)
    @tshirt.user = current_user
    authorize @tshirt
    if @tshirt.save
      render :show, status: :created
    else
      puts @tshirt.inspect
      render_error
    end
  end

  def destroy
    authorize @tshirt
    @tshirt.destroy
    head :no_content
  end

  private

  def render_error
    render json: { errors: @tshirt.errors.full_messages },
    status: :unprocessable_entity
  end

  def tshirt_params
    params.require(:tshirt).permit(:height, :width, :x, :y, :name, :description, :photo, :query, :tags)
  end

  def set_tshirt
    @tshirt = Tshirt.find(params[:id])
  end
end
