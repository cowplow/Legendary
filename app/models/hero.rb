class Hero < ActiveRecord::Base
  include SlugableCtrembley

  belongs_to :expansion
  belongs_to :game

  has_many :cards

  slugable_column :name

end