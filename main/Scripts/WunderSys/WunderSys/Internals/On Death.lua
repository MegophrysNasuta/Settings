function wsys.resetOnDeath()
  wsys.normalsipping()
	wsys.resetAffPrios()
  wsys.lostallchannels()
end

registerAnonymousEventHandler("You Died", "wsys.resetOnDeath")
