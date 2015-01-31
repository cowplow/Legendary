class GameVillain < ActiveRecord::Base
  belongs_to :game
  belongs_to :villain
end