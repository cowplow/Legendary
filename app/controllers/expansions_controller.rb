class ExpansionsController < ApplicationController
  before_action :set_expansion, only: [:show, :edit, :update]

  def new
    @expansion = Expansion.new
  end

  def create
    @expansion = Expansion.new(expansion_params)

    if @expansion.save
      flash[:notice] = "Expansion Created"
      redirect_to new_expansion_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @expansion.update(expansion_params)
      flash[:notice] = "Expansion updated"
      redirect_to expansion_path(@expansion)
    else
      render :edit
    end
  end

  def index
    @expansions = Expansion.all
  end

  def show
  end

  private

  def expansion_params
    params.require(:expansion).permit!
  end

  def set_expansion
    @expansion = Expansion.find_by(slug: params[:id])
  end
  
end