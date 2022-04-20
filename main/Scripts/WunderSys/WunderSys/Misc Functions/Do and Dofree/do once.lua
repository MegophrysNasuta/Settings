
-- Table of label -> function pairs for do commands that should only
-- be entered into the queue once
wsys.doOnce_list = wsys.doOnce_list or {}

wsys.doOnce_list.fitness = function()
	return "fitness on"
end

wsys.doOnce_list.manualcure = function()
	return "fitness on"
end

wsys.doOnce_list.stand = function()
	return "stand"
end

wsys.doOnce_list.restore = function()
	return "restore"
end

wsys.doOnce_list.dragonheal = function()
	return "dragonheal"
end
