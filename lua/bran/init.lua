local _0_0 = nil
do
  local name_0_ = "bran.init"
  local loaded_0_ = package.loaded[name_0_]
  local module_0_ = nil
  if ("table" == type(loaded_0_)) then
    module_0_ = loaded_0_
  else
    module_0_ = {}
  end
  module_0_["aniseed/module"] = name_0_
  module_0_["aniseed/locals"] = (module_0_["aniseed/locals"] or {})
  module_0_["aniseed/local-fns"] = (module_0_["aniseed/local-fns"] or {})
  package.loaded[name_0_] = module_0_
  _0_0 = module_0_
end
local function _2_(...)
  _0_0["aniseed/local-fns"] = {require = {a = "aniseed.string", nvim = "aniseed.nvim"}}
  return {require("aniseed.string"), require("aniseed.nvim")}
end
local _1_ = _2_(...)
local a = _1_[1]
local nvim = _1_[2]
do local _ = ({nil, _0_0, {{}, nil}})[2] end
local function build_list(mystring, range, _3fsep)
  local x = ""
  for i = 1, range do
    x = (x .. a.join({mystring, i, (_3fsep or "\n")}))
  end
  return x
end
print(build_list("user_0", 10, ","))
local function cursor_line_pos()
  local pos = nvim.win_get_cursor(0)
  return pos[1]
end
return cursor_line_pos()