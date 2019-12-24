require "pry"
def game_hash
  hash = {home: {team_name:"Brooklyn Nets", colors: ["Black", "White"], 
  players: [{"Alan Anderson" => {number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1}}, 
  {"Reggie Evans" => {number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7}},
  {"Brook Lopez" => {number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15}},
  {"Mason Plumlee" => {number: 1, shoe: 19, points: 26, rebounds: 11, assists: 6, steals: 3, blocks: 8, slam_dunks: 5}},
  {"Jason Terry" => {number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}}]}, 
  away: {team_name:"Charlotte Hornets", colors: ["Purple", "Turquoise"], 
  players: [{"Jeff Adrien" => {number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2}}, 
  {"Bismack Biyombo" => {number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 22, blocks: 15, slam_dunks: 10}},
  {"DeSagna Diop" => {number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5}},
  {"Ben Gordon" => {number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0}},
  {"Kemba Walker" => {number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 7, blocks: 5, slam_dunks: 12}}]}}
end

def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
    team_data.each do |attribute, data|
      #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
      binding.pry
 
      #what is 'data' at each loop throughout .each block? when will the following line of code work and when will it break?
      data.each do |data_item|
          binding.pry
      end
    end
  end
end

#good_practices

def num_points_scored(name)
  game_hash[:home][:players].each do |home_item|
    if home_item[name]
      return home_item[name][:points]
    else
      game_hash[:away][:players].each do |away_item|
        if away_item[name]
          return away_item[name][:points]
        end
      end
    end
  end
  "No player found."
end

def shoe_size(name)
  game_hash[:home][:players].each do |home_item|
    if home_item[name]
      return home_item[name][:shoe]
    else
      game_hash[:away][:players].each do |away_item|
        if away_item[name]
          return away_item[name][:shoe]
        end
      end
    end
  end
  "No player found."
end

def team_colors(name)
 if game_hash[:home][:team_name] == name
    return game_hash[:home][:colors]
  elsif
    game_hash[:away][:team_name] == name
      return game_hash[:away][:colors]
  end
  "No team found."
end

def team_names
  [game_hash[:home][:team_name], game_hash[:away][:team_name]]
end

def player_numbers(name)
  arr = []
  if game_hash[:home][:team_name] == name
    game_hash[:home][:players].each do |home_item|
      home_item.each do |player, values|
        arr << values[:number]        
      end
    end
    return arr
  elsif game_hash[:away][:team_name] == name
    game_hash[:away][:players].each do |away_item|  
      away_item.each do |player, values|
        arr << values[:number]        
      end
    end
    return arr
  end
  "No team found."
end

def player_stats(name)
  game_hash[:home][:players].each do |home_item|
    if home_item[name]
      home_item.each do |player, values|
        return values       
      end
    else 
      game_hash[:away][:players].each do |away_item|
        if away_item[name]
          away_item.each do |player, values|
            return values     
          end
        end
      end
    end
  end
  "No player found."
end

def big_shoe_rebounds
  max = 0
  name = ""
  game_hash[:home][:players].each do |home_item|
    home_item.each do |player, values|
      if values[:shoe] > max
        max = values[:shoe]
        name = player
      end
    end
  end  
  game_hash[:away][:players].each do |away_item|  
    away_item.each do |player, values|
      if values[:shoe] > max
        max = values[:shoe]
        name = player
      end    
    end
  end
  game_hash[:home][:players].each do |home_item|
    if home_item[name]
      return home_item[name][:rebounds]
    else
      game_hash[:away][:players].each do |away_item|
        if away_item[name]
          return away_item[name][:rebounds]
        end
      end
    end
  end
end

#bonus
def most_points_scored
  max = 0
  name = ""
  game_hash[:home][:players].each do |home_item|
    home_item.each do |player, values|
      if values[:points] > max
        max = values[:points]
        name = player
      end
    end
  end  
  game_hash[:away][:players].each do |away_item|  
    away_item.each do |player, values|
      if values[:points] > max
        max = values[:points]
        name = player
      end    
    end
  end
  name
end

def winning_team
  home_points = 0
  away_points = 0
  game_hash[:home][:players].each do |home_item|
    home_item.each do |player, values|
      home_points += values[:points]
    end
  end
  game_hash[:away][:players].each do |away_item|  
    away_item.each do |player, values|
      away_points += values[:points]
    end
  end
  if home_points > away_points
    game_hash[:home][:team_name]
  else
    game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  max = 0
  name = ""
  game_hash[:home][:players].each do |home_item|
    home_item.each do |player, values|
      if player.length > max
        max = player.length
        name = player
      end
    end
  end  
  game_hash[:away][:players].each do |away_item|  
    away_item.each do |player, values|
      if player.length > max
        max = player.length
        name = player
      end    
    end
  end
  name
end

#super bonus
def long_name_steals_a_ton?
  max = 0
  name = ""
  game_hash[:home][:players].each do |home_item|
    home_item.each do |player, values|
      if values[:steals] > max
        max = values[:steals]
        name = player
      end
    end
  end  
  game_hash[:away][:players].each do |away_item|  
    away_item.each do |player, values|
      if values[:steals] > max
        max = values[:steals]
        name = player
      end    
    end
  end
  long_name = player_with_longest_name
  if name == long_name
    return true
  else
    return false
  end
end
