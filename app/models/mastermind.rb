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

    (wins / (wins + losses).to_f * 100).round(2)
  end

end