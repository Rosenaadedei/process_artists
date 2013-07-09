require 'ruby-processing'
class ProcessArtist < Processing::App

  def setup
   background(255,255,255)
   @size = 10
   @queue = ""
  end

  def draw
    
  end

  def key_pressed
  warn "A key was pressed! #{key.inspect}"
      if @queue.nil?
         @queue = ""
      end
      if key == "+"
        @size += 10
      elsif key == "-"
         @size -= 10
      end
         @size-= 10
      if key != "\n"
         @queue = @queue + key
      else
         warn "Time to run the command: #{@queue}"
         run_command(@queue)
         @shape = @queue.chomp
         @queue = ""
      end
  end

  def run_command(command)
  puts "Running Command #{command}"
  	if command.start_with?("b")
      color = command[1..-1]
  		colors = color.split(",")
  		@current_background = background(colors[0].to_i,colors[1].to_i,colors[2].to_i) 
  	elsif command.start_with?("f")
      color = command[1..-1]
      colors = color.split(",")
      fill(colors[0].to_i,colors[1].to_i,colors[2].to_i)
    elsif command.start_with?("c")
      color = command[1..-1]
      colors = color.split(",")
      @current_background
    elsif command.start_with?("e")
       rect(mouse_x, mouse_y, 20, 20)
    elsif command.start_with?("a")
      color = command[1..-1]
      colors = color.split(",")
      background(colors[0].to_i,colors[1].to_i,colors[2].to_i)
    end
  end

  def mouse_dragged
    fill(0, 0, 255)
    stroke(55,0, 193)

    case @shape

    # cirle
    when "s1" then oval(mouse_x, mouse_y, 50, 50)
    
    # An oval which is twice as wide as it is tall
    when "s2" then oval(mouse_x, mouse_y, 2 * 25, 25)
    
    # An oval which is twice as tall as it is wide
    when "s3" then oval(mouse_x, mouse_y, 25, 2 * 25)
    
    # A square
    when "s4" then rect(mouse_x, mouse_y, 25, 25)
    
    # rectangle which is four times as wide as it is tall
    when "s5" then rect(mouse_x, mouse_y, 4 * 25, 25)
    
    # rectangle which is four times as tall as it is wide
    when "s6" then rect(mouse_x, mouse_y, 25, 4 * 25)
    
    #A plus sign
    when "s7" then 
        rect(mouse_x, mouse_y + 30, 80, 20)
        rect(mouse_x + 30, mouse_y, 20, 80)

    #A clover shape (four partially overlapping circles)
    when "s8" then
      
        oval(mouse_x, mouse_y, 50, 50)
        oval(mouse_x + 35, mouse_y, 50, 50)
        oval(mouse_x, mouse_y + 35, 50, 50)
        oval(mouse_x + 35, mouse_y + 35, 50, 50)
        rect(mouse_x, mouse_y + 35, 25, 2 * 25)
    #A shape you imagine yourself 
    when "s9" then oval(mouse_x, mouse_y, @size, @size)
        oval(mouse_x, mouse_y, 50, 50)
        oval(mouse_x, mouse_y, 50, 50)
        oval(mouse_x, mouse_y, 50, 50)
        oval(mouse_x, mouse_y, 50, 50)
    else warn "I don't know that command"
    end
  end
end

ProcessArtist.new(:width => 400, :height => 400,
  :title => "ProcessArtist", :full_screen => false)