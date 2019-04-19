require 'pry'
def game_hash
  {
    home: {
      team_name: 'Brooklyn Nets',
      colors: %w[Black White],
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
      colors: %w[Turquoise Purple],
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
  #   game_hash.each { |team, value|  }
  #   if game_hash[:home][:players].include?(name)
  #     game_hash[:home][:players]["#{name}"][:points]
  #   elsif game_hash[:away][:players].include?(name)
  #     game_hash[:away][:players]["#{name}"][:points]
  #   end

  player_finder(name).fetch(:points)
end

def shoe_size(name)
  player_finder(name).fetch(:shoe)
end

def team_colors(team_to_find)
  #   team = game_hash.values.find { |team| team.fetch(:team_name) == team_to_find }
  #   team.fetch(:colors)
  team_finder(team_to_find).fetch(:colors)
end

def team_names
  game_hash.values.map { |team| team.fetch(:team_name) }
end

def player_numbers(team_name)
  playersAr = team_finder(team_name)[:players]
  playersAr.map { |player, statistics| statistics[:number] }
end

def team_finder(team_to_find)
  game_hash.values.find { |team| team.fetch(:team_name) == team_to_find }
end

def player_stats(name)
  player_merge.fetch(name)
end

def big_shoe_rebounds
  biggest_shoe =
    player_merge.max_by { |player, statistics| statistics.fetch(:shoe) }[1]
  biggest_shoe.fetch(:rebounds)
end

def most_points_scored; end

def winning_team; end

def player_with_the_longest_name; end

def long_name_steals_a_ton; end

def player_merge
  game_hash[:home][:players].merge(game_hash[:away][:players])
end

def player_finder(player)
  player_merge.fetch(player)
end
