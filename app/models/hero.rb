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

    (wins / (wins + losses).to_f * 100).round(2)
  end

end