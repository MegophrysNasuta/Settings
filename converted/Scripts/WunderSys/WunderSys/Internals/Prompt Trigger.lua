local promptTrigTable = promptTrigTable or {}

function wsys.doPromptTrigTable()
  if next(promptTrigTable) then
    --cecho("<orange>item in")
    for k,func in pairs(promptTrigTable) do
       --cecho("<red>"..k)
       func()
       --cecho("<green>fired func")
		promptTrigTable[k] = nil
    end -- for
    promptTrigTable = {}
  end --if
end -- function

function wsys.promptTrigger(name, fn)
  promptTrigTable[name] = fn
end -- function

function wsys.clearPromptTrigTable()
  promptTrigTable = {}
end
