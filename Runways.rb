require 'date'

class Runways
  @@no_of_flights = 0

  def initialize(ar)
    @arr = ar
    @@no_of_flights = 0 
  end

  def total_no_of_flights()
    
    time_slot = @arr.collect do |i|
      if dt = DateTime.parse(i)
        dt.hour * 60 + dt.min
      end
    end
    
    no_of_runways = Array.new()
    no_of_runways[0] = time_slot[1] 

    for i in 2...time_slot.length
      
      if (i % 2 != 0)
        temp = 0
      
        for k in 0...no_of_runways.length
         
          if(time_slot[i] > no_of_runways[k] && time_slot[i-1] > no_of_runways[k]) 
            no_of_runways[k] = time_slot[i]
            temp = 1
            break 
          end    
        end

        if( temp == 0 )
          no_of_runways.push time_slot[i]
        end  
      end        
    end 

    @@no_of_flights = no_of_runways.length 
  end

  def display_details()
    puts "Total number of runway: #@@no_of_flights"
  end
end


def findRunWay
  arr = ['9:00','9:10','9:40','12:00','9:50','11:20','11:00','11:30','15:00','19:00','18:00','20:00']
  run = Runways.new(arr)
  run.total_no_of_flights
  run.display_details
end

findRunWay