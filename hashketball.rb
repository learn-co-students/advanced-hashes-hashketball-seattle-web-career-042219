# Write your code here!
require "pry"

def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

def num_points_scored(player_name)
  points = 0
  game_hash.each do |location, team_data| #team_data {team_name, color, player
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, stats|
          if name == player_name
            stats.each do |category, value|
              points = value.to_i if category == :points
            end
          end
        end
      end
    end
  end
  points
end

def shoe_size(player_name)
  size = 0
  game_hash.each do |location, team_data| #team_data {team_name, color, player
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, stats|
          if name == player_name
            stats.each do |category, value|
              size = value.to_i if category == :shoe
            end
          end
        end
      end
    end
  end
  size
end  

def team_colors(team_name)
  colors = []
  game_hash.each do |location, team_data| #team_data {team_name, color, player
    if game_hash[location].values.include?(team_name)
      team_data.each do |attribute, data|
        colors = data if attribute == :colors
      end
    end
  end
  colors
end

def team_names
  teams = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      teams.push(data) if attribute == :team_name
    end
  end
  teams
end

def player_numbers(team_name)
  numbers = []
  game_hash.each do |location, team_data| #team_data {team_name, color, player
    if game_hash[location].values.include?(team_name)
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |category, value|
            value.each do |target, stat|
              numbers << stat if target == :number
            end
          end 
        end
      end
    end
  end
  numbers
end

def player_stats(player_name)
  p_stats = {}
  game_hash.each do |location, team_data| #team_data {team_name, color, player
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, stats|
          p_stats = stats if name == player_name
        end
      end
    end
  end
  p_stats
end

def big_shoe_rebounds
  size = 0 
  rebounds = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, stats|
          stats.each do |category, value|
            if size < stats[:shoe]
              size = stats[:shoe]
              rebounds = stats[:rebounds]
            end
            #if category == :shoe
              #if size < value
                #size = value
                #rebounds = data[name][:rebounds]
              #end
            #end
          end
        end
      end
    end
  end
  rebounds
end

def most_points_scored
  most_points = 0
  player_name = ""
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      team_data[:players].each do |name, stats|
        if stats[:points] > most_points
          most_points = stats[:points]
          player_name = name
        end
      end
    end
  end
  player_name
end

def winning_team
  w_team = {}
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      points = 0
      team_data[:players].each do |name, stats|
        points += stats[:points]
      end
      w_team[team_data[:team_name]] = points
    end
  end
  w_team["Brooklyn Nets"] - w_team["Charlotte Hornets"] > 0 ? "Brooklyn Nets" : "Charlotte Hornets"
end

def player_with_longest_name
  name_length = 0
  longest_name = ""
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      team_data[:players].each do |name, stats|
        if name_length < name.length
          name_length = name.length
          longest_name = name
        end
      end
    end  
  end
  longest_name
end

def long_name_steals_a_ton?
  longest_name = player_with_longest_name
  steal_count = 0
  target_count = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, stats|
          stats.each do |category, value|
            if category == :steals
              if name != longest_name
                steal_count = value if steal_count < value
              else
                target_count = value
              end
            end
          end
        end
      end
    end
  end  
  target_count > steal_count
end



