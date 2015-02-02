class Mastermind < ActiveRecord::Base
  include SlugableCtrembley

  has_many :game_masterminds
  has_many :games, through: :game_masterminds
  belongs_to :expansion

  slugable_column :name

  validates :name, presence: true, uniqueness: true
  validates :expansion_id, presence: true

  def show_mastermind_win_rate
    wins = Game.includes('masterminds').where(win: true, masterminds: {name: self.name }).count
    losses = Game.includes('masterminds').where(win: false, masterminds: {name: self.name }).count
    total_games = wins + losses

    if total_games == 0
      total_games = 1
    end

    (wins / total_games.to_f * 100).round(2)
  end

  def show_mastermind_win_rate_with_player(p)
    wins = Game.includes('masterminds').where(win: true, masterminds: {name: self.name }, players: p).count
    losses = Game.includes('masterminds').where(win: false, masterminds: {name: self.name }, players: p).count

    total_games = wins + losses

    if total_games == 0
      total_games = 1
    end

    (wins / total_games.to_f * 100).round(2)
  end

  def total_games_with_player(p)
    Game.includes('masterminds').where(masterminds: {name: self.name }, players: p).count
  end

  def total_games
    Game.includes('masterminds').where(masterminds: {name: self.name }).count
  end

end