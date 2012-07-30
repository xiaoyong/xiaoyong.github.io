#!/usr/bin/ruby
require 'rubygems'
require 'gruff'

withBash = false # Flag to turn Bash on or off
if withBash
	$max = 20 # Maximum of n
else
	$max = 32
end
$timeOf = {}

# Method to profile time consuming
def profile desciption, &block
	time = []
	(2..$max).each do |n|
		next if (n % 2) != 0
		startTime = Time.now
		block.call(n)
		duration = Time.now - startTime
#		puts desciption + ": " + duration.to_s + " seconds"
		time.push(duration)
	end
	time
end

# Method to plot graph with Gruff
def gruffPlot(num, withBash)
	targets = ["C++", "Perl", "Ruby-1.8.7", "Ruby-1.9.2", "Python"]
	if withBash
		targets.push("Bash")
	end

	g = Gruff::Line.new
	g.title = "Time Consuming of Fibonacci Number in Several Programming Languages"
	g.title_font_size = 18

	targets.each do |language|
		g.data(language, $timeOf[language][0..(num/2-1)])
	end

	# Set labels of x-axis
	g.labels = {}
	(2..num).each do |i|
		if (i % 2) == 0 # Even number
			g.labels[i/2-1] = i.to_s
		end
	end

	g.x_axis_label = "n"
	g.y_axis_label = "Time (seconds)"

	if withBash
		filename = "graphWithBash_" + num.to_s + ".png"
	else
		filename = "graphNoBash_" + num.to_s + ".png" end

	g.write(filename)
end

$timeOf["C++"] = profile "C++ version" do |n|
	`./fibonacci_cpp #{n}`
end
$timeOf["Perl"] = profile "Perl version" do |n|
	`./fibonacci.pl #{n}`
end
$timeOf["Ruby-1.8.7"] = profile "Ruby-1.8.7 version" do |n|
	`./fibonacci.rb #{n}`
end
$timeOf["Ruby-1.9.2"] = profile "Ruby-1.9.2 version" do |n|
	`~/.rvm/rubies/ruby-1.9.2-head/bin/ruby ./fibonacci.rb #{n}`
end
$timeOf["Python"] = profile "Python version" do |n|
	`./fibonacci.py #{n}`
end

if withBash
	$timeOf["Bash"] = profile "Bash version" do |n|
		`./fibonacci.sh #{n}`
	end
	[12, 16, $max].each do |num|
		gruffPlot(num, true)
	end
else # No Bash
	[16, 24, $max].each do |num|
		gruffPlot(num, false)
	end
end

$timeOf.each do |key, val|
	puts key + ": " + val.join(" ")
end
