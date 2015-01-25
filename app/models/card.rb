class Card < ActiveRecord::Base

  belongs_to :hero
  belongs_to :villain

end