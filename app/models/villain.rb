class Villain < ActiveRecord::Base
  include SlugableCtrembley

  belongs_to :game
  belongs_to :expansion

  has_many :cards

  slugable_column :name

end