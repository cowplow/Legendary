class User < ActiveRecord::Base
  include SlugableCtrembley

  has_many :games

  has_secure_password validations: false

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: {minimum: 5}

  slugable_column :username

  def is_admin?
    self.role == 'admin'
  end
  
end