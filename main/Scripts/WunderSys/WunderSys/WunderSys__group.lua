-- initialise wsys namespace
wsys = wsys or {}
wsys.events = wsys.events or {}

if not wsysf then
  -- If needed, download and install WunderSys Foundation, and have it before WunderSys in your Scripts
  -- Download from: https://github.com/tynil/WunderSys
  cecho("\n<red>Warning: Installing WunderSys without/before Foundation")
end

function wsys.debug( str )
  --cecho( str )
end
