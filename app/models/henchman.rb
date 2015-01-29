class Henchman < ActiveRecord::Base
  include SlugableCtrembley

  belongs_to :game
  belongs_to :expansion

  slugable_column :name

  validates :name, presence: true, uniqueness: true
  validates :expansion_id, presence: true
end