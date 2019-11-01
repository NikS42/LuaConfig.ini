LIP = require "LIP"
local default_path = "./default.ini"
local config_path = "./config.ini"
local default = LIP.load(default_path)
local config = LIP.load(config_path)
return setmetatable({},{
	__index = function(self, group)
		local conf = config[group] or {}
		local def = default[group] or {}
		return setmetatable({}, {
			__newindex = function(self, key, value)
				if not config[group] then config[group] = {} end
				config[group][key] = (default[group] and default[group][key] == value) and nil or value
				LIP.save(config_path, config)
			end,
			__index = function(self, key) return conf[key] or def[key] end 
		})
	end
})
