 # Write your code here!
require "pry"

def game_hash
game_hash = {
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => [
      {:player_name => "Alan Anderson",
       :number => 0,
       :shoe => 16,
       :points => 22,
       :rebounds => 12,
       :assists => 12,
       :steals => 3,
       :blocks => 1,
       :slam_dunks => 1
      },
      {:player_name => "Reggie Evans",
       :number => 30,
       :shoe => 14,
       :points => 12,
       :rebounds => 12,
       :assists => 12,
       :steals => 12,
       :blocks => 12,
       :slam_dunks => 7
      },
      {:player_name => "Brook Lopez",
       :number => 11,
       :shoe => 17,
       :points => 17,
       :rebounds => 19,
       :assists => 10,
       :steals => 3,
       :blocks => 1,
       :slam_dunks => 15
      },
      {:player_name => "Mason Plumlee",
       :number => 1,
       :shoe => 19,
       :points => 26,
       :rebounds => 11,
       :assists => 6,
       :steals => 3,
       :blocks => 8,
       :slam_dunks => 5
      },
      {:player_name => "Jason Terry",
       :number => 31,
       :shoe => 15,
       :points => 19,
       :rebounds => 2,
       :assists => 2,
       :steals => 4,
       :blocks => 11,
       :slam_dunks => 1
      }
      ]
  },
  :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => [
      {:player_name => "Jeff Adrien",
       :number => 4,
       :shoe => 18,
       :points => 10,
       :rebounds => 1,
       :assists => 1,
       :steals => 2,
       :blocks => 7,
       :slam_dunks => 2
      },
      {:player_name => "Bismack Biyombo",
       :number => 0,
       :shoe => 16,
       :points => 12,
       :rebounds => 4,
       :assists => 7,
       :steals => 22,
       :blocks => 15,
       :slam_dunks => 10
      },
      {:player_name => "DeSagna Diop",
       :number => 2,
       :shoe => 14,
       :points => 24,
       :rebounds => 12,
       :assists => 12,
       :steals => 4,
       :blocks => 5,
       :slam_dunks => 5
      },
      {:player_name => "Ben Gordon",
       :number => 8,
       :shoe => 15,
       :points => 33,
       :rebounds => 3,
       :assists => 2,
       :steals => 1,
       :blocks => 1,
       :slam_dunks => 0
      },
      {:player_name => "Kemba Walker",
       :number => 33,
       :shoe => 15,
       :points => 6,
       :rebounds => 12,
       :assists => 12,
       :steals => 7,
       :blocks => 5,
       :slam_dunks => 12
      }
      ]
  }
}
end

def num_points_scored(name)
  game_hash.each do |location, team| 
    team.each do |stat, info|
      if stat == :players
        info.each do |player|
          if player[:player_name] == name
            return player[:points]
          end   
        end 
      end 
    end 
  end 
end

def shoe_size(name)
  game_hash.each do |location, team|
    team.each do |stat, info|
      if stat == :players
        info.each do |player|
          if player[:player_name] == name
            return player[:shoe]
          end   
        end 
      end 
    end 
  end 
end

def team_colors(team_name)
  game_hash.each do |location, team| 
     if team[:team_name] == team_name
       return team[:colors]
     end 
  end 
end

def team_names
  game_hash.map do |location, team|
    team[:team_name]
 end
end

def player_numbers(team_name)
  number = []
  game_hash.map do |location, team|
    if team[:team_name] == team_name
      team.each do |stat, info|
        if stat == :players
          info.each do |player|
            number << player[:number]
          end 
        end 
      end
    end
  end
  number
end

def player_stats(name)
  stats_hash = {}
  game_hash.each do |location, teams|
    teams.each do |stat, info|
      if stat == :players
        info.each do |player|
          if player[:player_name] == name 
            stats_hash = player.delete_if do |key, value|
              key == :player_name
            end
         end
       end
     end
   end
 end
 stats_hash
end

def big_shoe_rebounds
  largest_shoe = 0
  rebounds = 0
  game_hash.each do |location, team|
    team.each do |stat, info|
      if stat == :players
        info.each do |player|
          if player[:shoe] > largest_shoe
            largest_shoe = player[:shoe]
            rebounds = player[:rebounds]
          end
        end
      end
    end
  end
  rebounds
end

def most_points_scored
  points_scored = 0 
  scoring_player = 0
  game_hash.each do |location, team|
    team.each do |stat, info|
      if stat == :players
        info.each do |player|
          if player[:points] > points_scored
            points_scored = player[:points]
            scoring_player = player[:player_name]
          end
        end
      end
    end
  end
  scoring_player
end

def winning_team
  home_points = 0 
  away_points = 0 
  game_hash.each do |location, team|
      team.each do |stat, info|
        if stat == :players
        info.each do |player|
          if location == :home
            home_points += player[:points]
          end
          if location == :away 
            away_points += player[:points]
          end
          if home_points > away_points
            return game_hash[:home][:team_name]
          end
          if away_points > home_points
            return game_hash[:away][:team_name]
          end
        end
      end
    end
  end
end

def player_with_longest_name
  longest_name_length = 0 
  longest_name_player = 0
  game_hash.each do |location, team|
    team.each do |stat, info|
      if stat == :players
        info.each do |player|
          if player[:player_name].length > longest_name_length
            longest_name_length = player[:player_name].length
            longest_name_player = player[:player_name]
          end
        end
      end
    end
  end
  longest_name_player
end

def long_name_steals_a_ton?
  number_steals = 0 
  stealing_player = 0
  game_hash.each do |location, team|
    team.each do |stat, info|
      if stat == :players
        info.each do |player|
          if player[:steals] > number_steals
            number_steals = player[:steals]
            stealing_player = player[:player_name]
          end
          
        end
      end
    end
  end
  if stealing_player == player_with_longest_name
   true 
  end
end
