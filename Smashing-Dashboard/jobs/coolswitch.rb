require 'net/http'

# :first_in sets how long it takes before the job is first run. In this case, it is run immediately
SCHEDULER.every '5s', :first_in => 0 do |job|
  deviceID = "CoolSWITCH-4548297"
  stateVal = Net::HTTP.get(deviceID + '.local', '/state')  
  stateValText = stateVal
  if stateVal == "0"
    stateValText = 'OFF'
  end
  if stateVal == "1"
    # TODO: speed
    stateValText = 'ON (100%)'    
  end
  if stateVal == "2"
    # TODO: speed
    stateValText = 'Over Current'    
  end
  currentVal = Net::HTTP.get(deviceID + '.local', '/current')
  send_event(deviceID, { state: stateValText, current: currentVal + " A"})
end
