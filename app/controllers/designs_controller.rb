class DesignsController < ApplicationController
  # before_action :Design_params, only: [:update]
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:index]

  def new_design
    @Design = Design.find(params[:id])
    @item = Item.new
    puts Order.last.inspect
    puts current_user.inspect
    respond_to do |format|
      format.html
      format.js
    end
  end

  def index
    if params[:query].present?
      db_query = "title ILIKE :query OR description ILIKE :query OR tags ILIKE :query"
      @designs = policy_scope(Design.where(db_query, query: "%#{params[:query]}%"))
    else
      @designs = policy_scope(Design)
    end
  end

  def show
    @design = Design.find(params[:id])
    @item = current_order.items.new
    authorize @design
    authorize @item
  end

  def new
    @design = Design.new
    authorize @design
  end

  def create
    @design = Design.new(design_params)
    @design.user = current_user
    authorize @design
    if @design.save
      redirect_to designs_path
    else
      render :new
    end


  end

  def edit
    @design = Design.find(params[:id])
    authorize @design
  end

  def update
    @design = Design.find(params[:id])
    authorize @design
    if @Design.update(design_params)
      redirect_to Design_path(@design)
    else
      render :edit
    end
  end

  def destroy
    @design = Design.find(params[:id])
    authorize @esign
    @design.destroy

    redirect_to designs_path
  end

  private

  def design_params
    params.require(:design).permit(:title, :description, :photo, :query, :tags)
  end
end
