class Henchman < ActiveRecord::Base
  include SlugableCtrembley

  has_many :game_henchmen
  has_many :games, through: :game_henchmen

  belongs_to :expansion

  slugable_column :name

  validates :name, presence: true, uniqueness: true
  validates :expansion_id, presence: true

  def show_henchmen_win_rate
    wins = Game.includes('henchmen').where(win: true, henchmen: {name: self.name }).count
    losses = Game.includes('henchmen').where(win: false, henchmen: {name: self.name }).count

    (wins / (wins + losses).to_f * 100).round(2)
  end
end