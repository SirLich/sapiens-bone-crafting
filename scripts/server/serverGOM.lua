--- @author SirLich

local shadow = mjrequire "hammerstone/utils/shadow"
local boneMaskServer = mjrequire "server/boneMaskServer"

local serverGOM = {}

--- @shadow
function serverGOM:init(super)
	super()

	boneMaskServer:init(self) -- 'ServerGOM' here refers to the *unshadowed version*.
end

return shadow:shadow(serverGOM)