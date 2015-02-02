class Hero < ActiveRecord::Base
  include SlugableCtrembley

  belongs_to :expansion
  has_many :game_heros
  has_many :games, through: :game_heros

  has_many :cards

  slugable_column :name

  validates :name, presence: true, uniqueness: true
  validates :expansion_id, presence: true

  def show_hero_win_rate
    wins = Game.includes('heros').where(win: true, heros: {name: self.name }).count
    losses = Game.includes('heros').where(win: false, heros: {name: self.name }).count

    total_games = wins + losses

    if total_games == 0
      total_games = 1
    end

    (wins / total_games.to_f * 100).round(2)
  end

  def show_hero_win_rate_with_player(p)
    wins = Game.includes('heros').where(win: true, heros: {name: self.name }, players: p).count
    losses = Game.includes('heros').where(win: false, heros: {name: self.name }, players: p).count

    total_games = wins + losses

    if total_games == 0
      total_games = 1
    end

    (wins / total_games.to_f * 100).round(2)
  end

  def total_games_with_player(p)
    Game.includes('heros').where(heros: {name: self.name }, players: p).count
  end

  def total_games
    Game.includes('heros').where(heros: {name: self.name }).count
  end

end