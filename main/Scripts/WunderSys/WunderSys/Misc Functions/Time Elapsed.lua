--check time difference between input and now in milliseconds
--input string format is "hr:min:sec:millisec" with or without preceding zeros
--getTime(true, "HH:mm:ss:zzz" ) is how you get a valid input string
function wsys.timeElapsed(time)
  --change time string into time values
  local timetable = string.split(time, ":")
  local hr = tonumber(timetable[1])
  local min = tonumber(timetable[2])
  local sec = tonumber(timetable[3])
  local msec = tonumber(timetable[4])
  --get current time values
  local hrnow   = tonumber(getTime(true, "H"))
  local minnow  = tonumber(getTime(true, "m"))
  local secnow  = tonumber(getTime(true, "s"))
  local msecnow = tonumber(getTime(true, "z"))
  --calculate time elapsed
  local totalmsec = ((hrnow - hr) % 24) * 60 * 60 * 1000 +
                    ((minnow - min)) * 60 * 1000 +
                    ((secnow - sec)) * 1000 +
                    (msecnow - msec)

  return totalmsec
end

--check time difference between two times in milliseconds
--input string format for the times is "hr:min:sec:millisec" with or without preceding zeros
--t1 is the newer time, t2 is the older one
function wsys.timeDifference(t1, t2)
  --change t1 string into time values
  local timetable1 = string.split(t1, ":")
  local hr1 = tonumber(timetable1[1])
  local min1 = tonumber(timetable1[2])
  local sec1 = tonumber(timetable1[3])
  local msec1 = tonumber(timetable1[4])
  --change t2 string into time values
  local timetable2 = string.split(t2, ":")
  local hr2   = tonumber(timetable2[1])
  local min2  = tonumber(timetable2[2])
  local sec2  = tonumber(timetable2[3])
  local msec2 = tonumber(timetable2[4])
  --calculate time difference
  local totalmsec = ((hr1 - hr2) % 24) * 60 * 60 * 1000 +
                    ((min1 - min2)) * 60 * 1000 +
                    ((sec1 - sec2)) * 1000 +
                    (msec1 - msec2)

  return totalmsec
end
