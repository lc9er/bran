local _0_0 = nil
do
  local name_0_ = "bran.main"
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
  _0_0["aniseed/local-fns"] = {require = {a = "bran.aniseed.string", core = "bran.aniseed.core", nvim = "bran.aniseed.nvim"}}
  return {require("bran.aniseed.string"), require("bran.aniseed.core"), require("bran.aniseed.nvim")}
end
local _1_ = _2_(...)
local a = _1_[1]
local core = _1_[2]
local nvim = _1_[3]
do local _ = ({nil, _0_0, {{}, nil}})[2] end
local build_list = nil
do
  local v_0_ = nil
  do
    local v_0_0 = nil
    local function build_list0(mystring, range, _3fsep)
      local x = {""}
      do
        local opt = (_3fsep or "\n")
        if (opt == "\n") then
          for i = 1, range do
            x[i] = (mystring .. i)
          end
        else
          for i = 1, range do
            x[1] = (x[1] .. mystring .. i .. opt)
          end
        end
      end
      return x
    end
    v_0_0 = build_list0
    _0_0["build-list"] = v_0_0
    v_0_ = v_0_0
  end
  _0_0["aniseed/locals"]["build-list"] = v_0_
  build_list = v_0_
end
local cursor_line_pos = nil
do
  local v_0_ = nil
  do
    local v_0_0 = nil
    local function cursor_line_pos0()
      local pos = nvim.win_get_cursor(0)
      return pos[1]
    end
    v_0_0 = cursor_line_pos0
    _0_0["cursor-line-pos"] = v_0_0
    v_0_ = v_0_0
  end
  _0_0["aniseed/locals"]["cursor-line-pos"] = v_0_
  cursor_line_pos = v_0_
end
local bran_bran = nil
do
  local v_0_ = nil
  do
    local v_0_0 = nil
    local function bran_bran0(mystring, range, _3fsep)
      local lines = build_list(mystring, range, _3fsep)
      local pos = (1 + cursor_line_pos())
      return nvim.buf_set_lines(0, pos, pos, false, lines)
    end
    v_0_0 = bran_bran0
    _0_0["bran-bran"] = v_0_0
    v_0_ = v_0_0
  end
  _0_0["aniseed/locals"]["bran-bran"] = v_0_
  bran_bran = v_0_
end
local echoerr = nil
do
  local v_0_ = nil
  do
    local v_0_0 = nil
    local function echoerr0(...)
      return nvim.err_write((a.join(" ", {"Bran:", ...}) .. "\n"))
    end
    v_0_0 = echoerr0
    _0_0["echoerr"] = v_0_0
    v_0_ = v_0_0
  end
  _0_0["aniseed/locals"]["echoerr"] = v_0_
  echoerr = v_0_
end
local init = nil
do
  local v_0_ = nil
  do
    local v_0_0 = nil
    local function init0()
      return nvim.ex.command_("-nargs=*", "-complete=command", "Bran", "lua", "require('bran.main')['bran-bran'](<f-args>)")
    end
    v_0_0 = init0
    _0_0["init"] = v_0_0
    v_0_ = v_0_0
  end
  _0_0["aniseed/locals"]["init"] = v_0_
  init = v_0_
end
return init("user_0", 10, ":")