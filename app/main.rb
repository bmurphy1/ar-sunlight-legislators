require_relative '/models/'

s = State.find_by(name: 'CA')
s.legislators.where('title = ?')



# Legislator.joins(:state).joins(:title).where('states.name' => 'CA', 'titles.name' => 'Sen')
