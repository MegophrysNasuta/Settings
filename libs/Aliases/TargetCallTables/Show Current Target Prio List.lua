cecho('\n<'.. TargetCallTables.Config.EchoColor ..'>Current target prios:\n')
for prio, tgt in pairs(TargetCallTables.targetPrios) do
  cecho(('<'.. TargetCallTables.Config.EchoColor ..'>'.. tostring(prio) ..': '
         .. tgt ..'\n'))
end
