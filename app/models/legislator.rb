require_relative '../../db/config'

class Legislator < ActiveRecord::Base
  belongs_to :title
  belongs_to :state
  belongs_to :party

  def self.title_by_state(title, state)
    self.joins(:state).joins(:title).where('states.name' => state, 'titles.name' => title)
  end

  def self.whatever
    all_legislators = self.all.to_a
    all_legislators.map do |leg|

    end
  end
end
