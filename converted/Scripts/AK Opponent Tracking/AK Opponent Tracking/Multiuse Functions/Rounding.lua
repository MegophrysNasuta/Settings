function roundUp(number, places)
	return math.ceil(number * math.pow(10,places)) / math.pow(10,places)
end

function roundDown(number, places)
	return math.floor(number * math.pow(10,places)) / math.pow(10,places)
end
