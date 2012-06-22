number = rand(1000);
puts('I have chosen a number between 0 and 1000, guess it:');
while number != (guess = gets.to_i)
	if number < guess
		puts('Too high, lower it');
	else
		puts('Too low, higher it');
	end	
end
puts('There it is, you found ' + number.to_s);