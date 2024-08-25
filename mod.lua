function data()
return {
	info = {
		minorVersion = 1,
		severityAdd = "NONE",
		severityRemove = "WARNING",
		name = _("mod_name"),
		description = _("mod_desc"),
		authors = {
		    {
		        name = "ModWerkstatt",
		        role = "CREATOR",
		    },
		},
		tags = { "europe", "waggon", "kokswgen", "deutschland", "germany", "UIC", "gueterwagen", "db" },
		tfnetId = { },
		minGameVersion = 0,
		dependencies = { },
		url = { "" },
	  
		params = {
			{
				key = "koksfake",
				name = _("Fake_kokswagen"),
				values = { "No", "Yes", },
				tooltip = _("option_fake_kokswagen_desc"),
				defaultIndex = 0,
			},	
        },
	},
	options = {
	},
	
	runFn = function (settings, modParams)
	local params = modParams[getCurrentModId()]

        local hidden = {
			["szz131_fake.mdl"] = true,
			["zz132_DBAG_fake.mdl"] = true,
			["zz132_fake.mdl"] = true,
			["m58_fake.mdl"] = true,
        }

		local modelFilter = function(fileName, data)
			local modelName = fileName:match('/Fb([^/]*.mdl)')
							or fileName:match('/Okm([^/]*.mdl)')
			return (modelName==nil or hidden[modelName]~=true)
		end

        if modParams[getCurrentModId()] ~= nil then
			local params = modParams[getCurrentModId()]
			if params["koksfake"] == 0 then
				addFileFilter("model/vehicle", modelFilter)
			end
		else
			addFileFilter("model/vehicle", modelFilter)
		end
		

		addModifier( "loadModel", metadataHandler )
	end
	}
end
