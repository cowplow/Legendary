class ExpansionsController < ApplicationController
  before_action :set_expansion, only: [:show, :edit, :update]
  before_action :require_user, only: [:new, :create, :edit, :update]
  before_action :require_admin, only: [:new, :create, :edit, :update]

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
    @heroes = @expansion.heros.sort_by{|x| x.name}
    @schemes = @expansion.scenarios.sort_by{|x| x.name}
    @masterminds = @expansion.masterminds.sort_by{|x| x.name}
    @henchmen = @expansion.henchmen.sort_by{|x| x.name}
    @villains = @expansion.villains.sort_by{|x| x.name}
  end

  

  private

  def expansion_params
    params.require(:expansion).permit!
  end

  def set_expansion
    @expansion = Expansion.find_by(slug: params[:id])
  end

  def require_admin
    if !logged_in? || !current_user.is_admin?
      flash[:error] = "You do not have sufficient privileges to perform that action."
      redirect_to root_path
    end
  end
  
end