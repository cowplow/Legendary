class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    
    if @game.valid?
      @expansions = define_expansions
      build_game
      @game.save
      redirect_to game_path(@game)
    else
      render :new
    end 
  end

  def show
    @game = Game.find(params[:id])
  end

  private

  def build_game
    set_players!
    generate_mastermind!
    generate_scheme!
    generate_heroes!
    generate_villains!
    generate_henchmen!
  end

  def game_params
    params.require(:game).permit!
  end

  def define_expansions
    exp = []

    0.upto(params[:game][:expansion_ids].size-2) do |x|
      exp << Expansion.find(params[:game][:expansion_ids][x])
    end
    exp
  end

  def generate_mastermind!
    masterminds = []


    @expansions.each do |e|
      e.masterminds.each do |m|
        masterminds << m
      end
    end

    @game.mastermind = masterminds.shuffle!.pop
  end

  def generate_scheme!
    scenarios = []


    @expansions.each do |e|
      e.scenarios.each do |m|
        scenarios << m
      end
    end

    @game.scenario = scenarios.shuffle!.pop
  end

  def generate_heroes!
    heroes = []
    num_heroes = 0

    case @game.players
    when 1
      num_heroes = 3
    else
      num_heroes = 5
    end

    @expansions.each do |e|
      e.heros.each do |m|
        heroes << m
      end
    end

    num_heroes.times do
      @game.heros << heroes.shuffle!.pop
    end
  end

  def generate_villains!
    villains = []
    num_villains = 0

    case @game.players
    when 1
      num_villains = 1
    when 2
      num_villains = 2
    when 5
      num_villains = 4
    else
      num_villains = 3
    end

    @expansions.each do |e|
      e.villains.each do |m|
        villains << m
      end
    end

    num_villains.times do
      @game.villains << villains.shuffle!.pop
    end
  end

  def set_players!
    @game.players = params[:players]
  end

  def generate_henchmen!
    henchmen = []
    num_henchmen = 0

    case @game.players
    when 4
      num_henchmen = 2
    when 5
      num_henchmen = 2
    else
      num_henchmen = 1
    end

    @expansions.each do |e|
      e.henchmen.each do |m|
        henchmen << m
      end
    end

    num_henchmen.times do
      @game.henchmen << henchmen.shuffle!.pop
    end
  end


end