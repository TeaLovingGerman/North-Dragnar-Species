--By silversokolova on Discord. If only there was some unique part of Discord tags, some kind of '#3576'-looking thing, that was unique and thus negated the need to say 'on Discord'
local ini = init or function() end

function init()
  ini()
  if oldNpcSay then return end
  local oldNpcSay = npc.say
  npc.say = function(line, tags, con)
    if type(line) ~= "string" then
      if status.statusProperty("saidLine") then
        line = line[2]
      else
        status.setStatusProperty("saidLine", 1)
        world.spawnItem(line[3], mcontroller.position()) --maybe we should add a velocity
        line = line[1]
      end
    end
  return oldNpcSay(line, tags, con)
  end
end