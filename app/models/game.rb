class Game < ActiveRecord::Base
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'

  has_one :mastermind
  has_one :scenario

  has_many :heros
  has_many :villains
  has_many :henchmen

end