local _0_0 = nil
do
  local name_0_ = "example.main-test"
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
  local ok_3f_0_, val_0_ = nil, nil
  local function _2_()
    return {}
  end
  ok_3f_0_, val_0_ = pcall(_2_)
  if ok_3f_0_ then
    _0_0["aniseed/local-fns"] = {}
    return val_0_
  else
    return print(val_0_)
  end
end
local _1_ = _2_(...)
local _2amodule_2a = _0_0
local _2amodule_name_2a = "example.main-test"
do local _ = ({nil, _0_0, {{}, nil, nil, nil}})[2] end
local tests_0_ = (_0_0["aniseed/tests"] or {})
local function _3_(t)
  return t["="](1, 1, "1 should equal 1, I hope!")
end
tests_0_["something-simple"] = _3_
_0_0["aniseed/tests"] = tests_0_
return nil