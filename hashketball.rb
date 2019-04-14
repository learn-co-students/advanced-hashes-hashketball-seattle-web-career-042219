require 'pry'

def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => "0",
          :shoe => "16",
          :points => "22",
          :rebounds => "12",
          :assists => "12",
          :steals => "3",
          :blocks => "1",
          :slam_dunks=> "1"
          },
          "Reggie Evans" => {
            :number => "30",
            :shoe => "14",
            :points => "12",
            :rebounds => "12",
            :assists => "12",
            :steals => "12",
            :blocks => "12",
            :slam_dunks=> "7"
          },
          "Brook Lopez" => {
            :number => "11",
            :shoe => "17",
            :points => "17",
            :rebounds => "19",
            :assists => "10",
            :steals => "3",
            :blocks => "1",
            :slam_dunks=> "15"
          },
          "Mason Plumlee" => {
            :number => "1",
            :shoe => "19",
            :points => "26",
            :rebounds => "12",
            :assists => "6",
            :steals => "3",
            :blocks => "8",
            :slam_dunks=> "5"
          },
          "Jason Terry" => {
            :number => "31",
            :shoe => "15",
            :points => "19",
            :rebounds => "2",
            :assists => "2",
            :steals => "4",
            :blocks => "11",
            :slam_dunks=> "1"
          }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => "4",
          :shoe => "18",
          :points => "10",
          :rebounds => "1",
          :assists => "1",
          :steals => "2",
          :blocks => "7",
          :slam_dunks=> "2"
          },
          "Bismak Biyombo" => {
            :number => "0",
            :shoe => "16",
            :points => "12",
            :rebounds => "4",
            :assists => "7",
            :steals => "7",
            :blocks => "15",
            :slam_dunks=> "10"
          },
          "DeSagna Diop" => {
            :number => "2",
            :shoe => "14",
            :points => "24",
            :rebounds => "12",
            :assists => "12",
            :steals => "4",
            :blocks => "5",
            :slam_dunks=> "5"
          },
          "Ben Gordon" => {
            :number => "8",
            :shoe => "15",
            :points => "33",
            :rebounds => "3",
            :assists => "2",
            :steals => "1",
            :blocks => "1",
            :slam_dunks=> "0"
          },
          "Brendan Haywood" => {
            :number => "33",
            :shoe => "15",
            :points => "6",
            :rebounds => "12",
            :assists => "12",
            :steals => "22",
            :blocks => "5",
            :slam_dunks=> "12"
          }
      }
    }
  }
end

def num_points_scored(player_name)
  game_hash.each do |location, data|
    if game_hash[location][:players][player_name]
      return game_hash[location][:players][player_name][:points].to_i
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |location, data|
    if game_hash[location][:players][player_name]
      return game_hash[location][:players][player_name][:shoe].to_i
    end
  end
end

def team_colors(team_name)
  game_hash.each do |location, data|
    if game_hash[location][:team_name] == team_name
      return game_hash[location][:colors]
    end
  end
end

def team_names
  teams = []
  game_hash.each do |location, data|
     teams.push(game_hash[location][:team_name])
  end
  teams
end

def player_numbers(team_name)
  numbers = []
  game_hash.each do |location, data|
    if game_hash[location][:team_name] == team_name
        game_hash[location][:players].each do |player, details|
          numbers.push(game_hash[location][:players][player][:number].to_i)
      end
    end
  end
  numbers
end

def player_stats(player_name)
  stats = nil
  game_hash.each do |location, data|
    if game_hash[location][:players][player_name]
      stats =  game_hash[location][:players][player_name]
    end
  end
  stats.map { |key, value | stats[key] = value.to_i}
  stats
  end

  def big_shoe_rebounds
      shoe_size = nil
      shoe_max = 0
      player_name_max = nil

      game_hash.each do |location, data|
            data[:players].each do |player, values|
                values.each do | key, value|
                  if key == :shoe
                     shoe_size = value.to_i
                     if (shoe_size > shoe_max)
                         shoe_max = shoe_size
                         player_name_max = key
                     end
                  end
                end

                return values[:rebounds].to_i
            end
        end
    end
