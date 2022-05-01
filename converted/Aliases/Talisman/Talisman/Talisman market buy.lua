local source = matches[4] or "P"
if source == "P" then
  source = "promo"
else
  source = "refine"
end
queue.inject(string.format("open pack265875|get %s coins from pack265875|Talisman market buy 1 %s level 1 %s %s|agree|put coins in pack265875|close pack265875", matches[3], matches[2], source, matches[3]))
