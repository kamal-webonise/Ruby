require 'date'

class Airport
  @@no_of_flights = 0
  @@time_slot = Array.new(14400)

  def initialize(ar)
    @arr = ar
    @@no_of_flights = 0 
    @@time_slot.collect! do |i|
      i = 0
    end 
  end

  def display_details()
    for i in 0...@arr.length
      if (i % 2 == 0) 
        if dt = DateTime.parse(@arr[i])
          arrivalInSeconds = dt.hour * 60 + dt.min
        end
        i+=1
        if dt = DateTime.parse(@arr[i])
          departureInSeconds = dt.hour * 60 + dt.min
        end
        for k in arrivalInSeconds..departureInSeconds
          @@time_slot[k] += 1
        end    
      end  
    end  
    @@no_of_flights = @@time_slot.max 
  end

  def total_no_of_flights()
    puts "Total number of runway: #@@no_of_flights"
  end
end


def findRunWay
  arr = ['9:00','9:10','9:40','12:00','9:50','11:20','11:00','11:30','15:00','19:00','18:00','20:00']
	cust2 = Airport.new(arr)
  cust2.display_details
  cust2.total_no_of_flights
end

findRunWay