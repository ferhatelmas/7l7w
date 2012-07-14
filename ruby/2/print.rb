s = [];
(1..16).each do |x| 
	s.push(x)
	if x%4 == 0 
		puts s.join " " 
		s.clear
	end
end