class MastermindsController < ApplicationController
  before_action :set_mastermind, only: [:show, :edit, :update]
  before_action :require_user, only: [:new, :create, :edit, :update]
  before_action :require_admin, only: [:new, :create, :edit, :update]

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
    @masterminds = Mastermind.all.sort_by{|x| x.show_mastermind_win_rate}.reverse
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

  def require_admin
    if !logged_in? || !current_user.is_admin?
      flash[:error] = "You do not have sufficient privileges to perform that action."
      redirect_to root_path
    end
  end

end