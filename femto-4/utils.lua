function flr(v,...)
  if not v then return end
  return math.floor(v),flr(...)
end

function boundscreen_x(x)
  return math.min(math.max(x,0),63)
end
function boundscreen_y(y)
  return math.min(math.max(y,0),47)
end

function sign(number)
  return number > 0 and 1 or (number == 0 and 0 or -1)
end

--- string pad, appends a character to the start of a string til it hits a given length
---@param st string
---@param len number
---@param padch string
function pad(st, len, padch)
  padch=padch or " "
  st=tostring(st)
  padch=tostring(padch)
  if #st<len then return pad(padch..st,len,padch) end
  return st
end

function insert_char(st,i,ch)
  return st:sub(1,i)..ch..st:sub(i+1,-1)
end
function del_char(st,i)
  if i==0 then return st end
  return st:sub(1,i-1)..st:sub(i+1,-1)
end

--- mid bounds a number to a range
---@param l number
---@param v number
---@param u number
function mid(l,v,u)
  return math.min(math.max(l,v),u)
end

function lerp(a,b,t)
  return (1-t)*a+b*t
end


--https://stackoverflow.com/questions/3554315/lua-base-converter
local floor,insert = math.floor, table.insert
function basen(n,b,w)
    w=w or 0
    n = floor(n)
    if not b or b == 10 then return tostring(n) end
    local digits = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    local t = {}
    local sign = ""
    if n < 0 then
        sign = "-"
    n = -n
    end
    repeat
        if w>0 then w=w-1 end
        local d = (n % b) + 1
        n = floor(n / b)
        insert(t, 1, digits:sub(d,d))
    until n == 0 and w==0
    return sign .. table.concat(t,"")
end

function convertpos(x,y,ox,oy,scalex,scaley)
  local scaley=scaley or scalex
  return math.floor((x-ox)/scalex),math.floor((y-oy)/scaley)
end