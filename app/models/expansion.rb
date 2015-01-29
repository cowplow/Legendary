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
end