return {
	description = {
		identifier = "bone_meal"
	},
	components = {
		hs_object = {
			model = "boneMeal"
		},
		hs_resource = {
			storage_identifier = "manure", -- Existing base game storage
			resource_groups = {
				"fertilizer" -- Inject into existing resource group
			}
		},
		hs_craftable = {
			skill = "boneCarving",
			tool = "carving",
			action_sequence = "scrapeWood",
			hs_output = {
				simple_output = {"bone_meal"}
			},
			resources = {
				{
					resource = "bone",
					count = 3,
					action = {
						action_type = "knap",
						duration = 0.5,
						duration_without_skill = 15
					}
				}
			}
		}
	}
}
