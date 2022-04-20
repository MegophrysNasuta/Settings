local function puffCig()
  send('puff cigar')
  local puff_again_in = (math.random() * 35) + 55
  cigarTimer = tempTimer(puff_again_in, puffCig)
end
puffCig()
