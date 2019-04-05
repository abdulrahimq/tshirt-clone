class TshirtsController < ApplicationController
  # before_action :tshirt_params, only: [:update]
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:index]
  def index
    # TODO redo this with a better search with Algolia if needed or remove Algolia
    @query = params[:query]
    if @query.present?
      if policy_scope(Tshirt).search(@query) == []
        redirect_to tshirts_path
      end
      @tshirts = policy_scope(Tshirt).search(@query)
    else
      @tshirts = policy_scope(Tshirt)
    end
  end

  def show
    @tshirt = Tshirt.find(params[:id])
    @item = current_order.items.new
    authorize @tshirt
    authorize @item
  end

  def new
    @tshirt = Tshirt.new
    authorize @tshirt
  end

  def create
    @tshirt = Tshirt.new(tshirt_params)
    @tshirt.user = current_user
    authorize @tshirt
    if @tshirt.save
      redirect_to tshirts_path
    else
      render :new
    end
  end

  def edit
    @tshirt = Tshirt.find(params[:id])
    authorize @tshirt
  end

  def update
    @tshirt = Tshirt.find(params[:id])
    authorize @tshirt
    if @tshirt.update(tshirt_params)
      redirect_to tshirt_path(@tshirt)
    else
      render :edit
    end
  end

  def destroy
    @tshirt = Tshirt.find(params[:id])
    authorize @tshirt
    @tshirt.destroy

    redirect_to tshirts_path
  end

  private

  def tshirt_params
    params.require(:tshirt).permit(:height, :width, :x, :y, :name, :description, :photo, :query, :tags)
  end
end
