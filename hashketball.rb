def game_hash
  hash = {
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


def num_points_scored(name)
  hash = game_hash
  hash.each do |location, info|
    info.each do |attribute, data|
      if data.include?(name)
       return hash[location][attribute][name][:points]
      end
    end
  end
end


def shoe_size(name)
  hash = game_hash
  hash.each do |location, info|
    info.each do |attribute, data|
      if data.include?(name)
       return hash[location][attribute][name][:shoe]
      end
    end
  end
end

def team_names
  hash = game_hash
  array = []
  hash.each do |location, attributes|
    attributes.each do |attribute, info|
      if attribute == :team_name
        array << info
      end
    end
  end
  return array
end

def team_colors(team_name)
  hash = game_hash
  array = []
  hash.each do |location, attributes|
    if hash[location].values.include?(team_name)
      attributes.each do |attribute, info|
        if attribute == :colors
          return info
        end
      end
    end
  end
end

def player_numbers(team_name)
  hash = game_hash
  array = []
  hash.each do |location, attributes|
    if hash[location].values.include?(team_name)
      attributes.each do |attribute, info|
        if info.class == Hash
          info.each do |player, stats|
            stats.each do |stat, int|
              if stat == :number
                array << int.to_i
              end
            end
          end
        end
      end
    end
  end
  return array
end



def player_stats(name)
  hash = game_hash
  hash.each do |location, attributes|
    attributes.each do |attribute, info|
      if info.include?(name)
       return hash[location][attribute][name]
      end
    end
  end
end

def big_shoe_rebounds
  hash = game_hash
  player_name = ""
  shoe_size = 0
  hash.each do |location, attributes|
    attributes.each do |attribute, info|
      if info.class == Hash
        info.each do |player, stats|
            stats.each do |stat, int|
              if stat == :shoe
                if int > shoe_size
                  shoe_size = int
                  player_name = player
                end
              end
            end
          end
        return hash[location][attribute][player_name][:rebounds]
      end
    end
  end
end


def most_points_scored
  hash = game_hash
  most_points = 0

  player = ""

  hash.each do |location, info|
    info.each do |attribute, data|
      if attribute == :players
        data.each do |stat, info|
          if info[:points] > most_points
            most_points =  info[:points]
            player = stat
            #return data
          end
        end

      end
    end
  end
#   puts team
  return player
end




def winning_team
  hash = game_hash
  home_team = 0
  away_team = 0

  hash.each do |location, info|
    #return hash[:away]
    info.each do |attribute, data|
      if location == :home
        if attribute == :players
        data.each do |stat, info|
          if info[:points]
            home_team +=  info[:points]
            #player = stat
          end
        end

      end
      end

      if location == :away
        if attribute == :players
        data.each do |stat, info|
          if info[:points]
            away_team +=  info[:points]
            #player = stat
            #return data
          end
        end

      end
      end
    end
  end

  if home_team > away_team
    return "Brooklyn Nets"
  else
    return "Charlotte Hornets"
  end
end


def player_with_longest_name
  hash = game_hash
  player_name = ""

  hash.each do |location, info|
    info.each do |attribute, data|
    #return info
      if attribute == :players
        data.each do |name, stat|
          if name.length > player_name.length
            player_name = name
          end
        end
      #return hash[location][attribute].keys
      #  if player_name.length > hash[location][attribute].keys.length
      #  puts hash[location][attribute].keys
      #  end

      end
    end
  end
  return player_name
end



def long_name_steals_a_ton?
  hash = game_hash
  player_name = ""
  steals = 0

  #hash.each {|location, info|
  #  info.each {|attribute, data|
  #    if attribute == :players
  #      data.each {|name, stat|
  #stat.each {|skill, num|
  #          #return skill
  #          if skill == :steals && num > steals
  #          #return num
  #            #if steals > num
  #             steals = num
  #             #puts steals
  #            #end
  #          end
  #        }
  #      }
  #    end
  #  }
  #}
#puts steals

  hash.each { |location, info|
    info.each { |attribute, data|
      if attribute == :players
        data.each {|name, stat|
          if name.length >player_name.length
            player_name = name
          end

          stat.each {|skill, num|
            #return skill
            if skill == :steals && num > steals
            #return num
              #if steals > num
               steals = num
               #puts steals
              #end
            end
          }

          #if name == ""
        }

      end

    }

  }

  hash.each {|location, info|
    info.each {|attribute, data|
      if attribute == :players
        data.each {|name, stat|
          if name == player_name
            stat.each {|skill, num|
              if skill == :steals
                if num > steals
                return false
                else
                return true
                end
              end
            }

          end

        }
      end
   }
  }

  #puts steals
  #puts player_name
end
