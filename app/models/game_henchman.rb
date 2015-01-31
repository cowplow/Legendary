class GameHenchman < ActiveRecord::Base
  belongs_to :game
  belongs_to :henchman
end