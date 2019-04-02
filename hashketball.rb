require 'pry'

def game_hash
  {
    home: {
      team_name: 'Brooklyn Nets',
      colors: ["Black", "White"],
      players: {
        'Alan Anderson' => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        'Reggie Evans' => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        'Brook Lopez' => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        'Mason Plumlee' => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        'Jason Terry' => {
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
      team_name: 'Charlotte Hornets',
      colors: ["Turquoise", "Purple"],
      players: {
        'Jeff Adrien' => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        'Bismak Biyombo' => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        'DeSagna Diop' => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        'Ben Gordon' => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        'Brendan Haywood' => {
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

def num_points_scored(name)
  game_hash.each do |location, data|
    if game_hash[location][:players][name]
      return game_hash[location][:players][name][:points]
    end
  end
end

def shoe_size(name)
  game_hash.each do |location, data|
    if game_hash[location][:players][name]
      return game_hash[location][:players][name][:shoe]
    end
  end
end

def team_colors(team)
  game_hash.each do |location, data|
    if game_hash[location][:team_name] == team
      return game_hash[location][:colors]
    end
  end
end

def team_names
  names = []
  game_hash.each do |location, data|
    names.push(game_hash[location][:team_name])
  end
  return names
end

def player_numbers(team)
  numbers = []
  game_hash.each do |location, data|
    if game_hash[location][:team_name] == team
      game_hash[location][:players].each do |player, metric|
        numbers.push(game_hash[location][:players][player][:number])
      end
    end
  end
  return numbers
end

def player_stats(name)
  metrics = {}
  game_hash.each do |location, data|
    if game_hash[location][:players][name]
      metrics = game_hash[location][:players][name]
    end
  end
  return metrics
end

def big_shoe_rebounds
  shoe_sizes_array = []
  final_rebounds = 0
  game_hash.each do |location, data|
    game_hash[location][:players].each do |player, metric|
      shoe_sizes_array.push(game_hash[location][:players][player][:shoe])
    end
  end
  shoe_sizes_array.sort
  game_hash.each do |location, data|
      game_hash[location][:players].each do |player, metric|
        if game_hash[location][:players][player][:shoe] == shoe_sizes_array.last
          final_rebounds = game_hash[location][:players][player][:rebounds]
        end
      end
    end
    return final_rebounds
  end
