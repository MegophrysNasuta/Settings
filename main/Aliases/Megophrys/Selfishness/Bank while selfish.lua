local amt = matches[2]
local org = matches[3]
local reason = matches[4]

if reason then
  sendAll('get '.. amt .. ' sovereigns from pack',
          'deposit '.. amt ..' gold '.. org ..' '.. reason)
elseif org then
  sendAll('get '.. amt .. ' sovereigns from pack',
          'deposit '.. amt ..' gold '.. org)
else
  sendAll('get '.. amt .. ' sovereigns from pack',
          'deposit '.. amt ..' gold')
end
