if curedGuilt then
  Tragedy.curedaff("guilt")
else
  Tragedy.Cure(herbConversion["lobelia seed"])
end

setTriggerStayOpen("lobelia", 0)
