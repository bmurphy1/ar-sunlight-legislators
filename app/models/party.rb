class Party < ActiveRecord::Base
  has_many :legislators
  has_many :states, :through => :legislators
  has_many :titles, :through => :legislators
end
