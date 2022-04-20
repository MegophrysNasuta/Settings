send("light pipes")
wsys.dheal()
wsys.tree()
if wsys.isFitnessClass() then wsys.fitness() end
if wsys.isClass("occultist") or wsys.isClass("jester") then wsys.fool() end
send("curing queue remove valerian")
send("curing queue add valerian")
send("curing queue remove epidermal to body")
send("curing queue add epidermal to body")
send("curing queue remove goldenseal")
send("curing queue add goldenseal")
wsys.focus()

