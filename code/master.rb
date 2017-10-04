class MasterMind
	attr_accessor :name
	attr_accessor :color
	attr_accessor :code
	attr_reader :colors
	def initialize(name)
		@colors = ["red", "orange", "yellow", 
							"green", "blue", "white"]
		@name = name
		@color = []
		@code = []
	end
	def generateColor
		@code = []
		0.upto(3) do |each|
			@code.push(@colors.sample)
		end
		puts "Code generated is #{@code.to_s}"
	end
	def process2(arr)
		i1 = 0
		position = []
		0.upto(3) do |each|
			if @code[each] == arr[each]
				i1 += 1
				position.push(each)
			end
		end
		# color left
		tempcode = []
		# left color
		leftcolor = []
		@code.each_with_index do |element, index|
			tempcode.push(element) unless position.include? index
		end
		arr.each_with_index do |element, index|
			leftcolor.push(element) unless position.include? index
		end
		puts "color right position #{i1}"
		i3 = 0
		0.upto(leftcolor.length - 1) do |each|
			i3 += 1 unless tempcode.include? leftcolor[each]
		end
		return "+"*i1+"-"*(4 - i1 - i3)
	end
end