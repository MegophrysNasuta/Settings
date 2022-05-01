if talisman.more==1 then
	send("more")
	talisman.more = 2
elseif talisman.more==0 then
	setTriggerStayOpen("Talisman List", 0)
end
