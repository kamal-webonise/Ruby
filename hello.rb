def check(next_x, next_y, sol)	 
	sol.each do |i|
	end	
	if( next_x >= 0 && next_x < 5 && next_y >= 0 && next_y < 5 && sol[next_x][next_y] == -1)
		return true
	else
		return nil
	end		
end	

def display(solArr)
	solArr.each do |i|
		puts "#{i}"
	end	
end	

def possibleMove(x,y,totalMove,solArr,xMove,yMove)

	tableLen = solArr.length
	
	if (totalMove == tableLen * tableLen + 1)
		display(solArr)
		return true
	end
	len = xMove.length
	for k in 0...len
		next_x = x + xMove[k]
		next_y = y + yMove[k]
		if( check(next_x, next_y, solArr) )
			solArr[next_x][next_y] = totalMove
			if ( possibleMove(next_x,next_y,totalMove + 1,solArr,xMove,yMove) )
				return true
			else
				solArr[next_x][next_y] = -1;
			end		
		end 
	end	
	return false
end

def enter_value
	solArr = Array.new(5) { Array.new(5)}

	for i in 0...5
		for j in 0...5
			solArr[i][j] = -1
		end
	end

	xMove = Array.new(8)
	yMove = Array.new(8)

	xMove= [2 ,2 ,1 ,1 ,-2,-2,-1,-1]
	yMove= [1 ,-1,2 ,-2,1 ,-1,2 ,-2]
	solArr[2][2]= 1
	
	if (possibleMove(2 ,2 ,2 ,solArr ,xMove ,yMove) == false)
		puts("Solution doesn't Exist")
		return false
	end
end

enter_value
