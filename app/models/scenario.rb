class Scenario < ActiveRecord::Base
  include SlugableCtrembley

  has_many :game_scenarios
  has_many :games, through: :game_scenarios
  belongs_to :expansion

  slugable_column :name

  validates :name, presence: true, uniqueness: true
  validates :expansion_id, presence: true

  def show_scenario_win_rate
    wins = Game.includes('scenarios').where(win: true, scenarios: {name: self.name }).count
    losses = Game.includes('scenarios').where(win: false, scenarios: {name: self.name }).count

    (wins / (wins + losses).to_f * 100).round(2)
  end

end