class Game < ActiveRecord::Base
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'

  has_many :game_expansions
  has_many :game_henchmen
  has_many :game_heros
  has_many :game_masterminds
  has_many :game_scenarios
  has_many :game_villains

  has_many :expansions, through: :game_expansions
  has_many :henchmen, through: :game_henchmen
  has_many :heros, through: :game_heros
  has_many :masterminds, through: :game_masterminds
  has_many :scenarios, through: :game_scenarios
  has_many :villains, through: :game_villains

  PLAYERS = [[1,1],[2,2],[3,3],[4,4],[5,5]]

  validates :expansions, presence: true

end