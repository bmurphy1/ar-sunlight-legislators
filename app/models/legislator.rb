require_relative '../../db/config'

class Legislator < ActiveRecord::Base
  belongs_to :title
  belongs_to :state
  belongs_to :party
end
