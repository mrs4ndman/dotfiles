local M = {}
-- Execute the playerctl command and capture its output
local playerctl_command = "playerctl -p spotify metadata"
local playerctl_output = io.popen(playerctl_command):read("*a")

-- Initialize variables to store extracted information
local title, artist, album

-- Iterate over lines and extract Title, Artist, and Album
---@return string
function M.player_split()
  for line in playerctl_output:gmatch("[^\r\n]+") do
    local key, value = line:match("(%S+)%s+(.*)")
    if key == "spotify" then
      if value:find("xesam:title") then
        title = value:match("xesam:title%s+(.*)")
      elseif value:find("xesam:artist") then
        artist = value:match("xesam:artist%s+(.*)")
      elseif value:find("xesam:album%s+") then
        album = value:match("xesam:album%s+(.*)")
      end
    end
  end
  M.title = print("Title: " .. title)
  M.artist = print("Artist: " .. artist)
  M.album = print("Album: " .. album)
  M.concat_info = title .. artist
  M.full_concat_info = title .. "-" .. artist .. "-" .. album
  return M.full_concat_info
end

-- Print the extracted information

-- return full_concat_info
return M

