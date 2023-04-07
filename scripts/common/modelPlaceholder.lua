--- BasicBuildables: modelPlaceholder.lua
--- @author SirLich

-- Sapiens
local resource = mjrequire "common/resource"
local model = mjrequire "common/model"
local gameObject = mjrequire "common/gameObject"
local typeMaps = mjrequire "common/typeMaps"

local mod = {
    loadOrder = 1,
}

local seatRemaps = {
    bone = "bone_chairSeat"
}

local chairLegRemaps = {
    bone = "bone_chairLeg"
}

local chairBackRemaps = {
    bone = "bone_chairBack"
}

-- Takes in a remap table, and returns the 'placeholderModelIndexForObjectTypeFunction' that can handle this data.
--- @param remaps table string->string mapping
local function createIndexFunction(remaps)
    local function inner(placeholderInfo, objectTypeIndex, placeholderContext)
        local objectKey = typeMaps:indexToKey(objectTypeIndex, gameObject.validTypes)
        local remap = remaps[objectKey]

        -- Return a remap if exists
        if remap ~= nil then
            return model:modelIndexForName(remap)
        end

        -- Else, return the default model associated with this resource
        local defaultModel = gameObject.types[objectKey].modelName


        return model:modelIndexForName(defaultModel)
    end

    return inner
end

function mod:onload(modelPlaceholder)
    local super_initRemaps = modelPlaceholder.initRemaps

    mod.modelPlaceholder = modelPlaceholder
    modelPlaceholder.initRemaps = function()
        super_initRemaps()

        modelPlaceholder:addModel("boneChair", {
            { 
                key = "bone_1",
                resourceTypeIndex = resource.types.bone.index,
                defaultModelName = "bone_chairLeg",
                placeholderModelIndexForObjectTypeFunction = createIndexFunction(chairLegRemaps)
            },
            { 
                key = "bone_2",
                resourceTypeIndex = resource.types.bone.index,
                defaultModelName = "bone_chairLeg",
                placeholderModelIndexForObjectTypeFunction = createIndexFunction(chairLegRemaps)
            },
            { 
                key = "bone_3",
                resourceTypeIndex = resource.types.bone.index,
                defaultModelName = "bone_chairLeg",
                placeholderModelIndexForObjectTypeFunction = createIndexFunction(chairLegRemaps)
            },
            { 
                key = "bone_4",
                resourceTypeIndex = resource.types.bone.index,
                defaultModelName = "bone_chairLeg",
                placeholderModelIndexForObjectTypeFunction = createIndexFunction(chairLegRemaps)
            },
            { 
                key = "bone_5",
                resourceTypeIndex = resource.types.bone.index,
                defaultModelName = "bone_chairSeat",
                placeholderModelIndexForObjectTypeFunction = createIndexFunction(seatRemaps)
            },
            { 
                key = "bone_6",
                resourceTypeIndex = resource.types.bone.index,
                defaultModelName = "bone_chairBack",
                placeholderModelIndexForObjectTypeFunction = createIndexFunction(chairBackRemaps)
            },
            {
                key = "bone_7",
                offsetToStorageBoxWalkableHeight = true,
            },
        })
    end
end

return mod