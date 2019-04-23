require 'pry'

### lecture ###


# def game_hash
#   {
#     home: {
#       team_name: "Brooklyn Nets",
#       colors: ["Black", "White"],
#       players: [
#         {
#           player_name: "Alan Anderson",
#           number: 0,
#           shoe: 16,
#           points: 22,
#           rebounds: 12,
#           assists: 12,
#           steals: 3,
#           blocks: 1,
#           slam_dunks: 1
#         }, {
#           player_name: "Reggie Evans",
#           number: 30,
#           shoe: 14,
#           points: 12,
#           rebounds: 12,
#           assists: 12,
#           steals: 12,
#           blocks: 12,
#           slam_dunks: 7
#         }, {
#           player_name: "Brook Lopez",
#           number: 11,
#           shoe: 17,
#           points: 17,
#           rebounds: 19,
#           assists: 10,
#           steals: 3,
#           blocks: 1,
#           slam_dunks: 15
#         }, {
#           player_name: "Mason Plumlee",
#           number: 1,
#           shoe: 19,
#           points: 26,
#           rebounds: 12,
#           assists: 6,
#           steals: 3,
#           blocks: 8,
#           slam_dunks: 5
#         }, {
#           player_name: "Jason Terry",
#           number: 31,
#           shoe: 15,
#           points: 19,
#           rebounds: 2,
#           assists: 2,
#           steals: 4,
#           blocks: 11,
#           slam_dunks: 1
#         }
#       ]
#     },
#     away: {
#       team_name: "Charlotte Hornets",
#       colors: ["Turquoise", "Purple"],
#       players: [
#         {
#           player_name: "Jeff Adrien",
#           number: 4,
#           shoe: 18,
#           points: 10,
#           rebounds: 1,
#           assists: 1,
#           steals: 2,
#           blocks: 7,
#           slam_dunks: 2
#         }, {
#           player_name: "Bismak Biyombo",
#           number: 0,
#           shoe: 16,
#           points: 12,
#           rebounds: 4,
#           assists: 7,
#           steals: 7,
#           blocks: 15,
#           slam_dunks: 10
#         }, {
#           player_name: "DeSagna Diop",
#           number: 2,
#           shoe: 14,
#           points: 24,
#           rebounds: 12,
#           assists: 12,
#           steals: 4,
#           blocks: 5,
#           slam_dunks: 5
#         }, {
#           player_name: "Ben Gordon",
#           number: 8,
#           shoe: 15,
#           points: 33,
#           rebounds: 3,
#           assists: 2,
#           steals: 1,
#           blocks: 1,
#           slam_dunks: 0
#         }, {
#           player_name: "Brendan Haywood",
#           number: 33,
#           shoe: 15,
#           points: 6,
#           rebounds: 12,
#           assists: 12,
#           steals: 22,
#           blocks: 5,
#           slam_dunks: 12
#         }
#       ]
#     }
#   }
# end



# def num_points_scored(player_name)
#   #  player_name is passed in by rspecs
#   players = get_players
#   find_player(players, player_name)[:points]
# end

# def get_players
#   game_hash.map do |team_info|
#     team_info[1][:players]
#   end.flatten
# end

# def find_player(players, player_name)
#   players.find do |player|
#     player[:player_name]==player_name
#   end
# end

# def shoe_size(player_name)
#   players = get_players
#   find_player(players, player_name)[:shoe]
# end


### school's with new hash. Players are an array and not a hash ###

# def num_points_scored(player_name)
#   # player_name is passed in by rspec
#   players = get_players
#   # the variable players is set to the result of the get_players helper method, which is an array
#   find_player(players, player_name)[:points]
#   #find_player is called with 2 args. The result of get players and the player_name.
#   #the result is a hash. The value at the key of [:points] is returned.
# end

# def get_players
#   game_hash.values.map do |team_info|
#     # iterate over the game hash and return just the players values. a new array is returned
#     team_info[:players]
#   end.flatten
# end

# def find_player(players, player_name)
#   players.find do |player|
#     player[:player_name] == player_name 
#     # loop over the players array and find where the player name equals the passed in name. .find will automatically return the first instance.
#   end
# end


#   # The next test for shoe size is exactly the same, but with [:shoe]


# def shoe_size(player_name)
#   players=get_players
#   find_player(players, player_name)[:shoe]
# end

### end ###




### my code ###


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

def num_points_scored(name)
  player = find_the_player(name)
  player.fetch(:points)
end


def shoe_size(name)
  player = find_the_player(name)
  player.fetch(:shoe)
end

def team_colors(team_name)
  team = find_the_team(team_name)
  team.fetch(:colors)
end

def team_names
  teams.map{|t| t.fetch(:team_name)}
end

def player_numbers(team_name)
  find_the_team(team_name)[:players].map{ |player_name, stats| stats[:number] }
end

def player_stats(player_name)
  find_the_player(player_name)
end

def big_shoe_rebounds
  player_biggest_shoe_size.fetch(:rebounds)
end

### helpers ####

def teams
 game_hash.values
end

def find_the_team(team_name)
  teams.find {|team| team.fetch(:team_name) == team_name}
end

def players
  game_hash[:home][:players].merge(game_hash[:away][:players])
end

def find_the_player(name)
  players.fetch(name)
end

def player_biggest_shoe_size
  players.max_by{|player, stats| stats.fetch(:shoe)}[1]
end

### bonus ###

def most_points_scored
  players.max_by { |player, stats| stats.fetch(:points) }[0]
end

def winning_team
  winning_team = ''
  total_points = 0
  game_hash.each do |keys, values|
    team_points = 0
    team = game_hash[keys][:team_name]
    values[:players].each do |player|
      points = player[1][:points]
      team_points +=points
    end
    winning_team, total_points = team, team_points if team_points > total_points
  end
  winning_team
end

def player_with_longest_name
  longest_name = ''
  longest_length =0
  game_hash.each do |keys, values|
    values[:players].each do |player|
      name_length = player[0].length
      longest_name, longest_length = player[0], name_length if name_length > longest_length
    end
  end
  longest_name
end

def long_name_steals_a_ton?
  players.max_by { |player, stats| stats.fetch(:steals) }[0] == player_with_longest_name 
end


# # puts num_points_scored("Ben Gordon")
