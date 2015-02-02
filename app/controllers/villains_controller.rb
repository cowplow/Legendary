class VillainsController < ApplicationController
  before_action :set_villain, only: [:show, :edit, :update]
  before_action :require_user, only: [:new, :create, :edit, :update]
  before_action :require_admin, only: [:new, :create, :edit, :update]

  def new
    @villain = Villain.new
  end

  def create
    @villain = Villain.new(villain_params)

    if @villain.save
      flash[:notice] = "#{@villain.name} created successfully"
      redirect_to new_villain_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @villain.update(villain_params)
      flash[:notice] = "#{@villain.name} updated successfully"
      redirect_to villain_path(@villain)
    else
      render :edit
    end
  end

  def index
    @villains = Villain.all.sort_by{|x| x.show_villain_win_rate}.reverse
  end

  def show
  end

  private

  def villain_params
    params.require(:villain).permit!
  end

  def set_villain
    @villain = Villain.find_by(slug: params[:id])
  end

  def require_admin
    if !logged_in? || !current_user.is_admin?
      flash[:error] = "You do not have sufficient privileges to perform that action."
      redirect_to root_path
    end
  end

end
