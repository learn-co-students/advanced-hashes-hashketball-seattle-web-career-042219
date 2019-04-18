def game_hash
  game_hash = {
    :home => {
      :team_name => 'Brooklyn Nets',
      :colors => ['Black', 'White'],
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
      :team_name => 'Charlotte Hornets',
      :colors => ['Turquoise', 'Purple'],
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
def num_points_scored (playerName)
  stat = 0
  game_hash.each do |team, info|
    info.each do |info, data|
      if info == :players
        data.each do |names, stats|
        if names == playerName
          stat =  stats[:points]
          puts stat
        end
      end
     end
    end
  end
  stat
end
def shoe_size (playerName)
  shoe_size = 0
  game_hash.each do |team, info|
    info.each do |info, data|
      if info == :players
        data.each do |names, stats|
          if names == playerName
            shoe_size = stats[:shoe]
          end
        end
      end
    end
  end
  shoe_size
end
def team_colors (team_name)
  colorsArray = []
  game_hash.each do |team, info|
    if info[:team_name] == team_name
      info.each do |category, information|
        if category == :colors
          colorsArray<< information
        end
      end
    end
  end
  colorsArray.flatten
end
def team_names
  teamsArray = []
  game_hash.each do |home_away, info|
    info.each do |categories, information|
      if categories == :team_name
        teamsArray<< information
      end
    end
  end
  teamsArray
end
def player_numbers (team_name)
  jerseyArray = []
  game_hash.each do |team, info|
    if info[:team_name] == team_name
      info.each do |category, information|
        if category == :players
          information.each do |player, stats|
            jerseyArray << stats[:number]
          end
        end
      end
    end
  end
  jerseyArray
end
def player_stats (player_name)
  hash = Hash.new
  game_hash.each do |home_away, info|
    info.each do |category, information|
      if category == :players
         information.collect do |names, stats|
          if names == player_name
            hash = stats
          end
        end
      end
    end
  end
  hash
end

def big_shoe_rebounds
  hash = {}
  answer = 0
  game_hash.each do |home_away, info|
    info.each do |category, information|
      if category == :players
         information.collect do |names, stats|
          hash[names] = stats[:shoe]
        end
      end
    end
  end
  array = hash.max_by{|k,v| v}
  player_name = array[0]
  game_hash.each do |home_away, info|
    info.each do |category, information|
      if category == :players
        information.collect do |names, stats|
          if names == player_name
            answer = stats[:rebounds]
          end
        end
      end
    end
  end
  answer
end
