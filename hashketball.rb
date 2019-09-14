# Write your code here!
require "pry"

def game_hash
  new_hash = {}
  new_hash[:home] = {
    :team_name => "Brooklyn Nets", :colors => ["Black", "White"], :players => [
      "Alan Anderson" => {:number => "0", :shoe => "16", :points => "22", :rebounds => "12", :assists => "12", :steals => "3", :blocks => "1", :slam_dunks => "1"},
      "Reggie Evans" => {:number => "30", :shoe => "14", :points => "12", :rebounds => "12", :assists => "12", :steals => "12", :blocks => "12", :slam_dunks => "7"},
      "Brook Lopez" => {:number => "11", :shoe => "17", :points => "17", :rebounds => "19", :assists => "10", :steals => "3", :blocks => "1", :slam_dunks => "15"},
      "Mason Plumlee" => {:number => "1", :shoe => "19", :points => "26", :rebounds => "11", :assists => "6", :steals => "3", :blocks => "8", :slam_dunks => "5"},
      "Jason Terry" => {:number => "31", :shoe => "15", :points => "19", :rebounds => "2", :assists => "2", :steals => "4", :blocks => "11", :slam_dunks => "1"}
    ]
  }
  new_hash[:away] = {
    :team_name => "Charlotte Hornets", :colors => ["Turquoise", "Purple"], :players => [
      "Jeff Adrien" => {:number => "4", :shoe => "18", :points => "10", :rebounds => "1", :assists => "1", :steals => "2", :blocks => "7", :slam_dunks => "2"},
      "Bismack Biyombo" => {:number => "0", :shoe => "16", :points => "12", :rebounds => "4", :assists => "7", :steals => "22", :blocks => "15", :slam_dunks => "10"},
      "DeSagna Diop" => {:number => "2", :shoe => "14", :points => "24", :rebounds => "12", :assists => "12", :steals => "4", :blocks => "5", :slam_dunks => "5"},
      "Ben Gordon" => {:number => "8", :shoe => "15", :points => "33", :rebounds => "3", :assists => "2", :steals => "1", :blocks => "1", :slam_dunks => "0"},
      "Kemba Walker" => {:number => "33", :shoe => "15", :points => "6", :rebounds => "12", :assists => "12", :steals => "7", :blocks => "5", :slam_dunks => "12"}
      ]
  }
  new_hash
end

def num_points_scored(player_name)
  # How many points did he score?
  total_points = 0
  new_hash = game_hash
  new_hash.each do |team, players|
    players[:players].each do |names|
      names.each do |this_player, name|
      # binding.pry
        if this_player == player_name
          return name[:points].to_i
        end
        names.each do |player, stats|
          if player == player_name
            total_points += stats[:points].to_i
          end
        end
      end
    end
  end
  total_points
end

def shoe_size(player_name)
  # How many points did he score?
  total_points = 0
  new_hash = game_hash
  new_hash.each do |team, players|
    players[:players].each do |names|
      names.each do |this_player, name|
      # binding.pry
        if this_player == player_name
          return name[:shoe].to_i
        end
        names.each do |player, stats|
          if player == player_name
            total_points += stats[:points].to_i
          end
        end
      end
    end
  end
  total_points
end

def team_colors(team_name)
  new_hash = game_hash
  new_hash.each do |team, players|
    # binding.pry
    if players[:team_name] == team_name
      return players[:colors]
    end
  end
end

def team_names
  new_hash = game_hash
  teams = []
  new_hash.each do |team, players|
    # binding.pry
    teams << players[:team_name]
  end
  teams
end

def player_numbers(team_name)
  new_hash = game_hash
  player_numbers = []
  new_hash.each do |team, players|
    if players[:team_name] == team_name
      players[:players].each do |names|
        names.each do |this_player, name|
          # binding.pry
          player_numbers << name[:number].to_i
        end
      end
    end
  end
  player_numbers
end

def player_stats(player_name)
  new_hash = game_hash
  stat_hash = {}
  new_hash.each do |team, players|
      players[:players].each do |names|
        names.each do |this_player, name|
          if this_player == player_name
            stat_hash = {:number => name[:number].to_i, :shoe => name[:shoe].to_i, :points => name[:points].to_i, :rebounds => name[:rebounds].to_i, :assists => name[:assists].to_i, :steals => name[:steals].to_i, :blocks => name[:blocks].to_i, :slam_dunks => name[:slam_dunks].to_i}
          end
        end
      end
  end
  stat_hash
end

def big_shoe_rebounds
  new_hash = game_hash
  big_shoe = 0
  new_hash.each do |team, players|
      players[:players].each do |names|
        names.each do |this_player, name|
          # binding.pry
          if name[:shoe].to_i > big_shoe
            big_shoe = name[:shoe].to_i
          end
        end
        names.each do |this_player, name|
          if name[:shoe].to_i == big_shoe
            return name[:rebounds].to_i
          end
        end
      end
  end
end

def most_points_scored
  new_hash = game_hash
  most_points = 0
  new_hash.each do |team, players|
      players[:players].each do |names|
        names.each do |this_player, name|
          # binding.pry
          if name[:points].to_i > most_points
            most_points = name[:points].to_i
          end
        end
      end
  end
  new_hash.each do |team, players|
      players[:players].each do |names|
        names.each do |this_player, name|
          if name[:points].to_i == most_points
            return this_player
          end
        end
      end
  end
end

def winning_team
  new_hash = game_hash
  team_one = 0
  team_two = 0
  new_hash.each do |team, players|
      players[:players].each do |names|
        if players[:team_name] == "Brooklyn Nets"
          names.each do |this_player, name|
            # binding.pry
            team_one += name[:points].to_i
          end
        end
      end
  end
  new_hash.each do |team, players|
      players[:players].each do |names|
        if players[:team_name] == "Charlotte Hornets"
          names.each do |this_player, name|
            # binding.pry
            team_two += name[:points].to_i
          end
        end
      end
  end
  if team_one > team_two
    return "Brooklyn Nets"
  else
    return "Charlotte Hornets"
  end
end

def player_with_longest_name
  new_hash = game_hash
  longest_name = ""
  length = 0
  new_hash.each do |team, players|
      players[:players].each do |names|
        names.each do |this_player, name|
          # binding.pry
          if name[:shoe].to_i > big_shoe
            big_shoe = name[:shoe].to_i
          end
        end
        names.each do |this_player, name|
          if name[:shoe].to_i == big_shoe
            return name[:rebounds].to_i
          end
        end
      end
  end
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











