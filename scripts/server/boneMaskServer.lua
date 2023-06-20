--- @author SirLich

-- Sapiens
local gameObject = mjrequire "common/gameObject"
local serverGOM = nil

local boneMaskServer = {}

local function update(objectID, dt, speedMultiplier)
	mj:log("BoneMaskServer: update called.")

	local object = serverGOM:getObjectWithID(objectID)
	if object then
		local allCloseObjects = serverGOM:getAllGameObjectsWithinRadiusOfPos(object.pos, 20)

		for i, closeObjectData in ipairs(allCloseObjects) do
			local closeObject = serverGOM:getObjectWithID(closeObjectData.objectID)
			mj:log(closeObject)
		end
	end

end


function boneMaskServer:init(serverGOM_)
	mj:log("BoneMaskServer: init called.")
	mj:log(serverGOM_)
	serverGOM = serverGOM_

	local boneMaskSet = serverGOM:createObjectSet("boneMasks")

	local index = gameObject.types.bone_mask.index
	mj:log(index)
	serverGOM:addObjectLoadedFunctionForType(index, function(object)
		mj:log("BoneMaskServer: addObjectLoadedFunctionForTypes called.")
		serverGOM:addObjectToSet(object, boneMaskSet)
	end)

	serverGOM:setInfrequentCallbackForGameObjectsInSet(boneMaskSet, "update", 20.0, update)
end


return boneMaskServer