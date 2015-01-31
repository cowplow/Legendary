class Expansion < ActiveRecord::Base
  include SlugableCtrembley

  has_many :scenarios
  has_many :masterminds
  has_many :villains
  has_many :henchmen
  has_many :heros
  has_many :game_expansions
  has_many :games, through: :game_expansions

  slugable_column :name

  validates :name, presence: true, uniqueness: true

  def show_expansion_win_rate
    wins = Game.includes('expansions').where(win: true, expansions: {name: self.name }).count
    losses = Game.includes('expansions').where(win: false, expansions: {name: self.name }).count

    (wins / (wins + losses).to_f * 100).round(2)
  end

end
