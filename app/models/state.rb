class State < ActiveRecord::Base
  has_many :legislators
  has_many :titles, :through => :legislators
  has_many :parties, :through => :legislators
end
