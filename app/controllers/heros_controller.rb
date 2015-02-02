class HerosController < ApplicationController
  before_action :set_hero, only: [:show, :edit, :update]
  before_action :require_user, only: [:new, :create, :edit, :update]
  before_action :require_admin, only: [:new, :create, :edit, :update]

  def new
    @hero = Hero.new
  end

  def create
    @hero = Hero.new(hero_params)

    if @hero.save
      flash[:notice] = "Hero: #{@hero.name} created successfully"
      redirect_to new_hero_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @hero.update(hero_params)
      flash[:notice] = "#{@hero.name} updated successfully"
      redirect_to hero_path(@hero)
    else
      render :edit
    end
  end

  def index
    @heros = Hero.all.sort_by{|x| x.show_hero_win_rate}.reverse
  end

  def show
  end

  private

  def hero_params
    params.require(:hero).permit!
  end

  def set_hero
    @hero = Hero.find_by(slug: params[:id])
  end

  def require_admin
    if !logged_in? || !current_user.is_admin?
      flash[:error] = "You do not have sufficient privileges to perform that action."
      redirect_to root_path
    end
  end

end