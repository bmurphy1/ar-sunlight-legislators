require 'csv'
require_relative '../db/config'
require_relative '../app/models/legislator'
require_relative '../app/models/title'
require_relative '../app/models/state'
require_relative '../app/models/Party'

class SunlightLegislatorsImporter
  @attributes = ["firstname", "middlename", "lastname", "name_suffix", "gender", "phone", "fax", "website", "twitter_id", "birthdate"]
  def self.import
    csv = CSV.new(File.open(filename=File.dirname(__FILE__) + "/../db/data/legislators.csv"), :headers => true)
    csv.each do |row|
      data = Hash.new
      row.each do |field, value|
        # TODO: begin
        if field == "title"
          t = Title.find_or_create_by(name: value)
          data[:title] = t
        elsif field == "state"
          s = State.find_or_create_by(name: value)
          data[:state] = s
        elsif field == "party"
          p = Party.find_or_create_by(name: value)
          data[:party] = p
        elsif @attributes.include?(field)
          data[field.to_sym] = value
        end
        # TODO: end
      end
      Legislator.create!(data)
    end
  end
end

# IF YOU WANT TO HAVE THIS FILE RUN ON ITS OWN AND NOT BE IN THE RAKEFILE, UNCOMMENT THE BELOW
# AND RUN THIS FILE FROM THE COMMAND LINE WITH THE PROPER ARGUMENT.
# begin
#   raise ArgumentError, "you must supply a filename argument" unless ARGV.length == 1
  SunlightLegislatorsImporter.import
# rescue ArgumentError => e
#   $stderr.puts "Usage: ruby sunlight_legislators_importer.rb <filename>"
# rescue NotImplementedError => e
#   $stderr.puts "You shouldn't be running this until you've modified it with your implementation!"
# end

