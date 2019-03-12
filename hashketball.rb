# Write your code here!
require 'pry'



def game_hash

  {
     home:
     {team_name: "Brooklyn Nets",
     colors: ["Black", "White"],
     players: [{
       "Alan Anderson" => {number: "0", shoe: "16", points: "22", rebounds: "12", assists: "12",
       steals: "3", blocks: "1", slam_dunks: "1"}

     },
     {
       "Reggie Evans" => {number: "30", shoe: "14", points: "12", rebounds: "12", assists: "12",
       steals: "12", blocks: "12", slam_dunks: "7"}

     },

     {
       "Brook Lopez" => {number: "11", shoe: "17", points: "17", rebounds: "19", assists: "10",
       steals: "3", blocks: "1", slam_dunks: "15"}

     },
     {
       "Mason Plumlee" => {number: "1", shoe: "19", points: "26", rebounds: "12", assists: "6",
       steals: "3", blocks: "8", slam_dunks: "5"}

     },

     {
       "Jason Terry" => {number: "31", shoe: "15", points: "19", rebounds: "2", assists: "2",
       steals: "4", blocks: "11", slam_dunks: "1"}

     }]


   },

     away:
     {
     team_name: "Charlotte Hornets",

     colors: ["Turquoise", "Purple"],

     players: [{
       "Jeff Adrien" => {number: "4", shoe: "18", points: "10", rebounds: "1", assists: "1",
       steals: "2", blocks: "7", slam_dunks: "2"}

     },

     {
       "Bismak Biyombo" => {number: "0", shoe: "16", points: "12", rebounds: "4", assists: "7",
       steals: "7", blocks: "15", slam_dunks: "10"}

     },

     {
       "DeSagna Diop" => {number: "2", shoe: "14", points: "24", rebounds: "12", assists: "12",
       steals: "4", blocks: "5", slam_dunks: "5"}

     },

     {
       "Ben Gordon" => {number: "8", shoe: "15", points: "33", rebounds: "3", assists: "2",
       steals: "1", blocks: "1", slam_dunks: "0"}

     },

     {
       "Brendan Haywood" => {number: "33", shoe: "15", points: "6", rebounds: "12", assists: "12",
       steals: "22", blocks: "5", slam_dunks: "12"}

     }]

    }

   }
 end

 def big_shoe_rebounds
   big_playa = game_hash.map do |location, team_data|
     team_data.map do |attribute, data|
       if attribute == :players
         data.map do |data_item|
           {data_item.values.first[:shoe].to_i => data_item.keys.join}
           #binding.pry
         end
       end
     end
   end.flatten.reject{|element| element.nil?}.sort_by{|k| k.keys}.reverse[0].values.join#.map do |shoe_hash|

num_rebounds = game_hash.map do |location, team_data|
  team_data.map do |attribute, data|
    if attribute == :players
      data.map do |data_item|
        data_item.map do |name, player_stat|
          if name == big_playa
            player_stat[:rebounds].to_i
          end
        end
      end
    end
  end
end.flatten.reject{|element| element.nil?}
num_rebounds[0]
 end

 def num_points_scored(player_name)
   points_scored = nil
   game_hash.each do |location, team_data|
     team_data.each do |attribute, data|
       if attribute == :players
       data.each do |data_item|
          data_item.each do |name, player_stat|
            if name == player_name
              player_stat.each do |each_stat, value|
                if each_stat == :points
                  points_scored = value
                  #binding.pry
                end
            end
            end
          end
        end
         end
     end
   end
   points_scored.to_i
 end

 def shoe_size(player_name)
   size = nil
   game_hash.each do |location, team_data|
     team_data.each do |attribute, data|
       if attribute == :players
       data.each do |data_item|
          data_item.each do |name, player_stat|
            if name == player_name
              player_stat.each do |each_stat, value|
                if each_stat == :shoe
                  size = value
                  #binding.pry
                end
            end
            end
          end
        end
         end
     end
   end
   size.to_i

 end

 def team_colors(team)
   team_colors = nil
   game_hash.each do |location, team_data|
     #binding.pry
     if team_data[:team_name] == team
       team_colors = team_data[:colors]
       #binding.pry
     end
  end
  team_colors
 end

 def team_colors(team)
   team_colors = nil
   game_hash.each do |location, team_data|
     #binding.pry
     if team_data[:team_name] == team
       team_colors = team_data[:colors]
       #binding.pry
     end
  end
  team_colors
 end

 def team_names
   game_hash.map do |location, team_data|
     team_data[:team_name]
   end
 end

 def player_numbers(team_name)
   empty = []
   game_hash.map do |location, team_data|
     if team_data[:team_name] == team_name
     team_data.map do |attribute, data|
       #binding.pry
       if attribute == :players
         #binding.pry
       data.map do |data_item|
         #binding.pry
         data_item.map do |name, player_stat|
             player_stat.map do |each_stat, value|
               if each_stat == :number
                 empty << value.to_i
                 #binding.pry
               end
             end
           end
         end
           #binding.pry
         end
     end
     end
   end
empty
 end

 def player_stats(player_name)
   stats_hash = {}
   game_hash.each do |location, team_data|
     team_data.each do |attribute, data|
       if attribute == :players
       data.each do |data_item|
          data_item.each do |name, player_stat|
            if name == player_name
              player_stat.each do |stat_name, value|
                stats_hash[stat_name] = value.to_i
              end
            end
          end
        end
      end
     end
   end
   stats_hash
 end

 def good_practices
   game_hash.each do |location, team_data|
     #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
     #binding.pry
       team_data.each do |attribute, data|
         #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        # binding.pry

         #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
         if attribute == :players
         data.each do |data_item|
             #binding.pry
           end
       end
     end
   end
 end

 good_practices
