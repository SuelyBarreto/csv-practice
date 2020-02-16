#!/usr/bin/ruby
# 
require 'csv'
require 'awesome_print'

# ID,Name,Sex,Age,Height,Weight,Team,NOC,Games,Year,Season,City,Sport,Event,Medal
# 0  1    2    3   4      5      6    7    8    9    10     11   12    13    14 

# ID Name Height Team Year City Sport Event Medal

def get_all_olympic_athletes(filename)

  all_athletes = CSV.read(filename, headers: true).map do |athlete|
    {"ID"    => athlete[0],
    "Name"   => athlete[1],
    "Height" => athlete[4],
    "Team"   => athlete[6],
    "Year"   => athlete[9],
    "City"   => athlete[11],
    "Sport"  => athlete[12],
    "Event"  => athlete[13],
    "Medal"  => athlete[14]}
  end

  return all_athletes

end

def total_medals_per_team(olympic_data)

  olympic_teams = Hash.new(0)
  olympic_data.each do |athlete|
    olympic_teams[athlete["Team"]] += athlete["Medal"] == "NA" ? 0 : 1

    # team = athlete["Team"]
    # medal = athlete["Medal"]
    # olympic_teams[team] += me dal == "NA" ? 0 : 1
    # if medal != "NA"
    #   olympic_teams[team] += 1
    # end
  end
  
  return olympic_teams

end

def get_all_gold_medalists(olympic_data)

  return olympic_data.select { |athlete| athlete["Medal"].capitalize == "Gold"}

end
