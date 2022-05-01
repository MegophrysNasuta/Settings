function ak.queuereset()
	if wsys then
		if wsys.bals.b and wsys.bals.e then
			ak.queue.eqbal = {}
			ak.queue.sent = {}
		end
	end
end


registerAnonymousEventHandler("got balance", "ak.queuereset")
registerAnonymousEventHandler("got equilibrium", "ak.queuereset")
