class Title < ActiveRecord::Base
  has_many :legislators
  has_many :parties, :through => :legislators
  has_many :states, :through => :legislators
end
