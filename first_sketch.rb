require 'ruby-processing'
class FirstSketch < Processing::App

	def setup
		background(255,0,0)
	end

	def draw
		if @i.nil? || @i == 200
	      @i = 1
		else 
			@i = @i+1
		end
		stroke (0, 0, 255)
		fill(0, 255, 0)
		rect(@i, @i, @i, @i)
		stroke (99, 87, 135)
		fill (@i, @i + 33, @i + 255)
		oval(rand(100), rand(100), 50, 50)
	end
end


FirstSketch.new(:width => 400, :height => 400, 
	:title => "FirstSketch", :full_screen => false)