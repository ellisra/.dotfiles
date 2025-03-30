---@class LazySpec
---@field [1] string Plugin name
---@field name? string
---@field version? string
---@field branch? string
---@field commit? string
---@field tag? string
---@field pin? boolean
---@field event? string|string[]
---@field cmd? string|string[]
---@field ft? string|string[]
---@field keys? string|string[]|LazyKeys[]
---@field dependencies? string|string[]|LazySpec[]
---@field init? fun(plugin: LazyPlugin)
---@field opts? table|fun(plugin: LazyPlugin):table|nil
---@field config? fun(plugin: LazyPlugin, opts: table)|boolean
---@field build? string|fun(plugin: LazyPlugin)
---@field enabled? boolean|fun(plugin: LazyPlugin):boolean
---@field cond? boolean|fun(plugin: LazyPlugin):boolean
---@field priority? number
