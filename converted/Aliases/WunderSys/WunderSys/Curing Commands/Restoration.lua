local limbsa = {
 a = "arms",
 l = "legs",
 h = "head",
 t = "torso",
}
send("curing queue remove restoration to " .. limbsa[matches[2]])
send("curing queue add restoration to " .. limbsa[matches[2]])
