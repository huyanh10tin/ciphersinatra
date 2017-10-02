class Cipher
	attr_reader :alpha
	attr_accessor :text, :shiftnumber
	def initialize(text, shiftnumber)
		@alpha = ("a".."z").to_a
		@text = text
		@shiftnumber = shiftnumber
	end
	def process
		@text.each_char.with_index do |char, index|
			@text[index] = shift(char)
		end
	end
	def shift(x)
		# this function will return shift char in alpha b
		return x unless @alpha.include? x.downcase
		indexof = @alpha.index(x.downcase)
		# puts "index of #{x} is #{indexof}"
		return (x == x.upcase) ? @alpha[(indexof + @shiftnumber)%26].upcase : @alpha[(indexof + @shiftnumber)%26]
	end
	def show
		self.process
		@text
	end
end
