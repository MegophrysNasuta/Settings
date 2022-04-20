function wsys.recklessnesscheck()
  wsys.tb.justreckless = {line, getLineNumber()}
  enableTrigger("Prompt Checks")
end

function wsys.restobreakcheck(l)
  wsys.tb.restorationlist[#wsys.tb.restorationlist+1] = {l, getLineNumber(), line}
  enableTrigger("Prompt Checks")
end
