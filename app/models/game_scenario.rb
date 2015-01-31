class GameScenario < ActiveRecord::Base
  belongs_to :game
  belongs_to :scenario
end