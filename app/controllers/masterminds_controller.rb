class MastermindsController < ApplicationController
  before_action :set_mastermind, only: [:show, :edit, :update]

  def new
    @mastermind = Mastermind.new
  end

  def create
    @mastermind = Mastermind.new(mastermind_params)

    if @mastermind.save
      flash[:notice] = "#{@mastermind.name} created successfully"
      redirect_to new_mastermind_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @mastermind.update(mastermind_params)
      flash[:notice] = "#{@mastermind.name} updated successfully"
      redirect_to mastermind_path(@mastermind)
    else
      render :edit
    end
  end

  def index
    @masterminds = Mastermind.all
  end

  def show
  end

  private

  def mastermind_params
    params.require(:mastermind).permit!
  end

  def set_mastermind
    @mastermind = Mastermind.find_by(slug: params[:id])
  end

end