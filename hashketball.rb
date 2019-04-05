require "pry"

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
            number: 30,
            shoe: 14,
            points: 12,
            rebounds: 12,
            assists: 12,
            steals: 12,
            blocks: 12,
            slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

def num_points_scored(players_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      if name == players_name
        stats.each do |item, value|
          if item == :points
            return value
          end
        end
      end
    end
  end
end

def shoe_size(players_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      if name == players_name
        stats.each do |item, value|
          if item == :shoe
            return value
          end
        end
      end
    end
  end
end

def team_colors(name)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == name
      return team_data[:colors]
    end
  end
end


def team_names
  names = []
  game_hash.each do |location, team_data|
    names << team_data[:team_name]
  end
  names
end

def player_numbers(name)
  numbers = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == name
      team_data[:players].each do |name, stats|
        numbers << stats[:number]
      end
    end
  end
  numbers
end

def player_stats(name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, stats|
      if player_name == name
        return stats
      end
    end
  end
end

def big_shoe_rebounds
  shoe_size = nil
  rebounds = nil
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, stats|
      if shoe_size == nil || shoe_size < stats[:shoe]
        shoe_size = stats[:shoe]
        rebounds = stats[:rebounds]
      end
    end
  end
  rebounds
end

def most_points_scored
  player = nil
  points = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, stats|
      if points < stats[:points]
        points = stats[:points]
        player = player_name
      end
    end
  end
  player
end

def winning_team
  team = nil
  home_points = 0
  away_points = 0
  game_hash[:home][:players].each do |name, stats|
    home_points += stats[:points]
  end
  game_hash[:away][:players].each do |name, stats|
    away_points += stats[:points]
  end
  if home_points > away_points
    game_hash[:home][:team_name]
  else
    game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  name = nil
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, stats|
      if name == nil || player_name.length > name.length
        name = player_name
      end
    end
  end
  name
end

def long_name_steals_a_ton?
  num_of_steals = nil
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, stats|
      if player_name == player_with_longest_name
        num_of_steals = stats[:steals]
      end
    end
  end
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, stats|
      if stats[:steals] > num_of_steals
        return false
      end
    end
  end
  true
end
