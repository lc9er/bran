local _2afile_2a = "fnl/bran/main.fnl"
local _1_
do
  local name_4_auto = "bran.main"
  local module_5_auto
  do
    local x_6_auto = _G.package.loaded[name_4_auto]
    if ("table" == type(x_6_auto)) then
      module_5_auto = x_6_auto
    else
      module_5_auto = {}
    end
  end
  module_5_auto["aniseed/module"] = name_4_auto
  module_5_auto["aniseed/locals"] = ((module_5_auto)["aniseed/locals"] or {})
  do end (module_5_auto)["aniseed/local-fns"] = ((module_5_auto)["aniseed/local-fns"] or {})
  do end (_G.package.loaded)[name_4_auto] = module_5_auto
  _1_ = module_5_auto
end
local autoload
local function _3_(...)
  return (require("bran.aniseed.autoload")).autoload(...)
end
autoload = _3_
local function _6_(...)
  local ok_3f_21_auto, val_22_auto = nil, nil
  local function _5_()
    return {require("bran.aniseed.string"), require("bran.aniseed.core"), require("bran.aniseed.nvim")}
  end
  ok_3f_21_auto, val_22_auto = pcall(_5_)
  if ok_3f_21_auto then
    _1_["aniseed/local-fns"] = {require = {a = "bran.aniseed.string", core = "bran.aniseed.core", nvim = "bran.aniseed.nvim"}}
    return val_22_auto
  else
    return print(val_22_auto)
  end
end
local _local_4_ = _6_(...)
local a = _local_4_[1]
local core = _local_4_[2]
local nvim = _local_4_[3]
local _2amodule_2a = _1_
local _2amodule_name_2a = "bran.main"
do local _ = ({nil, _1_, nil, {{}, nil, nil, nil}})[2] end
local this
do
  local v_23_auto
  do
    local v_25_auto = "bran.main"
    _1_["this"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["this"] = v_23_auto
  this = v_23_auto
end
local build_list
do
  local v_23_auto
  do
    local v_25_auto
    local function build_list0(mystring, range, _3fpad, _3fsep)
      local x = {""}
      local opt = (_3fsep or "\n")
      local p = (_3fpad or "%00d")
      for i = 1, range do
        local _8_ = opt
        if (_8_ == "\n") then
          x[i] = (mystring .. string.format(p, i))
        else
          local _ = _8_
          x[1] = (x[1] .. mystring .. string.format(p, i) .. opt)
        end
      end
      return x
    end
    v_25_auto = build_list0
    _1_["build-list"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["build-list"] = v_23_auto
  build_list = v_23_auto
end
local cursor_line_pos
do
  local v_23_auto
  do
    local v_25_auto
    local function cursor_line_pos0()
      local pos = nvim.win_get_cursor(0)
      return pos[1]
    end
    v_25_auto = cursor_line_pos0
    _1_["cursor-line-pos"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["cursor-line-pos"] = v_23_auto
  cursor_line_pos = v_23_auto
end
local bran_bran
do
  local v_23_auto
  do
    local v_25_auto
    local function bran_bran0(mystring, range, _3fpad, _3fsep)
      local lines = build_list(mystring, range, _3fpad, _3fsep)
      local pos = (cursor_line_pos() - 1)
      return nvim.buf_set_lines(0, pos, pos, false, lines)
    end
    v_25_auto = bran_bran0
    _1_["bran-bran"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["bran-bran"] = v_23_auto
  bran_bran = v_23_auto
end
local echoerr
do
  local v_23_auto
  do
    local v_25_auto
    local function echoerr0(...)
      return nvim.err_write((a.join(" ", {"Bran:", ...}) .. "\n"))
    end
    v_25_auto = echoerr0
    _1_["echoerr"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["echoerr"] = v_23_auto
  echoerr = v_23_auto
end
local init
do
  local v_23_auto
  do
    local v_25_auto
    local function init0()
      return nvim.ex.command_("-nargs=*", "-complete=command", "Bran", "lua", "require('bran.main')['bran-bran'](<f-args>)")
    end
    v_25_auto = init0
    _1_["init"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["init"] = v_23_auto
  init = v_23_auto
end
return init({})