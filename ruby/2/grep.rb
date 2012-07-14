if ARGV.length < 2
	puts "Usage: ruby grep.rb <filename> <regex>"
else 
	file = File.open ARGV[0]
	pattern = Regexp.new ARGV[1]

	lc = 1
	file.each do |line|
		puts "#{lc}: #{line}" if pattern.match line
		lc = lc + 1
	end
end
