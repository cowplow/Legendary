class HerosController < ApplicationController
  before_action :set_hero, only: [:show, :edit, :update]

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
    @heros = Hero.all
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

end