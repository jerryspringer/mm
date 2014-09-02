class Mastermind
	

	def initialize
		@player = Player.new
		@computer = Computer.new
	end
 	
 	def play
			@player.welcome 

		10.times do |i|
			
			puts "This is attempt number #{i + 1} out of 10 you have #{@player.turns - i} chances left to"
			puts "crack the color code"
			current_guess = @player.code_break
			
			if @computer.is_exact?(current_guess)
				puts ""
				puts "You Won!"
					break
			
			elsif @player.turns - i == 0
				
				puts "You were unable to crack the color code."
				puts "You Lost!"
				puts "The code was #{@computer.code_combo}"
					break
			
				else @computer.is_close?(current_guess)
			end
		end
	end
end
 
class Computer
	
	COLORS = ["R", "Y", "W", "O", "B", "P"]
 	attr_reader :code_combo
	
	def initialize
		
		@code_combo = COLORS.sample(4)
	
	end

	def get_matches(guess) 
		
		match = []
		guess.each do |color|
			
			if @code_combo.include?(color)
				match << color 
			end
		end
		
		match
	
	end

	def is_close?(guess) 
		if get_matches(guess) == []
			puts "You have no matches"
		
		else
			puts "You're close! The code contains #{get_matches(guess)}"
		
		end
	end


	def is_exact?(guess)
		
		if guess == @code_combo
			return true
		
		else
			return false
		
		end	
	end
end
 
class Player
	attr_accessor :turns
	def initialize
		@turns = 9
	end
	
	
	def welcome
		
		puts "Welcome to Mastermind"
		puts "The computer is holding a 4 color code you need to break."
		puts "You have 10 attempts to crack the code or you lose!"
		puts "Your choices are R (red), Y (yellow), W (white), O (orange), B (blue),"
		puts "and P (purple)"
		puts "Please seperate each choice with a comma (,)."
		puts "For best results, leave CAPS LOCK on!!!!!!!!!"
		puts "Good luck!"
	end

	def code_break
		second_guess(gets.chomp)
	
	end
 
	def second_guess(guess)

		guess.split(', ')
	
	end
end

 game = Mastermind.new
 game.play 
