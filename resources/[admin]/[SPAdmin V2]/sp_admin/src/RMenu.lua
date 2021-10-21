RageUI = {}

RMenu = setmetatable({}, RMenu)

local TotalMenus = {}

function RMenu.Add(Type, Name, Menu)
    if RMenu[Type] ~= nil then
        RMenu[Type][Name] = {
            Menu = Menu
        }
    else
        RMenu[Type] = {}
        RMenu[Type][Name] = {
            Menu = Menu
        }
    end
    table.insert(TotalMenus, Menu)
end

function RMenu:Get(Type, Name)
    if self[Type] ~= nil and self[Type][Name] ~= nil then
        return self[Type][Name].Menu
    end
end

function RMenu:Settings(Type, Name, Settings, Value)
    self[Type][Name][Settings] = Value
end


function RMenu:Delete(Type, Name)
    self[Type][Name] = nil
end

function RMenu:DeleteType(Type)
    self[Type] = nil
end