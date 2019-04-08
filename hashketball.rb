# Write your code here!

require 'pry'

def game_hash
  
    {:home => {
      :team_name =>  "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
       "Alan Anderson" => 
         {:number => "0" , :shoe => "16", :points => "22", :rebounds => "12", :assists => "12", :steals => "3", :blocks => "1", :slam_dunks => "1"},
       
      
       "Reggie Evans" => 
         {:number => "30" , :shoe => "14", :points => "12", :rebounds => "12", :assists => "12", :steals => "12", :blocks => "12", :slam_dunks => "7"},
      
       "Brook Lopez" => 
         {:number => "11" , :shoe => "17", :points => "17", :rebounds => "19", :assists => "10", :steals => "3", :blocks => "1", :slam_dunks => "15"},
         
         "Mason Plumlee" => 
         {:number => "1" , :shoe => "19", :points => "26", :rebounds => "12", :assists => "6", :steals => "3", :blocks => "8", :slam_dunks => "5"},
         
         "Jason Terry" => 
         {:number => "31" , :shoe => "15", :points => "19", :rebounds => "2", :assists => "2", :steals => "4", :blocks => "11", :slam_dunks => "1"}
        }
    },
    
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => 
          {:number => "4" , :shoe => "18", :points => "10", :rebounds => "1", :assists => "1", :steals => "2", :blocks => "7", :slam_dunks => "2"},
      
        "Bismak Biyombo" => 
         {:number => "0" , :shoe => "16", :points => "12", :rebounds => "4", :assists => "7", :steals => "7", :blocks => "15", :slam_dunks => "10"},
      
        "Desagna Diop" => 
          {:number => "2" , :shoe => "14", :points => "24", :rebounds => "12", :assists => "12", :steals => "4", :blocks => "5", :slam_dunks => "5"},
          
          "Ben Gordon" => 
         {:number => "8" , :shoe => "15", :points => "33", :rebounds => "3", :assists => "2", :steals => "1", :blocks => "1", :slam_dunks => "0"},
         
         "Brendan Haywood" => 
         {:number => "33" , :shoe => "15", :points => "6", :rebounds => "12", :assists => "12", :steals => "22", :blocks => "5", :slam_dunks => "12"}
         }
        }
      }
end

def num_points_scored(player_name)
  
  #modifies player_name input to have capitalize first letter of first and last name
  
  array = player_name.split
  for item in array
    item.capitalize!
  end
  player_name = array.join(" ")
  
  #iterate through game_hash
  
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          #binding.pry
          if player == player_name
            #binding.pry
           return game_hash[location][attribute][player][:points].to_i
          end
        end
      end
    end
  end
end
        

def shoe_size(player_name)
  
  #modifies player_name input to have capitalize first letter of first and last name
  
  array = player_name.split
  for item in array
    item.capitalize!
  end
  player_name = array.join(" ")
  
   game_hash.collect do |location, team_data|
    team_data.collect do |attribute, data|
      if attribute == :players
        data.collect do |player, stats|
          if player == player_name
          #binding.pry
          return game_hash[location][attribute][player][:shoe].to_i
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  
  #capitalize first letters of team names to match game_hash
   array = team_name.split
    for item in array
      item.capitalize!
    end
    team_name = array.join(" ")
    
    #iterate through game_hash
    
   game_hash.collect do |location, team_data|
    team_data.collect do |attribute, data|
      if attribute == :team_name
        if data == team_name
            return game_hash[location][:colors]
        end
      end
    end
  end
end

def team_names
  arr = []
  game_hash.collect do |location, team_data|
    team_data.collect do |attribute, data|
      if attribute == :team_name
        #binding.pry
        arr.push(data)
      end
    end
  end
  arr
end

def player_numbers(team_name)
  
  #capitalize first letters of team names to match game_hash
   array = team_name.split
    for item in array
      item.capitalize!
    end
    team_name = array.join(" ")
    
  arr = []
  game_hash.collect do |location, team_data|
    team_data.collect do |attribute, data|
      if attribute == :team_name
        if data == team_name
          team_data.collect do |attribute, data|
            if attribute == :players
              data.collect do |player, stats|
                arr.push(game_hash[location][attribute][player][:number].to_i)
              end
            end
          end
        end
      end
    end
  end
  arr
end



def player_stats(player_name)
  #modifies player_name input to have capitalize first letter of first and last name
  
  array = player_name.split
  for item in array
    item.capitalize!
  end
  player_name = array.join(" ")
  
  game_hash.collect do |location, team_data|
    team_data.collect do |attribute, data|
      if attribute == :players
        data.collect do |player, stats|
          if player == player_name
            hash = stats
            hash.collect do |key, value|
              hash[key] = value.to_i
            end
            return hash
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  biggest = 0
  rebounds = 0
  game_hash.collect do |location, team_data|
    team_data.collect do |attribute, data|
      if attribute == :players
        data.collect do |player, stats|
          stats.collect do |key, value|
            if key == :shoe
             # binding.pry
              if value.to_i > biggest
                biggest = value.to_i
                rebounds = game_hash[location][attribute][player][:rebounds].to_i
               # binding.pry
              end
            end
          end
        end
      end
    end
  end
  return rebounds
end

              
            
        
        
        
      
    
    










