#!/usr/bin/ruby

def fibonacci(i)
	if i <= 1
		return i
	else
		return fibonacci(i-1) + fibonacci(i-2)
	end
end

if ARGV.length < 1
	puts "Usage: #{$0} number"
else
	n = ARGV[0].to_i
	puts "F(#{n}) = #{fibonacci(n)}"
end
