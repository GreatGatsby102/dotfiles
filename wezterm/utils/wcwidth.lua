--
-- wcwidth.lua
-- modified by: Simone Fidanza
--
-- original source: <https://github.com/aperezdc/lua-wcwidth>

-- see: <http://lua-users.org/lists/lua-l/2016-05/msg00297.html>
-- luacheck: push ignore 314
-- stylua: ignore
local fn = function() return function() end end
local t =
  { nil, [false] = "Lua 5.1", [true] = "Lua 5.2", [1 / "-0"] = "Lua 5.3", [1] = "LuaJIT" }
local version = t[1] or t[1 / 0] or t[fn() == fn()]
-- luacheck: pop

-- local variables are faster
local bit = rawget(_G, "bit") or rawget(_G, "bit32")
local rshift, bor = function() end, function() end
if bit then
  rshift, bor = bit.rshift, bit.bor
end
local floor = math.floor
local mod = math.mod or function(x, d)
  return x - d * floor(x / d)
end

---Returns the nearest odd integer divided by 2
---@param x number
---@return integer
local halfodd = function(x)
  if version == "Lua 5.3" then
    return (x >> 1) | 1
  end

  if bit then
    return bor(rshift(x, 1), 1)
  end

  local r = floor(x * 0.5)
  local m = version == "Lua 5.1" and (r % 2) or (mod(r, 2))
  return m == 0 and r + 1 or r
end

local function _lookup(rune, table)
  local l, r = 1, #table
  while l <= r do
    local m = halfodd(l + r)
    local m_val, m_next = table[m], table[m + 1]

    if rune < m_val then
      r = m - 1
    elseif rune > m_next then
      l = m + 2
    else
      return 1
    end
  end
  return 0
end

-- {{{1 lookup tables

-- Autogenerated from EastAsianWidth.txt {{{2
local _tab_wide = {
  0x00001100,
  0x0000115F,
  0x0000231A,
  0x0000231B,
  0x00002329,
  0x00002329,
  0x0000232A,
  0x0000232A,
  0x000023E9,
  0x000023EC,
  0x000023F0,
  0x000023F0,
  0x000023F3,
  0x000023F3,
  0x000025FD,
  0x000025FE,
  0x00002614,
  0x00002615,
  0x00002648,
  0x00002653,
  0x0000267F,
  0x0000267F,
  0x00002693,
  0x00002693,
  0x000026A1,
  0x000026A1,
  0x000026AA,
  0x000026AB,
  0x000026BD,
  0x000026BE,
  0x000026C4,
  0x000026C5,
  0x000026CE,
  0x000026CE,
  0x000026D4,
  0x000026D4,
  0x000026EA,
  0x000026EA,
  0x000026F2,
  0x000026F3,
  0x000026F5,
  0x000026F5,
  0x000026FA,
  0x000026FA,
  0x000026FD,
  0x000026FD,
  0x00002705,
  0x00002705,
  0x0000270A,
  0x0000270B,
  0x00002728,
  0x00002728,
  0x0000274C,
  0x0000274C,
  0x0000274E,
  0x0000274E,
  0x00002753,
  0x00002755,
  0x00002757,
  0x00002757,
  0x00002795,
  0x00002797,
  0x000027B0,
  0x000027B0,
  0x000027BF,
  0x000027BF,
  0x00002B1B,
  0x00002B1C,
  0x00002B50,
  0x00002B50,
  0x00002B55,
  0x00002B55,
  0x00002E80,
  0x00002E99,
  0x00002E9B,
  0x00002EF3,
  0x00002F00,
  0x00002FD5,
  0x00002FF0,
  0x00002FFB,
  0x00003000,
  0x00003000,
  0x00003001,
  0x00003003,
  0x00003004,
  0x00003004,
  0x00003005,
  0x00003005,
  0x00003006,
  0x00003006,
  0x00003007,
  0x00003007,
  0x00003008,
  0x00003008,
  0x00003009,
  0x00003009,
  0x0000300A,
  0x0000300A,
  0x0000300B,
  0x0000300B,
  0x0000300C,
  0x0000300C,
  0x0000300D,
  0x0000300D,
  0x0000300E,
  0x0000300E,
  0x0000300F,
  0x0000300F,
  0x00003010,
  0x00003010,
  0x00003011,
  0x00003011,
  0x00003012,
  0x00003013,
  0x00003014,
  0x00003014,
  0x00003015,
  0x00003015,
  0x00003016,
  0x00003016,
  0x00003017,
  0x00003017,
  0x00003018,
  0x00003018,
  0x00003019,
  0x00003019,
  0x0000301A,
  0x0000301A,
  0x0000301B,
  0x0000301B,
  0x0000301C,
  0x0000301C,
  0x0000301D,
  0x0000301D,
  0x0000301E,
  0x0000301F,
  0x00003020,
  0x00003020,
  0x00003021,
  0x00003029,
  0x0000302A,
  0x0000302D,
  0x0000302E,
  0x0000302F,
  0x00003030,
  0x00003030,
  0x00003031,
  0x00003035,
  0x00003036,
  0x00003037,
  0x00003038,
  0x0000303A,
  0x0000303B,
  0x0000303B,
  0x0000303C,
  0x0000303C,
  0x0000303D,
  0x0000303D,
  0x0000303E,
  0x0000303E,
  0x00003041,
  0x00003096,
  0x00003099,
  0x0000309A,
  0x0000309B,
  0x0000309C,
  0x0000309D,
  0x0000309E,
  0x0000309F,
  0x0000309F,
  0x000030A0,
  0x000030A0,
  0x000030A1,
  0x000030FA,
  0x000030FB,
  0x000030FB,
  0x000030FC,
  0x000030FE,
  0x000030FF,
  0x000030FF,
  0x00003105,
  0x0000312F,
  0x00003131,
  0x0000318E,
  0x00003190,
  0x00003191,
  0x00003192,
  0x00003195,
  0x00003196,
  0x0000319F,
  0x000031A0,
  0x000031BF,
  0x000031C0,
  0x000031E3,
  0x000031F0,
  0x000031FF,
  0x00003200,
  0x0000321E,
  0x00003220,
  0x00003229,
  0x0000322A,
  0x00003247,
  0x00003250,
  0x00003250,
  0x00003251,
  0x0000325F,
  0x00003260,
  0x0000327F,
  0x00003280,
  0x00003289,
  0x0000328A,
  0x000032B0,
  0x000032B1,
  0x000032BF,
  0x000032C0,
  0x000032FF,
  0x00003300,
  0x000033FF,
  0x00003400,
  0x00004DBF,
  0x00004E00,
  0x00009FFC,
  0x00009FFD,
  0x00009FFF,
  0x0000A000,
  0x0000A014,
  0x0000A015,
  0x0000A015,
  0x0000A016,
  0x0000A48C,
  0x0000A490,
  0x0000A4C6,
  0x0000A960,
  0x0000A97C,
  0x0000AC00,
  0x0000D7A3,
  0x0000F900,
  0x0000FA6D,
  0x0000FA6E,
  0x0000FA6F,
  0x0000FA70,
  0x0000FAD9,
  0x0000FADA,
  0x0000FAFF,
  0x0000FE10,
  0x0000FE16,
  0x0000FE17,
  0x0000FE17,
  0x0000FE18,
  0x0000FE18,
  0x0000FE19,
  0x0000FE19,
  0x0000FE30,
  0x0000FE30,
  0x0000FE31,
  0x0000FE32,
  0x0000FE33,
  0x0000FE34,
  0x0000FE35,
  0x0000FE35,
  0x0000FE36,
  0x0000FE36,
  0x0000FE37,
  0x0000FE37,
  0x0000FE38,
  0x0000FE38,
  0x0000FE39,
  0x0000FE39,
  0x0000FE3A,
  0x0000FE3A,
  0x0000FE3B,
  0x0000FE3B,
  0x0000FE3C,
  0x0000FE3C,
  0x0000FE3D,
  0x0000FE3D,
  0x0000FE3E,
  0x0000FE3E,
  0x0000FE3F,
  0x0000FE3F,
  0x0000FE40,
  0x0000FE40,
  0x0000FE41,
  0x0000FE41,
  0x0000FE42,
  0x0000FE42,
  0x0000FE43,
  0x0000FE43,
  0x0000FE44,
  0x0000FE44,
  0x0000FE45,
  0x0000FE46,
  0x0000FE47,
  0x0000FE47,
  0x0000FE48,
  0x0000FE48,
  0x0000FE49,
  0x0000FE4C,
  0x0000FE4D,
  0x0000FE4F,
  0x0000FE50,
  0x0000FE52,
  0x0000FE54,
  0x0000FE57,
  0x0000FE58,
  0x0000FE58,
  0x0000FE59,
  0x0000FE59,
  0x0000FE5A,
  0x0000FE5A,
  0x0000FE5B,
  0x0000FE5B,
  0x0000FE5C,
  0x0000FE5C,
  0x0000FE5D,
  0x0000FE5D,
  0x0000FE5E,
  0x0000FE5E,
  0x0000FE5F,
  0x0000FE61,
  0x0000FE62,
  0x0000FE62,
  0x0000FE63,
  0x0000FE63,
  0x0000FE64,
  0x0000FE66,
  0x0000FE68,
  0x0000FE68,
  0x0000FE69,
  0x0000FE69,
  0x0000FE6A,
  0x0000FE6B,
  0x0000FF01,
  0x0000FF03,
  0x0000FF04,
  0x0000FF04,
  0x0000FF05,
  0x0000FF07,
  0x0000FF08,
  0x0000FF08,
  0x0000FF09,
  0x0000FF09,
  0x0000FF0A,
  0x0000FF0A,
  0x0000FF0B,
  0x0000FF0B,
  0x0000FF0C,
  0x0000FF0C,
  0x0000FF0D,
  0x0000FF0D,
  0x0000FF0E,
  0x0000FF0F,
  0x0000FF10,
  0x0000FF19,
  0x0000FF1A,
  0x0000FF1B,
  0x0000FF1C,
  0x0000FF1E,
  0x0000FF1F,
  0x0000FF20,
  0x0000FF21,
  0x0000FF3A,
  0x0000FF3B,
  0x0000FF3B,
  0x0000FF3C,
  0x0000FF3C,
  0x0000FF3D,
  0x0000FF3D,
  0x0000FF3E,
  0x0000FF3E,
  0x0000FF3F,
  0x0000FF3F,
  0x0000FF40,
  0x0000FF40,
  0x0000FF41,
  0x0000FF5A,
  0x0000FF5B,
  0x0000FF5B,
  0x0000FF5C,
  0x0000FF5C,
  0x0000FF5D,
  0x0000FF5D,
  0x0000FF5E,
  0x0000FF5E,
  0x0000FF5F,
  0x0000FF5F,
  0x0000FF60,
  0x0000FF60,
  0x0000FFE0,
  0x0000FFE1,
  0x0000FFE2,
  0x0000FFE2,
  0x0000FFE3,
  0x0000FFE3,
  0x0000FFE4,
  0x0000FFE4,
  0x0000FFE5,
  0x0000FFE6,
  0x00016FE0,
  0x00016FE1,
  0x00016FE2,
  0x00016FE2,
  0x00016FE3,
  0x00016FE3,
  0x00016FE4,
  0x00016FE4,
  0x00016FF0,
  0x00016FF1,
  0x00017000,
  0x000187F7,
  0x00018800,
  0x00018AFF,
  0x00018B00,
  0x00018CD5,
  0x00018D00,
  0x00018D08,
  0x0001B000,
  0x0001B0FF,
  0x0001B100,
  0x0001B11E,
  0x0001B150,
  0x0001B152,
  0x0001B164,
  0x0001B167,
  0x0001B170,
  0x0001B2FB,
  0x0001F004,
  0x0001F004,
  0x0001F0CF,
  0x0001F0CF,
  0x0001F18E,
  0x0001F18E,
  0x0001F191,
  0x0001F19A,
  0x0001F200,
  0x0001F202,
  0x0001F210,
  0x0001F23B,
  0x0001F240,
  0x0001F248,
  0x0001F250,
  0x0001F251,
  0x0001F260,
  0x0001F265,
  0x0001F300,
  0x0001F320,
  0x0001F32D,
  0x0001F335,
  0x0001F337,
  0x0001F37C,
  0x0001F37E,
  0x0001F393,
  0x0001F3A0,
  0x0001F3CA,
  0x0001F3CF,
  0x0001F3D3,
  0x0001F3E0,
  0x0001F3F0,
  0x0001F3F4,
  0x0001F3F4,
  0x0001F3F8,
  0x0001F3FA,
  0x0001F3FB,
  0x0001F3FF,
  0x0001F400,
  0x0001F43E,
  0x0001F440,
  0x0001F440,
  0x0001F442,
  0x0001F4FC,
  0x0001F4FF,
  0x0001F53D,
  0x0001F54B,
  0x0001F54E,
  0x0001F550,
  0x0001F567,
  0x0001F57A,
  0x0001F57A,
  0x0001F595,
  0x0001F596,
  0x0001F5A4,
  0x0001F5A4,
  0x0001F5FB,
  0x0001F5FF,
  0x0001F600,
  0x0001F64F,
  0x0001F680,
  0x0001F6C5,
  0x0001F6CC,
  0x0001F6CC,
  0x0001F6D0,
  0x0001F6D2,
  0x0001F6D5,
  0x0001F6D7,
  0x0001F6EB,
  0x0001F6EC,
  0x0001F6F4,
  0x0001F6FC,
  0x0001F7E0,
  0x0001F7EB,
  0x0001F90C,
  0x0001F93A,
  0x0001F93C,
  0x0001F945,
  0x0001F947,
  0x0001F978,
  0x0001F97A,
  0x0001F9CB,
  0x0001F9CD,
  0x0001F9FF,
  0x0001FA70,
  0x0001FA74,
  0x0001FA78,
  0x0001FA7A,
  0x0001FA80,
  0x0001FA86,
  0x0001FA90,
  0x0001FAA8,
  0x0001FAB0,
  0x0001FAB6,
  0x0001FAC0,
  0x0001FAC2,
  0x0001FAD0,
  0x0001FAD6,
  0x00020000,
  0x0002A6DD,
  0x0002A6DE,
  0x0002A6FF,
  0x0002A700,
  0x0002B734,
  0x0002B735,
  0x0002B73F,
  0x0002B740,
  0x0002B81D,
  0x0002B81E,
  0x0002B81F,
  0x0002B820,
  0x0002CEA1,
  0x0002CEA2,
  0x0002CEAF,
  0x0002CEB0,
  0x0002EBE0,
  0x0002EBE1,
  0x0002F7FF,
  0x0002F800,
  0x0002FA1D,
  0x0002FA1E,
  0x0002FA1F,
  0x0002FA20,
  0x0002FFFD,
  0x00030000,
  0x0003134A,
  0x0003134B,
  0x0003FFFD,
} --~ }}}

-- Autogenerated from DerivedGeneralCategory.txt
local _tab_zero = { --~ {{{2
  0x00000300,
  0x0000036F,
  0x00000483,
  0x00000487,
  0x00000488,
  0x00000489,
  0x00000591,
  0x000005BD,
  0x000005BF,
  0x000005BF,
  0x000005C1,
  0x000005C2,
  0x000005C4,
  0x000005C5,
  0x000005C7,
  0x000005C7,
  0x00000610,
  0x0000061A,
  0x0000064B,
  0x0000065F,
  0x00000670,
  0x00000670,
  0x000006D6,
  0x000006DC,
  0x000006DF,
  0x000006E4,
  0x000006E7,
  0x000006E8,
  0x000006EA,
  0x000006ED,
  0x00000711,
  0x00000711,
  0x00000730,
  0x0000074A,
  0x000007A6,
  0x000007B0,
  0x000007EB,
  0x000007F3,
  0x000007FD,
  0x000007FD,
  0x00000816,
  0x00000819,
  0x0000081B,
  0x00000823,
  0x00000825,
  0x00000827,
  0x00000829,
  0x0000082D,
  0x00000859,
  0x0000085B,
  0x000008D3,
  0x000008E1,
  0x000008E3,
  0x00000902,
  0x0000093A,
  0x0000093A,
  0x0000093C,
  0x0000093C,
  0x00000941,
  0x00000948,
  0x0000094D,
  0x0000094D,
  0x00000951,
  0x00000957,
  0x00000962,
  0x00000963,
  0x00000981,
  0x00000981,
  0x000009BC,
  0x000009BC,
  0x000009C1,
  0x000009C4,
  0x000009CD,
  0x000009CD,
  0x000009E2,
  0x000009E3,
  0x000009FE,
  0x000009FE,
  0x00000A01,
  0x00000A02,
  0x00000A3C,
  0x00000A3C,
  0x00000A41,
  0x00000A42,
  0x00000A47,
  0x00000A48,
  0x00000A4B,
  0x00000A4D,
  0x00000A51,
  0x00000A51,
  0x00000A70,
  0x00000A71,
  0x00000A75,
  0x00000A75,
  0x00000A81,
  0x00000A82,
  0x00000ABC,
  0x00000ABC,
  0x00000AC1,
  0x00000AC5,
  0x00000AC7,
  0x00000AC8,
  0x00000ACD,
  0x00000ACD,
  0x00000AE2,
  0x00000AE3,
  0x00000AFA,
  0x00000AFF,
  0x00000B01,
  0x00000B01,
  0x00000B3C,
  0x00000B3C,
  0x00000B3F,
  0x00000B3F,
  0x00000B41,
  0x00000B44,
  0x00000B4D,
  0x00000B4D,
  0x00000B55,
  0x00000B56,
  0x00000B62,
  0x00000B63,
  0x00000B82,
  0x00000B82,
  0x00000BC0,
  0x00000BC0,
  0x00000BCD,
  0x00000BCD,
  0x00000C00,
  0x00000C00,
  0x00000C04,
  0x00000C04,
  0x00000C3E,
  0x00000C40,
  0x00000C46,
  0x00000C48,
  0x00000C4A,
  0x00000C4D,
  0x00000C55,
  0x00000C56,
  0x00000C62,
  0x00000C63,
  0x00000C81,
  0x00000C81,
  0x00000CBC,
  0x00000CBC,
  0x00000CBF,
  0x00000CBF,
  0x00000CC6,
  0x00000CC6,
  0x00000CCC,
  0x00000CCD,
  0x00000CE2,
  0x00000CE3,
  0x00000D00,
  0x00000D01,
  0x00000D3B,
  0x00000D3C,
  0x00000D41,
  0x00000D44,
  0x00000D4D,
  0x00000D4D,
  0x00000D62,
  0x00000D63,
  0x00000D81,
  0x00000D81,
  0x00000DCA,
  0x00000DCA,
  0x00000DD2,
  0x00000DD4,
  0x00000DD6,
  0x00000DD6,
  0x00000E31,
  0x00000E31,
  0x00000E34,
  0x00000E3A,
  0x00000E47,
  0x00000E4E,
  0x00000EB1,
  0x00000EB1,
  0x00000EB4,
  0x00000EBC,
  0x00000EC8,
  0x00000ECD,
  0x00000F18,
  0x00000F19,
  0x00000F35,
  0x00000F35,
  0x00000F37,
  0x00000F37,
  0x00000F39,
  0x00000F39,
  0x00000F71,
  0x00000F7E,
  0x00000F80,
  0x00000F84,
  0x00000F86,
  0x00000F87,
  0x00000F8D,
  0x00000F97,
  0x00000F99,
  0x00000FBC,
  0x00000FC6,
  0x00000FC6,
  0x0000102D,
  0x00001030,
  0x00001032,
  0x00001037,
  0x00001039,
  0x0000103A,
  0x0000103D,
  0x0000103E,
  0x00001058,
  0x00001059,
  0x0000105E,
  0x00001060,
  0x00001071,
  0x00001074,
  0x00001082,
  0x00001082,
  0x00001085,
  0x00001086,
  0x0000108D,
  0x0000108D,
  0x0000109D,
  0x0000109D,
  0x0000135D,
  0x0000135F,
  0x00001712,
  0x00001714,
  0x00001732,
  0x00001734,
  0x00001752,
  0x00001753,
  0x00001772,
  0x00001773,
  0x000017B4,
  0x000017B5,
  0x000017B7,
  0x000017BD,
  0x000017C6,
  0x000017C6,
  0x000017C9,
  0x000017D3,
  0x000017DD,
  0x000017DD,
  0x0000180B,
  0x0000180D,
  0x00001885,
  0x00001886,
  0x000018A9,
  0x000018A9,
  0x00001920,
  0x00001922,
  0x00001927,
  0x00001928,
  0x00001932,
  0x00001932,
  0x00001939,
  0x0000193B,
  0x00001A17,
  0x00001A18,
  0x00001A1B,
  0x00001A1B,
  0x00001A56,
  0x00001A56,
  0x00001A58,
  0x00001A5E,
  0x00001A60,
  0x00001A60,
  0x00001A62,
  0x00001A62,
  0x00001A65,
  0x00001A6C,
  0x00001A73,
  0x00001A7C,
  0x00001A7F,
  0x00001A7F,
  0x00001AB0,
  0x00001ABD,
  0x00001ABE,
  0x00001ABE,
  0x00001ABF,
  0x00001AC0,
  0x00001B00,
  0x00001B03,
  0x00001B34,
  0x00001B34,
  0x00001B36,
  0x00001B3A,
  0x00001B3C,
  0x00001B3C,
  0x00001B42,
  0x00001B42,
  0x00001B6B,
  0x00001B73,
  0x00001B80,
  0x00001B81,
  0x00001BA2,
  0x00001BA5,
  0x00001BA8,
  0x00001BA9,
  0x00001BAB,
  0x00001BAD,
  0x00001BE6,
  0x00001BE6,
  0x00001BE8,
  0x00001BE9,
  0x00001BED,
  0x00001BED,
  0x00001BEF,
  0x00001BF1,
  0x00001C2C,
  0x00001C33,
  0x00001C36,
  0x00001C37,
  0x00001CD0,
  0x00001CD2,
  0x00001CD4,
  0x00001CE0,
  0x00001CE2,
  0x00001CE8,
  0x00001CED,
  0x00001CED,
  0x00001CF4,
  0x00001CF4,
  0x00001CF8,
  0x00001CF9,
  0x00001DC0,
  0x00001DF9,
  0x00001DFB,
  0x00001DFF,
  0x000020D0,
  0x000020DC,
  0x000020DD,
  0x000020E0,
  0x000020E1,
  0x000020E1,
  0x000020E2,
  0x000020E4,
  0x000020E5,
  0x000020F0,
  0x00002CEF,
  0x00002CF1,
  0x00002D7F,
  0x00002D7F,
  0x00002DE0,
  0x00002DFF,
  0x0000302A,
  0x0000302D,
  0x00003099,
  0x0000309A,
  0x0000A66F,
  0x0000A66F,
  0x0000A670,
  0x0000A672,
  0x0000A674,
  0x0000A67D,
  0x0000A69E,
  0x0000A69F,
  0x0000A6F0,
  0x0000A6F1,
  0x0000A802,
  0x0000A802,
  0x0000A806,
  0x0000A806,
  0x0000A80B,
  0x0000A80B,
  0x0000A825,
  0x0000A826,
  0x0000A82C,
  0x0000A82C,
  0x0000A8C4,
  0x0000A8C5,
  0x0000A8E0,
  0x0000A8F1,
  0x0000A8FF,
  0x0000A8FF,
  0x0000A926,
  0x0000A92D,
  0x0000A947,
  0x0000A951,
  0x0000A980,
  0x0000A982,
  0x0000A9B3,
  0x0000A9B3,
  0x0000A9B6,
  0x0000A9B9,
  0x0000A9BC,
  0x0000A9BD,
  0x0000A9E5,
  0x0000A9E5,
  0x0000AA29,
  0x0000AA2E,
  0x0000AA31,
  0x0000AA32,
  0x0000AA35,
  0x0000AA36,
  0x0000AA43,
  0x0000AA43,
  0x0000AA4C,
  0x0000AA4C,
  0x0000AA7C,
  0x0000AA7C,
  0x0000AAB0,
  0x0000AAB0,
  0x0000AAB2,
  0x0000AAB4,
  0x0000AAB7,
  0x0000AAB8,
  0x0000AABE,
  0x0000AABF,
  0x0000AAC1,
  0x0000AAC1,
  0x0000AAEC,
  0x0000AAED,
  0x0000AAF6,
  0x0000AAF6,
  0x0000ABE5,
  0x0000ABE5,
  0x0000ABE8,
  0x0000ABE8,
  0x0000ABED,
  0x0000ABED,
  0x0000FB1E,
  0x0000FB1E,
  0x0000FE00,
  0x0000FE0F,
  0x0000FE20,
  0x0000FE2F,
  0x000101FD,
  0x000101FD,
  0x000102E0,
  0x000102E0,
  0x00010376,
  0x0001037A,
  0x00010A01,
  0x00010A03,
  0x00010A05,
  0x00010A06,
  0x00010A0C,
  0x00010A0F,
  0x00010A38,
  0x00010A3A,
  0x00010A3F,
  0x00010A3F,
  0x00010AE5,
  0x00010AE6,
  0x00010D24,
  0x00010D27,
  0x00010EAB,
  0x00010EAC,
  0x00010F46,
  0x00010F50,
  0x00011001,
  0x00011001,
  0x00011038,
  0x00011046,
  0x0001107F,
  0x00011081,
  0x000110B3,
  0x000110B6,
  0x000110B9,
  0x000110BA,
  0x00011100,
  0x00011102,
  0x00011127,
  0x0001112B,
  0x0001112D,
  0x00011134,
  0x00011173,
  0x00011173,
  0x00011180,
  0x00011181,
  0x000111B6,
  0x000111BE,
  0x000111C9,
  0x000111CC,
  0x000111CF,
  0x000111CF,
  0x0001122F,
  0x00011231,
  0x00011234,
  0x00011234,
  0x00011236,
  0x00011237,
  0x0001123E,
  0x0001123E,
  0x000112DF,
  0x000112DF,
  0x000112E3,
  0x000112EA,
  0x00011300,
  0x00011301,
  0x0001133B,
  0x0001133C,
  0x00011340,
  0x00011340,
  0x00011366,
  0x0001136C,
  0x00011370,
  0x00011374,
  0x00011438,
  0x0001143F,
  0x00011442,
  0x00011444,
  0x00011446,
  0x00011446,
  0x0001145E,
  0x0001145E,
  0x000114B3,
  0x000114B8,
  0x000114BA,
  0x000114BA,
  0x000114BF,
  0x000114C0,
  0x000114C2,
  0x000114C3,
  0x000115B2,
  0x000115B5,
  0x000115BC,
  0x000115BD,
  0x000115BF,
  0x000115C0,
  0x000115DC,
  0x000115DD,
  0x00011633,
  0x0001163A,
  0x0001163D,
  0x0001163D,
  0x0001163F,
  0x00011640,
  0x000116AB,
  0x000116AB,
  0x000116AD,
  0x000116AD,
  0x000116B0,
  0x000116B5,
  0x000116B7,
  0x000116B7,
  0x0001171D,
  0x0001171F,
  0x00011722,
  0x00011725,
  0x00011727,
  0x0001172B,
  0x0001182F,
  0x00011837,
  0x00011839,
  0x0001183A,
  0x0001193B,
  0x0001193C,
  0x0001193E,
  0x0001193E,
  0x00011943,
  0x00011943,
  0x000119D4,
  0x000119D7,
  0x000119DA,
  0x000119DB,
  0x000119E0,
  0x000119E0,
  0x00011A01,
  0x00011A0A,
  0x00011A33,
  0x00011A38,
  0x00011A3B,
  0x00011A3E,
  0x00011A47,
  0x00011A47,
  0x00011A51,
  0x00011A56,
  0x00011A59,
  0x00011A5B,
  0x00011A8A,
  0x00011A96,
  0x00011A98,
  0x00011A99,
  0x00011C30,
  0x00011C36,
  0x00011C38,
  0x00011C3D,
  0x00011C3F,
  0x00011C3F,
  0x00011C92,
  0x00011CA7,
  0x00011CAA,
  0x00011CB0,
  0x00011CB2,
  0x00011CB3,
  0x00011CB5,
  0x00011CB6,
  0x00011D31,
  0x00011D36,
  0x00011D3A,
  0x00011D3A,
  0x00011D3C,
  0x00011D3D,
  0x00011D3F,
  0x00011D45,
  0x00011D47,
  0x00011D47,
  0x00011D90,
  0x00011D91,
  0x00011D95,
  0x00011D95,
  0x00011D97,
  0x00011D97,
  0x00011EF3,
  0x00011EF4,
  0x00016AF0,
  0x00016AF4,
  0x00016B30,
  0x00016B36,
  0x00016F4F,
  0x00016F4F,
  0x00016F8F,
  0x00016F92,
  0x00016FE4,
  0x00016FE4,
  0x0001BC9D,
  0x0001BC9E,
  0x0001D167,
  0x0001D169,
  0x0001D17B,
  0x0001D182,
  0x0001D185,
  0x0001D18B,
  0x0001D1AA,
  0x0001D1AD,
  0x0001D242,
  0x0001D244,
  0x0001DA00,
  0x0001DA36,
  0x0001DA3B,
  0x0001DA6C,
  0x0001DA75,
  0x0001DA75,
  0x0001DA84,
  0x0001DA84,
  0x0001DA9B,
  0x0001DA9F,
  0x0001DAA1,
  0x0001DAAF,
  0x0001E000,
  0x0001E006,
  0x0001E008,
  0x0001E018,
  0x0001E01B,
  0x0001E021,
  0x0001E023,
  0x0001E024,
  0x0001E026,
  0x0001E02A,
  0x0001E130,
  0x0001E136,
  0x0001E2EC,
  0x0001E2EF,
  0x0001E8D0,
  0x0001E8D6,
  0x0001E944,
  0x0001E94A,
  0x000E0100,
  0x000E01EF,
} --~ }}}
-- }}}

local zero_width_set = {
  [0] = true,
  [0x034F] = true,
  [0x2028] = true,
  [0x2029] = true,
  [0x200B] = true,
  [0x200C] = true,
  [0x200D] = true,
  [0x200E] = true,
  [0x200F] = true,
  [0x202A] = true,
  [0x202B] = true,
  [0x202C] = true,
  [0x202D] = true,
  [0x202E] = true,
  [0x2060] = true,
  [0x2061] = true,
  [0x2062] = true,
  [0x2063] = true,
}
return function(rune)
  if zero_width_set[rune] then
    return 0
  end

  -- C0/C1 control characters
  if rune < 32 or (0x07F <= rune and rune < 0x0A0) then
    return -1
  end

  -- Combining characters with zero width
  if _lookup(rune, _tab_zero) == 1 then
    return 0
  end

  return 1 + _lookup(rune, _tab_wide)
end
