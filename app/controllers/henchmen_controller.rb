class HenchmenController < ApplicationController
  before_action :set_henchman, only: [:show, :edit, :update]

  def new
    @henchman = Henchman.new
  end

  def create
    @henchman = Henchman.new(henchman_params)

    if @henchman.save
      flash[:notice] = "#{@henchman.name} created successfully"
      redirect_to new_henchman_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @henchman.update(henchman_params)
      flash[:notice] = "#{@henchman.name} created successfully"
      redirect_to henchman_path(@henchman)
    else
      render :edit
    end
  end

  def index
    @henchmen = Henchman.all
  end

  def show
  end

  private

  def henchman_params
    params.require(:henchman).permit!
  end

  def set_henchman
    @henchman = Henchman.find_by(slug: params[:id])
  end

end