def game_hash
  {
    away: { team_name: 'Charlotte Hornets',
      colors: %w[Turquoise Purple],
      players: [
        { player_name: 'Jeff Adrien',
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2 },
        { player_name: 'Bismack Biyombo',
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10 },
        { player_name: 'DeSagna Diop',
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5 },
        { player_name: 'Ben Gordon',
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0 },
        { player_name: 'Kemba Walker',
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12 }
            ] },
    home: { team_name: 'Brooklyn Nets',
      colors: %w[Black White],
      players: [
        { player_name: 'Alan Anderson',
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1 },
        { player_name: 'Reggie Evans',
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7 },
        { player_name: 'Brook Lopez',
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15 },
        { player_name: 'Mason Plumlee',
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5 },
        { player_name: 'Jason Terry',
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1 }
      ] }
  }
end

require 'pry'

def num_points_scored(player_search)
  game_hash.each do |team, team_info|
    team_info[:players].each do |player|
      if player[:player_name] == player_search
        return player[:points]
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |team, team_info|
    team_info[:players].each do |player|
      if player[:player_name] == name
        return player[:shoe]
      end
    end
  end
end

def team_colors(team_input)
  if team_input.downcase == "charlotte hornets" 
    return game_hash[:away][:colors]
  else return game_hash[:home][:colors]
  end
end

def team_names
  game_hash.map do |team, team_info|
    team_info[:team_name]
  end
end

def player_numbers(input)
  output = []
  game_hash.each do |team, team_info|
    if team_info[:team_name] == input 
      team_info.each do |key, value|
        if key == :players
          value.each do |player|
          output.push(player[:number])
          end
        end
      end
    end
  end
  return output
end

def player_stats(input)
  game_hash.each do |team, team_info|
    team_info.each do |key, value|
      if key == :players
        value.each do |player|
          if input == player[:player_name]
            player.delete(:player_name) # having player name inside the hash was a bad idea!
            return player
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  big_shoe = 0
  rebounds = 0
  game_hash.each do |team, team_info|
    team_info[:players].each do |player|
      if player[:shoe] > big_shoe
        big_shoe = player[:shoe]
        rebounds = player[:rebounds]
      end
    end
  end
  return rebounds
end

def most_points_scored
  game_hash.each do |team, team_info|
    team_info[:players].each do |player|
        if player[:points] > 32
          return player[:player_name]
      end
    end
  end
end

p most_points_scored

def winning_team
  awa = []
  hom = []
  
  game_hash.each do |team, team_info|
    if team == :away
    team_info[:players].each do |player|
      awa << player[:points]
    end 
  end
end
  
  game_hash.each do |team, team_info| 
    if team == :home
        team_info[:players].each do |player|
          hom << player[:points]
        end 
    end
  end
    
if awa.sum < hom.sum
  return game_hash[:home][:team_name]
else if (awa.sum) > (hom.sum)
  return game_hash[:away][:team_name]
    end
  end
end 

p winning_team

def player_with_longest_name
  nam = []
  game_hash.each do |team, team_info|
    team_info[:players].each do |player|
      nam << player[:player_name]
    end 
  end 
  
return nam.max_by { |n| n.length }
end

p player_with_longest_name

def long_name_steals_a_ton? 
  nam = []
  stel = []

  game_hash.each do |team, team_info|
    team_info[:players].each do |player|
      nam << player[:player_name]
    end 
  end

  game_hash.each do |team, team_info|
    team_info[:players].each do |player|
      stel << player[:steals]
    end 
  end


  longest_name = nam.max_by { |n| n.length }


  if stel.find_index(stel.max) == (nam.find_index(longest_name))
    return true 
  else 
    return false 
  end 
end

p long_name_steals_a_ton?




