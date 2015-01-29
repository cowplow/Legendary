class Villain < ActiveRecord::Base
  include SlugableCtrembley

  belongs_to :game
  belongs_to :expansion

  has_many :cards

  slugable_column :name

  validates :name, presence: true, uniqueness: true
  validates :expansion_id, presence: true

end