class Villain < ActiveRecord::Base
  include SlugableCtrembley

  has_many :game_villains
  has_many :games, through: :game_villains
  belongs_to :expansion

  has_many :cards

  slugable_column :name

  validates :name, presence: true, uniqueness: true
  validates :expansion_id, presence: true

  def show_villain_win_rate
    wins = Game.includes('villains').where(win: true, villains: {name: self.name }).count
    losses = Game.includes('villains').where(win: false, villains: {name: self.name }).count

    total_games = wins + losses

    if total_games == 0
      total_games = 1
    end

    (wins / total_games.to_f * 100).round(2)
  end

  def show_villain_win_rate_with_player(p)
    wins = Game.includes('villains').where(win: true, villains: {name: self.name }, players: p).count
    losses = Game.includes('villains').where(win: false, villains: {name: self.name }, players: p).count

    total_games = wins + losses

    if total_games == 0
      total_games = 1
    end

    (wins / total_games.to_f * 100).round(2)
  end

  def total_games_with_player(p)
    Game.includes('villains').where(villains: {name: self.name }, players: p).count
  end

  def total_games
    Game.includes('villains').where(villains: {name: self.name }).count
  end

end