class Expansion < ActiveRecord::Base
  include SlugableCtrembley

  has_many :scenarios
  has_many :masterminds
  has_many :villains
  has_many :henchmen
  has_many :heros

  slugable_column :name
end