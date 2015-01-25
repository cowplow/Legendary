class Mastermind < ActiveRecord::Base
  include SlugableCtrembley

  belongs_to :game
  belongs_to :expansion

  slugable_column :name

end