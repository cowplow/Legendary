class Game < ActiveRecord::Base
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'

  has_one :mastermind
  has_one :scenario

  has_many :heros
  has_many :villains
  has_many :henchmen
  has_many :game_expansions
  has_many :expansions, through: :game_expansions

  PLAYERS = [[1,1],[2,2],[3,3],[4,4],[5,5]]

  validates :expansions, presence: true

end