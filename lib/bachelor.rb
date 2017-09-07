#minor issue with the test suite for 'count_contestants_by_hometown'. the 'it' and 'expect' lines have different numbers.
#it 'returns 2....' and 'expect(...) .to eq(4)' for example. The test passes, just the description didn't get updated.

  require 'pry'
def get_first_name_of_season_winner(data, season)
  # code here
  winner = ""
  data.each {|year, contestant_array|
    if year == season
      contestant_array.each {|block| #only one argument, because array, not hash
        if block["status"] == "Winner"
          winner = block["name"].split(" ")[0]
        end
      }
    end
  }
  winner
end

def get_contestant_name(data, occupation)
  # code here
  output = ""
  data.collect {|year, contestant_array|
    contestant_array.collect {|block|
      if block["occupation"] == occupation
        output = block["name"]
        break
      end
    }
  }
  output
end

def count_contestants_by_hometown(data, hometown)
  # code here
  count = 0
  data.each {|year, contestant_block|
    contestant_block.each {|block|
      if block["hometown"] == hometown
        count += 1
      end
    }
  }
  count
end

def get_occupation(data, hometown)
  # code here
  data.collect {|year, contestant_block|
    contestant_block.collect {|block|
      if block["hometown"] == hometown
        block["occupation"]
      end
    }
  }.flatten.compact[0] #I feel like thi could potentially fail given certain inputs.  Can't explain why/how, it just feels iffy. Is it alright, or is there a better way?
end

def get_average_age_for_season(data, season)
  # code here
  (data.collect {|year, contestant_array|
    if year == season
      contestant_array.collect {|block|
        block["age"].to_i #age shouldnt be a string to begin with, in my opinion, becaue by its nature it changes with time.
      }
    end
  }.flatten.compact.inject {|sum, element| sum + element} /data[season].size.to_f).round #flatten 'de-nests', compact removes nil's from the current nest level, inject is damn sexy
end                                                                                     #and sums up all values in an array, divide by the array length, turn to float, round to nearest integer.
