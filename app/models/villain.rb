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

    (wins / (wins + losses).to_f * 100).round(2)
  end

end