----------------------- [ MenuV ] -----------------------
local assert = assert
local MenuV = assert(MenuV)
local godmode = false
local infStamina = false
local invisibility = false
local fastSwim = false
local fastSprint = false
local superJump = false
local fireAmmo = false
local oneShotKill = false
local explossiveAmmo = false
local infiniteAmmo = false
local teleportGun = false
local vehicleGun = false
local whaleGun = false
Admin = {
	showcoords = false,
	showcrosshair = false,
	ghostmode = false,
    godmode = false,
    showName = false,
    gamerTags = {}
}

local menu = MenuV:CreateMenu(false, 'Welcome to SP Admin', 'topleft', 255, 0, 0, 'size-125', 'spadmin')
local menu2 = MenuV:CreateMenu(false, 'SP Admin', 'topleft', 255, 0, 0, 'size-125', 'spadmin')
local menu3 = MenuV:CreateMenu(false, 'SP Admin', 'topleft', 255, 0, 0, 'size-125', 'spadmin')
local menu4 = MenuV:CreateMenu(false, 'SP Admin', 'topleft', 255, 0, 0, 'size-125', 'spadmin')
local menuneo = MenuV:CreateMenu(false, 'SP Admin', 'topleft', 255, 0, 0, 'size-125', 'spadmin')
local m1 = MenuV:CreateMenu(false, 'SP Admin', 'topleft', 255, 0, 0, 'size-125', 'spadmin')
local m2 = MenuV:CreateMenu(false, 'SP Admin', 'topleft', 255, 0, 0, 'size-125', 'spadmin')
local m8 = MenuV:CreateMenu(false, 'SP Admin', 'topleft', 255, 0, 0, 'size-125', 'spadmin')
local women = MenuV:CreateMenu(false, 'SP Admin', 'topleft', 255, 0, 0, 'size-125', 'spadmin')
local men = MenuV:CreateMenu(false, 'SP Admin', 'topleft', 255, 0, 0, 'size-125', 'spadmin')
local costume = MenuV:CreateMenu(false, 'SP Admin', 'topleft', 255, 0, 0, 'size-125', 'spadmin')
local animalmenu = MenuV:CreateMenu(false, 'SP Admin', 'topleft', 255, 0, 0, 'size-125', 'spadmin')

local menu_button = menu:AddButton({ icon = '😃', label = 'Me', value = menu2, description = 'NoClip / GodMod and Others !' })
local markertp = menu2:AddButton({ icon = '🚶‍', label = 'TP Marker', value = menu90000, description = 'TP Marker' })
local noclip = menu2:AddCheckbox({ icon = '👁️‍🗨️', label = 'No Clip', value = menu30, description = 'NoClip' })
local noclipv2 = menu2:AddCheckbox({ icon = '👁️‍🗨️', label = 'No Clip V2', value = menu301, description = 'NoClip V2' })
local godmode = menu2:AddCheckbox({ icon = '♥️', label = 'GodMod', value = menu40, description = 'GodMod' })
local showcrosshair = menu2:AddCheckbox({ icon = '🖱️', label = 'Crosshair', value = menu40, description = 'Show crosshair' })
local svmaxArmor = menu2:AddConfirm({ icon = '⛷️', label = 'Fast Sprint', value = armor, description = 'Fast Sprint' })
local toggleFastSwim = menu2:AddConfirm({ icon = '🏊', label = 'Fast Swim', value = armor, description = 'Fast Swim' })
local toggleSuperJump = menu2:AddConfirm({ icon = '✈️', label = 'Super Jump', value = armor, description = 'Super Jump' })
local toggleInfStamina = menu2:AddConfirm({ icon = '🌬️', label = 'Infinite Stamina', value = armor, description = 'Infinite Stamina' })
local toggleInvisibility = menu2:AddConfirm({ icon = '🌌', label = 'Invisibility', value = armor, description = 'Invisibility' })
local giveallweapon = menu2:AddConfirm({ icon = '🔫', label = 'Give All Weapons', value = menu50, description = 'Give All Weapons' }) 
local heal = menu2:AddCheckbox({ icon = '💉', label = 'Heal', value = menu60, description = 'Heal' }) 
local modo_showcoord = menu2:AddCheckbox({ icon = '🧭', label = 'Show Coordinates', value = menu70, description = 'Show Coordinates' }) 
local admin_give_money = menu2:AddSlider({ icon = '💲', label = 'Give Myself Money', value = menu80, values = {
    { label = 'Cash', value = 1, description = '' },
    { label = 'Bank', value = 2, description = '' },
    { label = 'Dirty', value = 3, description = '' }
}})
admin_give_money:On('select', function(i, selectedValue)
  print(selectedValue) -- will print the given value, if you selected `Demo Item` then it will print `1` toggleFastSwim

  if (selectedValue == 1) then
    admin_give_money()
  elseif (selectedValue == 2) then
    admin_give_bank()
  elseif (selectedValue == 3) then
    admin_give_dirty()
  end
end)
local changer_skin = menu2:AddConfirm({ icon = '🙎‍', label = 'Change Appearance', value = menu90, description = 'Change Appearance' }) 

local admin = menu:AddButton({ icon = '👑', label = 'Admin', value = m2, description = 'Categories Car' })
local spec = m2:AddConfirm({ icon = '👁️‍🗨️', label = 'Spectate ', value = pil1, description = 'Spectate Player' })
local adminmode = m2:AddConfirm({ icon = '👁️‍🗨️', label = 'Sow Coord Players', value = pil1, description = 'Sow Coord Players' })
local checkstaff = m2:AddCheckbox({ icon = '👁️‍🗨️', label = 'Check Staff Online', value = pil1, description = 'Check Staff Online' })
local tag = m2:AddCheckbox({ icon = '🛡️', label = 'Tag Admin', value = pil2, description = 'Tag Admin' })
local blipsplayer = m2:AddConfirm({ icon = '◻️', label = 'Players Blips', value = pil3, description = 'Show Players Blips' })
local nameplayer = m2:AddCheckbox({ icon = '🚶‍', label = 'Players Name', value = pil4, description = 'Show Players Name' })
local reporthistory = m2:AddCheckbox({ icon = '⚙️‍', label = 'Reports history', value = pil5, description = 'Reports history' })
local banplayer = m2:AddCheckbox({ icon = '⚙️‍', label = 'Ban Player', value = pil9, description = 'Ban Player' })
local banplayerh = m2:AddCheckbox({ icon = '⚙️‍', label = 'Ban List', value = pil9, description = 'Ban List Player' })
local warnplayer = m2:AddCheckbox({ icon = '⚙️‍', label = 'Warn Player', value = pil9, description = 'Warn Player' })
local warnplayerh = m2:AddCheckbox({ icon = '⚙️‍', label = 'Warn List', value = pil9, description = 'Warn List Player' })
local playerslistof = menu:AddCheckbox({ icon = '📃', label = 'Players', value = player, description = 'List of Players' })

local ped = menu:AddButton({ icon = '🙎', label = 'Ped', value = menu3, description = 'Lots of ped' })
local keyped = menu3:AddCheckbox({ icon = '🙎', label = 'Choose a Ped', value = pedcose, description = 'Choose a ped' })
local animal = menu3:AddButton({ icon = '🙎‍', label = 'Animals', value = animalmenu, description = 'Animals ped' })
local women1 = menu3:AddButton({ icon = '🙎‍', label = 'Women', value = women, description = 'Women ped' })
local men1 = menu3:AddButton({ icon = '🙎‍', label = 'Men', value = men, description = 'Men ped' })
local costume1 = menu3:AddButton({ icon = '🙎‍', label = 'Costume', value = costume, description = 'Costume ped' })

local monkey = animalmenu:AddConfirm({ icon = '🙎‍', label = 'Monkey', value = menu101, description = 'ped' })
local stripper = women:AddConfirm({ icon = '🙎‍', label = 'Stripper', value = menu104, description = 'ped' })
local cosmonaut = costume:AddConfirm({ icon = '🙎‍', label = 'Cosmonaut', value = menu105, description = 'ped' })
local alien = costume:AddConfirm({ icon = '🙎‍', label = 'Alien', value = menu106, description = 'ped' })
local costume2 = costume:AddConfirm({ icon = '🙎‍', label = 'Juggerna', value = menu132, description = 'ped' })
local costume3 = costume:AddConfirm({ icon = '🙎‍', label = 'Pogo', value = menu132, description = 'ped' })
local costume4 = costume:AddConfirm({ icon = '🙎‍', label = 'Ranger', value = menu132, description = 'ped' })
local costume5 = costume:AddConfirm({ icon = '🙎‍', label = 'Imporage', value = menu132, description = 'ped' })
local beach = women:AddConfirm({ icon = '🙎‍', label = 'Beach', value = menu107, description = 'ped' })
local women1 = women:AddConfirm({ icon = '🙎‍', label = 'Buisiness Women', value = menu132, description = 'ped ' })
local women2 = women:AddConfirm({ icon = '🙎‍', label = 'Body Buil', value = menu132, description = 'ped ' })
local women4 = women:AddConfirm({ icon = '🙎‍', label = 'Downtow', value = menu132, description = 'ped' })
local women5 = women:AddConfirm({ icon = '🙎‍', label = 'Eastsa', value = menu132, description = 'ped' })

local women7 = women:AddConfirm({ icon = '🙎‍', label = 'FtaBla', value = menu132, description = 'ped' })
local women8 = women:AddConfirm({ icon = '🙎‍', label = 'FatCult', value = menu132, description = 'ped' })
local women9 = women:AddConfirm({ icon = '🙎‍', label = 'FatWhite', value = menu132, description = 'ped' })
local women10 = women:AddConfirm({ icon = '🙎‍', label = 'Ktown', value = menu132, description = 'ped' })
local women12 = women:AddConfirm({ icon = '🙎‍', label = 'Prolhost', value = menu132, description = 'ped' })
local women13 = women:AddConfirm({ icon = '🙎‍', label = 'Salton', value = menu132, description = 'ped' })
local women14 = women:AddConfirm({ icon = '🙎‍', label = 'Skidrow', value = menu132, description = 'ped' })
local women15 = women:AddConfirm({ icon = '🙎‍', label = 'Soucent', value = menu132, description = 'ped' })
local women18 = women:AddConfirm({ icon = '🙎‍', label = 'Tourist', value = menu132, description = 'ped' })
local women19 = women:AddConfirm({ icon = '🙎‍', label = 'Tramp', value = menu132, description = 'ped' })
local women20 = women:AddConfirm({ icon = '🙎‍', label = 'Tramp-Bea', value = menu132, description = 'ped' })
local women21 = women:AddConfirm({ icon = '🙎‍', label = 'Genstreet', value = menu132, description = 'ped' })
local women22 = women:AddConfirm({ icon = '🙎‍', label = 'Indian', value = menu132, description = 'ped' })
local women23 = women:AddConfirm({ icon = '🙎‍', label = 'Stown', value = menu132, description = 'ped' })
local women28 = women:AddConfirm({ icon = '🙎‍', label = 'Bevhills', value = menu132, description = 'ped' })
local women31 = women:AddConfirm({ icon = '🙎‍', label = 'Clubcust', value = menu132, description = 'ped' })
local men1 = men:AddConfirm({ icon = '🙎‍', label = 'Acult', value = menu132, description = 'ped' })
local men2 = men:AddConfirm({ icon = '🙎‍', label = 'Afriamer', value = menu132, description = 'ped' })
local men3 = men:AddConfirm({ icon = '🙎‍', label = 'Beach', value = menu132, description = 'ped' })
local men4 = men:AddConfirm({ icon = '🙎‍', label = 'Beach 2', value = menu132, description = 'ped ' })
local men5 = men:AddConfirm({ icon = '🙎‍', label = 'Bevhills', value = menu132, description = 'ped' })
local men6 = men:AddConfirm({ icon = '🙎‍', label = 'Buisiness Men', value = menu132, description = 'ped ' })
local men7 = men:AddConfirm({ icon = '🙎‍', label = 'Eastsa', value = menu132, description = 'ped' })
local men8 = men:AddConfirm({ icon = '🙎‍', label = 'Farmer', value = menu132, description = 'ped' })
local men9 = men:AddConfirm({ icon = '🙎‍', label = 'Fatlatin', value = menu132, description = 'ped' })
local men10 = men:AddConfirm({ icon = '🙎‍', label = 'Genfat', value = menu132, description = 'ped' })
local men11 = men:AddConfirm({ icon = '🙎‍', label = 'Golfer', value = menu132, description = 'ped' })
local men12 = men:AddConfirm({ icon = '🙎‍', label = 'Ballas', value = menu132, description = 'ped' })
local men13 = men:AddConfirm({ icon = '🙎‍', label = 'Famillies', value = menu132, description = 'ped' })
local men14 = men:AddConfirm({ icon = '🙎‍', label = 'Salvagoo', value = menu132, description = 'ped' })
local men15 = men:AddConfirm({ icon = '🙎‍', label = 'Chigoon', value = menu132, description = 'ped' })
local men16 = men:AddConfirm({ icon = '🙎‍', label = 'Paper', value = menu132, description = 'ped' })
local men17 = men:AddConfirm({ icon = '🙎‍', label = 'Popov', value = menu132, description = 'ped' })
local men18 = men:AddConfirm({ icon = '🙎‍', label = 'Priest', value = menu132, description = 'ped' })
local men19 = men:AddConfirm({ icon = '🙎‍', label = 'Talc', value = menu132, description = 'ped' })
local men20 = men:AddConfirm({ icon = '🙎‍', label = 'Money', value = menu132, description = 'ped' })
local ped15 = animalmenu:AddConfirm({ icon = '🙎‍', label = 'Boar', value = menu122, description = 'ped' })
local ped16 = animalmenu:AddConfirm({ icon = '🙎‍', label = 'Cat', value = menu123, description = 'ped' })
local ped18 = animalmenu:AddConfirm({ icon = '🙎‍', label = 'Cormorant', value = menu125, description = 'ped' })
local ped19 = animalmenu:AddConfirm({ icon = '🙎‍', label = 'Cow', value = menu126, description = 'ped' })
local ped20 = animalmenu:AddConfirm({ icon = '🙎‍', label = 'Coyote', value = menu127, description = 'ped' })
local ped21 = animalmenu:AddConfirm({ icon = '🙎‍', label = 'Crow', value = menu128, description = 'ped' })
local ped22 = animalmenu:AddConfirm({ icon = '🙎‍', label = 'Deer', value = menu129, description = 'ped' })
local ped23 = animalmenu:AddConfirm({ icon = '🙎‍', label = 'Dolphin', value = menu130, description = 'ped' })
local ped24 = animalmenu:AddConfirm({ icon = '🙎‍', label = 'Fish', value = menu131, description = 'ped' })


local tp = menu:AddSlider({ icon = '📍', label = 'Teleports', value = m8, values = {
    { label = '🚔 Police Station', value = 1, description = '' },
    { label = '🏛️ Maze Bank', value = 2, description = '' },
    { label = '🚗 Parking', value = 4, description = '' },
    { label = '🏔️ Mont Chiliad', value = 5, description = '' },
	{ label = '🛠️ Benny\'s', value = 6, description = '' },
	{ label = '🍹 Unicorn', value = 7, description = '' },	
}})
tp:On('select', function(i, selectedValue)
  if (selectedValue == 1) then
ExecuteCommand("tp 424.3 -978.08 31.71")
  elseif (selectedValue == 2) then
ExecuteCommand("tp -73.83 -816.92 326.17")
  elseif (selectedValue == 4) then
ExecuteCommand("tp  244.59 -820.05 30.07")
  elseif (selectedValue == 5) then
ExecuteCommand("tp 442.58 5571.99 781.18")	
  elseif (selectedValue == 6) then
ExecuteCommand("tp -225.86 -1286.75 31.3 217.2")		
  elseif (selectedValue == 7) then
 ExecuteCommand("tp 143.66 -1308.21 29.18 71.54")	
  end 
end)

local menu_car = menu:AddButton({ icon = '🚗', label = 'Car', value = menu4, description = 'Categories Car' })
local spawncar = menu4:AddButton({ icon = '🚗', label = 'Spawn Car', value = m1, description = 'Spawn Car' })
local supercar = m1:AddSlider({ icon = '🏎️', label = 'Super', value = menu8402, values = {
    { label = 'adder', value = 1, description = '' },
    { label = 'cheetah', value = 2, description = '' },
    { label = 'cyclone', value = 4, description = '' },
    { label = 't20', value = 5, description = '' },
    { label = 'osiris', value = 6, description = '' },
    { label = 'fmj', value = 7, description = '' },	
    { label = 'entityxf', value = 8, description = '' },	
    { label = 'turismor', value = 9, description = '' },	
    { label = 'infernus', value = 10, description = '' },	
}})
supercar:On('select', function(i, selectedValue)
  if (selectedValue == 1) then
     ExecuteCommand("dv")
 ExecuteCommand("car adder")
  elseif (selectedValue == 2) then
     ExecuteCommand("dv")
 ExecuteCommand("car cheetah")
  elseif (selectedValue == 4) then
     ExecuteCommand("dv")
 ExecuteCommand("car cyclone")	
  elseif (selectedValue == 5) then
     ExecuteCommand("dv")
 ExecuteCommand("car t20")		
  elseif (selectedValue == 6) then
     ExecuteCommand("dv")
 ExecuteCommand("car osiris")		
  elseif (selectedValue == 7) then
     ExecuteCommand("dv")
 ExecuteCommand("car fmj")
  elseif (selectedValue == 8) then
     ExecuteCommand("dv")
 ExecuteCommand("car entityxf")	
  elseif (selectedValue == 9) then
     ExecuteCommand("dv")
 ExecuteCommand("car turismor")		
  elseif (selectedValue == 10) then
     ExecuteCommand("dv")
 ExecuteCommand("car infernus")		
  end 
end)
local sportclas = m1:AddSlider({ icon = '🚗', label = 'Sports / Classics', value = menu1842, values = {
    { label = 'alpha', value = 1, description = '' },
    { label = 'bestiagts', value = 2, description = '' },
    { label = 'coquette', value = 4, description = '' },
    { label = 'furoregt', value = 5, description = '' },
    { label = 'jester', value = 6, description = '' },
    { label = 'penumbra', value = 7, description = '' },	
    { label = 'pigalle', value = 8, description = '' },	
    { label = 'revolter', value = 9, description = '' },	
    { label = 'gt500', value = 10, description = '' },	
}})
sportclas:On('select', function(i, selectedValue)
  if (selectedValue == 1) then
   ExecuteCommand("dv")
 ExecuteCommand("car alpha")
  elseif (selectedValue == 2) then
  ExecuteCommand("dv")
 ExecuteCommand("car bestiagts")
  elseif (selectedValue == 4) then
     ExecuteCommand("dv")
 ExecuteCommand("car coquette")	
  elseif (selectedValue == 5) then
     ExecuteCommand("dv")
 ExecuteCommand("car furoregt")		
  elseif (selectedValue == 6) then
     ExecuteCommand("dv")
 ExecuteCommand("car jester")		
  elseif (selectedValue == 7) then
     ExecuteCommand("dv")
 ExecuteCommand("car penumbra")
  elseif (selectedValue == 8) then
     ExecuteCommand("dv")
 ExecuteCommand("car pigalle")	
  elseif (selectedValue == 9) then
     ExecuteCommand("dv")
 ExecuteCommand("car revolter")		
  elseif (selectedValue == 10) then
     ExecuteCommand("dv")
 ExecuteCommand("car gt500")
 
  end
end)
local sportclas = m1:AddSlider({ icon = '🚚', label = 'Off Road', value = menu1842, values = {
    { label = 'bfinjection', value = 1, description = '' },
    { label = 'bifta', value = 2, description = '' },
    { label = 'brawler', value = 4, description = '' },
    { label = 'dubsta3', value = 5, description = '' },
    { label = 'guardian', value = 6, description = '' },
    { label = 'monster', value = 7, description = '' },	
    { label = 'riata', value = 8, description = '' },	
    { label = 'trophytruck', value = 9, description = '' },	
    { label = 'rebel2', value = 10, description = '' },	
}})
sportclas:On('select', function(i, selectedValue)
  if (selectedValue == 1) then
     ExecuteCommand("dv")
 ExecuteCommand("car bfinjection")
  elseif (selectedValue == 2) then
     ExecuteCommand("dv")
 ExecuteCommand("car bifta")
  elseif (selectedValue == 4) then
     ExecuteCommand("dv")
 ExecuteCommand("car brawler")	
  elseif (selectedValue == 5) then
     ExecuteCommand("dv")
 ExecuteCommand("car dubsta3")		
  elseif (selectedValue == 6) then
  ExecuteCommand("dv")
 ExecuteCommand("car guardian")		
  elseif (selectedValue == 7) then
     ExecuteCommand("dv")
 ExecuteCommand("car monster")
  elseif (selectedValue == 8) then
     ExecuteCommand("dv")
 ExecuteCommand("car riata")	
  elseif (selectedValue == 9) then
     ExecuteCommand("dv")
 ExecuteCommand("car trophytruck")		
  elseif (selectedValue == 10) then
     ExecuteCommand("dv")
 ExecuteCommand("car rebel2")
 
  end
end)
local moto = m1:AddSlider({ icon = '🏍️', label = 'Bike', value = menu1842, values = {
    { label = 'sanchez', value = 1, description = '' },
    { label = 'manchez', value = 2, description = '' },
    { label = 'bati', value = 4, description = '' },
    { label = 'hakuchou', value = 6, description = '' },	
}})
moto:On('select', function(i, selectedValue)
  if (selectedValue == 1) then
     ExecuteCommand("dv")
 ExecuteCommand("car sanchez")
  elseif (selectedValue == 2) then
     ExecuteCommand("dv")
 ExecuteCommand("car manchez")
  elseif (selectedValue == 4) then
     ExecuteCommand("dv")
 ExecuteCommand("car bati")			
  elseif (selectedValue == 6) then
     ExecuteCommand("dv")
 ExecuteCommand("car hakuchou")		
  end
end)
local boostcar = menu4:AddCheckbox({ icon = '🛠️', label = 'Full Vehicle Boost', value = menu102, description = 'Full Vehicle Boostr' })
local plaquecar = menu4:AddCheckbox({ icon = '✏️', label = 'Change The Number Plate', value = menu103, description = 'Change The Number Plate' })
local admin_vehicle_repair = menu4:AddCheckbox({ icon = '🔧', label = 'Repair Vehicle', value = menu104, description = 'Repair Vehicle' })
local deletecar = menu4:AddCheckbox({ icon = '✂️', label = 'Delete Vehicle', value = menu185, description = 'Delete Vehicle' })
local colorcar = menu4:AddSlider({ icon = '🟢', label = 'Color', value = menu840, values = {
    { label = 'Red', value = 1, description = '' },
    { label = 'Green', value = 2, description = '' },
    { label = 'Black', value = 4, description = '' },
    { label = 'Purple', value = 5, description = '' },
    { label = 'White', value = 6, description = '' }
}})
colorcar:On('select', function(i, selectedValue)
  if (selectedValue == 1) then
                local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
                SetVehicleCustomPrimaryColour(vehicle, 255, 0, 0)
                SetVehicleCustomSecondaryColour(vehicle, 255, 0, 0)	
  elseif (selectedValue == 2) then
                local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
                SetVehicleCustomPrimaryColour(vehicle, 0, 255, 0)
                SetVehicleCustomSecondaryColour(vehicle, 0, 255, 0)	
  elseif (selectedValue == 4) then
                local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
                SetVehicleCustomPrimaryColour(vehicle, 0, 0, 0)
                SetVehicleCustomSecondaryColour(vehicle, 0, 0, 0)	
  elseif (selectedValue == 5) then
                local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
                SetVehicleCustomPrimaryColour(vehicle, 100, 0, 60)
                SetVehicleCustomSecondaryColour(vehicle, 100, 0, 60)	
  elseif (selectedValue == 6) then
                local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)				
                SetVehicleCustomPrimaryColour(vehicle, 255, 255, 255)
                SetVehicleCustomSecondaryColour(vehicle, 255, 255, 255)		
  end
end)
local neon = menu4:AddButton({ icon = '💡', label = 'Neon', value = menuneo, description = 'Neon' })
local neongive = menuneo:AddConfirm({ icon = '✔️', label = 'Active the Neon', value = menuneo1, description = 'Active the Neon' })
local colorneon = menuneo:AddSlider({ icon = '🟣', label = 'Color', value = menu800, values = {
    { label = 'Blue', value = 1, description = '' },
    { label = 'Green', value = 2, description = '' },
    { label = 'Red', value = 3, description = '' },
    { label = 'White', value = 4, description = '' },
    { label = 'Purple', value = 5, description = '' },
    { label = 'Black', value = 6, description = '' }
}})
colorneon:On('select', function(i, selectedValue)
  if (selectedValue == 1) then
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
    SetVehicleNeonLightsColour(vehicle, 0, 0, 255)
  elseif (selectedValue == 2) then
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
    SetVehicleNeonLightsColour(vehicle, 0, 255, 0)
  elseif (selectedValue == 3) then
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
    SetVehicleNeonLightsColour(vehicle, 255, 0, 0)
  elseif (selectedValue == 4) then
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
    SetVehicleNeonLightsColour(vehicle, 255, 255, 255)	
  elseif (selectedValue == 5) then
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
    SetVehicleNeonLightsColour(vehicle, 100, 0, 60)		
  elseif (selectedValue == 6) then
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
    SetVehicleNeonLightsColour(vehicle, 0, 0, 0)	
  end
end)
				
warnplayerh:On('check', function(i)
MenuV:CloseAll()
ExecuteCommand("bwh warnlist")
end)
warnplayer:On('check', function(i)
MenuV:CloseAll()
ExecuteCommand("bwh warn")
end)
banplayerh:On('check', function(i)
MenuV:CloseAll()
ExecuteCommand("bwh banlist")
end)
banplayer:On('check', function(i)
MenuV:CloseAll()
ExecuteCommand("bwh ban")
end)
reporthistory:On('check', function(i)
MenuV:CloseAll()
TriggerEvent('reports:history')
end)
reporthistory:On('uncheck', function(i)
  print('SP Admin Menu')
end)
tag:On('check', function(i)
ExecuteCommand("tag")
ESX.ShowNotification('Tag Staff : ~g~ON')
end)
tag:On('uncheck', function(i)
ExecuteCommand("tag")
ESX.ShowNotification('Tag Staff : ~r~OFF')
end)
keyped:On('check', function(i)
keyped()
end)
keyped:On('uncheck', function(i)
TriggerEvent('sp_admin:openMenuPlayerZero')
end)
markertp:On('select', function(item)
admin_tp_marker()
end)
checkstaff:On('check', function(i)
ExecuteCommand('admins')
end)

adminmode:On('confirm', function(item) ExecuteCommand('adminmode')	 end) 
adminmode:On('deny', function(item) ExecuteCommand('adminmode')	 end) 

toggleInfStamina:On('confirm', function(item) TriggerEvent('sp_admin:toggleInfStamina')	 end) 
toggleInfStamina:On('confirm', function(item) ESX.ShowNotification('Infinite Stamina : ~g~ON')	 end) 
toggleInfStamina:On('deny', function(item) TriggerEvent('sp_admin:toggleInfStamina')	 end) 
toggleInfStamina:On('deny', function(item) ESX.ShowNotification('Infinite Stamina : ~r~OFF')	 end) 
toggleInvisibility:On('confirm', function(item) TriggerEvent('sp_admin:toggleInvisibility')	 end) 
toggleInvisibility:On('confirm', function(item) ESX.ShowNotification('Invisibility : ~g~ON')	 end) 
toggleInvisibility:On('deny', function(item) TriggerEvent('sp_admin:toggleInvisibility')	 end) 
toggleInvisibility:On('deny', function(item) ESX.ShowNotification('Invisibility : ~r~OFF')	 end) 
toggleSuperJump:On('confirm', function(item) TriggerEvent('sp_admin:toggleSuperJump')	 end) 
toggleSuperJump:On('confirm', function(item) ESX.ShowNotification('Super Jump : ~g~ON')	 end) 
toggleSuperJump:On('deny', function(item) TriggerEvent('sp_admin:toggleSuperJump')	 end) 
toggleSuperJump:On('deny', function(item) ESX.ShowNotification('Super Jump : ~r~OFF')	 end) 
svmaxArmor:On('confirm', function(item) TriggerEvent('sp_admin:toggleFastSprint')	 end) 
svmaxArmor:On('confirm', function(item) ESX.ShowNotification('Fast Sprint : ~g~ON')	 end) 
svmaxArmor:On('deny', function(item) TriggerEvent('sp_admin:toggleFastSprint')	 end) 
svmaxArmor:On('deny', function(item) ESX.ShowNotification('Fast Sprint : ~r~OFF')	 end) 
toggleFastSwim:On('confirm', function(item) TriggerEvent('sp_admin:toggleFastSwim')	 end) 
toggleFastSwim:On('confirm', function(item) ESX.ShowNotification('Fast Swim : ~g~ON')	 end) 
toggleFastSwim:On('deny', function(item) TriggerEvent('sp_admin:toggleFastSwim')	 end) 
toggleFastSwim:On('deny', function(item) ESX.ShowNotification('Fast Swim : ~r~OFF')	 end)
neongive:On('confirm', function(item) neonon() end)
neongive:On('deny', function(item) neonoff() end)
nameplayer:On('confirm', function(item) TriggerEvent("staffTag", source, source)	 end) 
nameplayer:On('confirm', function(item) TriggerEvent("seeTags", source)	 end) 
nameplayer:On('deny', function(item) TriggerEvent("seeTags", source)	 end)
nameplayer:On('deny', function(item) TriggerEvent("staffTag", source, source)	 end)
blipsplayer:On('confirm', function(item) TriggerEvent('mostraBlipsonn', source)	 end)
blipsplayer:On('confirm', function(item) ESX.ShowNotification('Players Blips : ~g~ON') end) 
blipsplayer:On('deny', function(item) TriggerEvent('mostraBlipsofff', source)	 end)
blipsplayer:On('deny', function(item) ESX.ShowNotification('Players Blips : ~r~OFF') end) 
monkey:On('confirm', function(item) TriggerEvent('sp_admin:monkeyped') end)
monkey:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
stripper:On('confirm', function(item) TriggerEvent('sp_admin:stripper') end)
stripper:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
costume2:On('confirm', function(item) TriggerEvent('sp_admin:costume2') end)
costume2:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
costume3:On('confirm', function(item) TriggerEvent('sp_admin:costume3') end)
costume3:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
costume4:On('confirm', function(item) TriggerEvent('sp_admin:costume4') end)
costume4:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
costume5:On('confirm', function(item) TriggerEvent('sp_admin:costume5') end)
costume5:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
women1:On('confirm', function(item) TriggerEvent('sp_admin:women1') end)
women1:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
women2:On('confirm', function(item) TriggerEvent('sp_admin:women2') end)
women2:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
women4:On('confirm', function(item) TriggerEvent('sp_admin:women4') end)
women4:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
women5:On('confirm', function(item) TriggerEvent('sp_admin:women5') end)
women5:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)

women7:On('confirm', function(item) TriggerEvent('sp_admin:women7') end)
women7:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
women8:On('confirm', function(item) TriggerEvent('sp_admin:women8') end)
women8:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
women9:On('confirm', function(item) TriggerEvent('sp_admin:women9') end)
women9:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
women10:On('confirm', function(item) TriggerEvent('sp_admin:women10') end)
women10:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
women12:On('confirm', function(item) TriggerEvent('sp_admin:women12') end)
women12:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
women13:On('confirm', function(item) TriggerEvent('sp_admin:women13') end)
women13:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
women14:On('confirm', function(item) TriggerEvent('sp_admin:women14') end)
women14:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
women15:On('confirm', function(item) TriggerEvent('sp_admin:women15') end)
women15:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
women18:On('confirm', function(item) TriggerEvent('sp_admin:women18') end)
women18:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
women19:On('confirm', function(item) TriggerEvent('sp_admin:women19') end)
women19:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
women20:On('confirm', function(item) TriggerEvent('sp_admin:women20') end)
women20:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
women21:On('confirm', function(item) TriggerEvent('sp_admin:women21') end)
women21:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
women22:On('confirm', function(item) TriggerEvent('sp_admin:women22') end)
women22:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
women23:On('confirm', function(item) TriggerEvent('sp_admin:women23') end)
women23:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
women28:On('confirm', function(item) TriggerEvent('sp_admin:women28') end)
women28:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
women31:On('confirm', function(item) TriggerEvent('sp_admin:women31') end)
women31:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)

men1:On('confirm', function(item) TriggerEvent('sp_admin:men1') end)
men1:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
men2:On('confirm', function(item) TriggerEvent('sp_admin:men2') end)
men2:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
men3:On('confirm', function(item) TriggerEvent('sp_admin:men3') end)
men3:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
men4:On('confirm', function(item) TriggerEvent('sp_admin:men4') end)
men4:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
men5:On('confirm', function(item) TriggerEvent('sp_admin:men5') end)
men5:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
men6:On('confirm', function(item) TriggerEvent('sp_admin:men6') end)
men6:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
men7:On('confirm', function(item) TriggerEvent('sp_admin:men7') end)
men7:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
men8:On('confirm', function(item) TriggerEvent('sp_admin:men8') end)
men8:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
men9:On('confirm', function(item) TriggerEvent('sp_admin:men9') end)
men9:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
men10:On('confirm', function(item) TriggerEvent('sp_admin:men10') end)
men10:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
men11:On('confirm', function(item) TriggerEvent('sp_admin:men11') end)
men11:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
men12:On('confirm', function(item) TriggerEvent('sp_admin:men12') end)
men12:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
men13:On('confirm', function(item) TriggerEvent('sp_admin:men13') end)
men13:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
men14:On('confirm', function(item) TriggerEvent('sp_admin:men14') end)
men14:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
men15:On('confirm', function(item) TriggerEvent('sp_admin:men15') end)
men15:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
men16:On('confirm', function(item) TriggerEvent('sp_admin:men16') end)
men16:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
men17:On('confirm', function(item) TriggerEvent('sp_admin:men17') end)
men17:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
men18:On('confirm', function(item) TriggerEvent('sp_admin:men18') end)
men18:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
men19:On('confirm', function(item) TriggerEvent('sp_admin:men19') end)
men19:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
men20:On('confirm', function(item) TriggerEvent('sp_admin:men20') end)
men20:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
cosmonaut:On('confirm', function(item) TriggerEvent('sp_admin:cosmonaut') end)
cosmonaut:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
alien:On('confirm', function(item) TriggerEvent('sp_admin:alien') end)
alien:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
beach:On('confirm', function(item) TriggerEvent('sp_admin:beach') end)
beach:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
ped15:On('confirm', function(item) TriggerEvent('sp_admin:ped15') end)
ped15:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
ped16:On('confirm', function(item) TriggerEvent('sp_admin:ped16') end)
ped16:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
ped18:On('confirm', function(item) TriggerEvent('sp_admin:ped18') end)
ped18:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
ped19:On('confirm', function(item) TriggerEvent('sp_admin:ped19') end)
ped19:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
ped20:On('confirm', function(item) TriggerEvent('sp_admin:ped20') end)
ped20:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
ped21:On('confirm', function(item) TriggerEvent('sp_admin:ped21') end)
ped21:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
ped22:On('confirm', function(item) TriggerEvent('sp_admin:ped22') end)
ped22:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
ped23:On('confirm', function(item) TriggerEvent('sp_admin:ped23') end)
ped23:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
ped24:On('confirm', function(item) TriggerEvent('sp_admin:ped24') end)
ped24:On('deny', function(item) TriggerEvent('sp_admin:openMenuPlayerZero') end)
spec:On('confirm', function(item) TriggerEvent('esx_spectate:spectate') end)
spec:On('confirm', function(item) MenuV:CloseAll() end)
spec:On('deny', function(item) print('SP Admin Menu') end)
changer_skin:On('confirm', function(item) MenuV:CloseAll() end)
changer_skin:On('confirm', function(item) changer_skin() end) 
changer_skin:On('deny', function(item) print('SP Admin V2') end)
giveallweapon:On('confirm', function(item) TriggerServerEvent('sp_admin:giveweapon') end) 
giveallweapon:On('confirm', function(item) ESX.ShowNotification('~g~Give All Weapons : ~g~✔️') end) 
giveallweapon:On('deny', function(item) TriggerServerEvent('sp_admin:removeweapon') end)
giveallweapon:On('deny', function(item) ESX.ShowNotification('~r~Remove All Weapons : ~r~✔️') end) 
menu:On('switch', function(item, currentItem, prevItem) print(('YOU HAVE SWITCH THE ITEMS FROM %s TO %s'):format(prevItem.__type, currentItem.__type)) end)

noclipv2:On('check', function(i)
noclipv2()
ESX.ShowNotification('No Clip V2 : ~g~ON')
end)
noclipv2:On('uncheck', function(i)
noclipv2()
ESX.ShowNotification('No Clip V2 : ~r~OFF')
end)
deletecar:On('check', function(i)
	ExecuteCommand("dv")
end)
deletecar:On('uncheck', function(i)
  print('SP Admin Menu')
end)
admin_vehicle_repair:On('check', function(i)
	admin_vehicle_repair()
end)
admin_vehicle_repair:On('uncheck', function(i)
  print('SP Admin Menu')
end)
plaquecar:On('check', function(i)
	local newname = KeyboardInput('New 8 Characters Plate.', '', 8) 
    SetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), false) , newname)
end)
plaquecar:On('uncheck', function(i)
  print('SP Admin Menu')
end)


showcrosshair:On('check', function(i)
Admin.showcrosshair = not Admin.showcrosshair
end)
showcrosshair:On('uncheck', function(i)
Admin.showcrosshair = not Admin.showcrosshair
end)
playerslistof:On('check', function(i)
MenuV:CloseAll()
TriggerEvent('sp_admin:openlistjoueur')
end)
playerslistof:On('uncheck', function(i)
  print('SP Admin Menu')
end)


boostcar:On('check', function(i)
  FullVehicleBoost()
  ESX.ShowNotification('Full Boost : ~g~ON')
end)
boostcar:On('uncheck', function(i)
  print('SP Admin Menu')
end)
function getOnlinePlayers()
  local players = {}
  local me = PlayerId(-1)
  for i=0, maxPlayers, 1 do

    if NetworkIsPlayerConnected(i) then
      local playerName = GetPlayerName(i)
      local serverID = GetPlayerServerId(i)

      table.insert(players, {
        ['ped'] = GetPlayerPed(i),
        ['name'] = playerName,
        ['id'] = i,
        ['serverID'] = serverID,
      })
    end
  end
  return players
end
function admin_vehicle_repair()

    local ped = GetPlayerPed(-1)
    local car = GetVehiclePedIsUsing(ped)
	
		SetVehicleFixed(car)
		SetVehicleDirtLevel(car, 0.0)

end
function neonon()
			local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
                SetVehicleNeonLightEnabled(vehicle, 0, true)
                SetVehicleNeonLightEnabled(vehicle, 1, true)
                SetVehicleNeonLightEnabled(vehicle, 2, true)
                SetVehicleNeonLightEnabled(vehicle, 3, true)
end		
function neonoff()
			local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
                SetVehicleNeonLightEnabled(vehicle, 0, false)
                SetVehicleNeonLightEnabled(vehicle, 1, false)
                SetVehicleNeonLightEnabled(vehicle, 2, false)
                SetVehicleNeonLightEnabled(vehicle, 3, false)	
end				
function noclipv2()
            noclipActive = not noclipActive

            if IsPedInAnyVehicle(PlayerPedId(), false) then
                noclipEntity = GetVehiclePedIsIn(PlayerPedId(), false)
            else
                noclipEntity = PlayerPedId()
            end
            SetEntityCollision(noclipEntity, not noclipActive, not noclipActive)
            FreezeEntityPosition(noclipEntity, noclipActive)
            SetEntityInvincible(noclipEntity, noclipActive)
            SetVehicleRadioEnabled(noclipEntity, not noclipActive) 
end
   function FullVehicleBoost()
	if IsPedInAnyVehicle(PlayerPedId(), false) then
		local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
		SetVehicleModKit(vehicle, 0)
		SetVehicleMod(vehicle, 14, 0, true)
		SetVehicleNumberPlateTextIndex(vehicle, 5)
		ToggleVehicleMod(vehicle, 18, true)
		SetVehicleModColor_2(vehicle, 5, 0)
		SetVehicleExtraColours(vehicle, 111, 111)
		SetVehicleWindowTint(vehicle, 2)
		ToggleVehicleMod(vehicle, 22, true)
		SetVehicleMod(vehicle, 23, 11, false)
		SetVehicleMod(vehicle, 24, 11, false)
		SetVehicleWheelType(vehicle, 120)
		SetVehicleWindowTint(vehicle, 3)
		ToggleVehicleMod(vehicle, 20, true)
		SetVehicleTyreSmokeColor(vehicle, 0, 0, 0)
		LowerConvertibleRoof(vehicle, true)
		SetVehicleIsStolen(vehicle, false)
		SetVehicleIsWanted(vehicle, false)
		SetVehicleHasBeenOwnedByPlayer(vehicle, true)
		SetVehicleNeedsToBeHotwired(vehicle, false)
		SetCanResprayVehicle(vehicle, true)
		SetPlayersLastVehicle(vehicle)
		SetVehicleFixed(vehicle)
		SetVehicleDeformationFixed(vehicle)
		SetVehicleTyresCanBurst(vehicle, false)
		SetVehicleWheelsCanBreak(vehicle, false)
		SetVehicleCanBeTargetted(vehicle, false)
		SetVehicleExplodesOnHighExplosionDamage(vehicle, false)
		SetVehicleHasStrongAxles(vehicle, true)
		SetVehicleDirtLevel(vehicle, 0)
		SetVehicleCanBeVisiblyDamaged(vehicle, false)
		IsVehicleDriveable(vehicle, true)
		SetVehicleEngineOn(vehicle, true, true)
		SetVehicleStrong(vehicle, true)
		RollDownWindow(vehicle, 0)
		RollDownWindow(vehicle, 1)
		
		SetPedCanBeDraggedOut(PlayerPedId(), false)
		SetPedStayInVehicleWhenJacked(PlayerPedId(), true)
		SetPedRagdollOnCollision(PlayerPedId(), false)
		ResetPedVisibleDamage(PlayerPedId())
		ClearPedDecorations(PlayerPedId())
		SetIgnoreLowPriorityShockingEvents(PlayerPedId(), true)
	end
end
modo_showcoord:On('check', function(i)
  Admin.showcoords = not Admin.showcoords  
    notification("SP Life", "Administration", "Show Coords : ~g~ON")   
end)
modo_showcoord:On('uncheck', function(i)
  Admin.showcoords = not Admin.showcoords    
    notification("SP Life", "Administration", "Show Coords : ~r~OFF")  
end)
noclip:On('check', function(i)
  admin_no_clip()
  notification("SP Life", "Administration", "No Clip : ~g~ON")  
end)
noclip:On('uncheck', function(i)
  admin_no_clip()
  notification("SP Life", "Administration", "No Clip : ~r~OFF")
end)
godmode:On('check', function(i)
 Admin.godmode = not Admin.godmode
    if Admin.godmode then
    SetEntityInvincible(PlayerPedId(), true)
        notification("SP Life", "Administration", "GodMod : ~g~ON")  
    else
    SetEntityInvincible(PlayerPedId(), false)
    notification("SP Life", "Administration", "GodMod : ~r~OFF")
	end
end)
godmode:On('uncheck', function(i)
 Admin.godmode = not Admin.godmode
    if Admin.godmode then
    SetEntityInvincible(PlayerPedId(), true)
        notification("SP Life", "Administration", "GodMod : ~g~ON")  
    else
    SetEntityInvincible(PlayerPedId(), false)
    notification("SP Life", "Administration", "GodMod : ~r~OFF")
	end
end)
heal:On('check', function(i)
ExecuteCommand("heal")
 notification("SP Life", "Administration", "Heal : ~r~✔️")
end)
heal:On('uncheck', function(i)
print('SP Admin V2')	
end)
function changer_skin()
	TriggerEvent('esx_skin:openSaveableMenu', source)
   notification("SP Life", "Administration", "Change Bien ton skin p'tit coquin")
end
RegisterNetEvent('sp_admin:menuv')
AddEventHandler('sp_admin:menuv', function()
	menu()
end)
local noclip = false
local noclip_speed = 1.0
function admin_no_clip()
  noclip = not noclip
  local ped = GetPlayerPed(-1)
  if noclip then
    SetEntityInvincible(ped, true)
    SetEntityVisible(ped, false, false)
  else
    SetEntityInvincible(ped, false)
    SetEntityVisible(ped, true, false)
  end
end
function getPosition()
  local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
  return x,y,z
end
function getCamDirection()
  local heading = GetGameplayCamRelativeHeading()+GetEntityHeading(GetPlayerPed(-1))
  local pitch = GetGameplayCamRelativePitch()

  local x = -math.sin(heading*math.pi/180.0)
  local y = math.cos(heading*math.pi/180.0)
  local z = math.sin(pitch*math.pi/180.0)

  local len = math.sqrt(x*x+y*y+z*z)
  if len ~= 0 then
    x = x/len
    y = y/len
    z = z/len
  end

  return x,y,z
end
function isNoclip()
  return noclip
end
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if noclip then
      local ped = GetPlayerPed(-1)
      local x,y,z = getPosition()
      local dx,dy,dz = getCamDirection()
      local speed = noclip_speed


      SetEntityVelocity(ped, 0.0001, 0.0001, 0.0001)


      if IsControlPressed(0,32) then
        x = x+speed*dx
        y = y+speed*dy
        z = z+speed*dz
      end


      if IsControlPressed(0,269) then
        x = x-speed*dx
        y = y-speed*dy
        z = z-speed*dz
      end

      SetEntityCoordsNoOffset(ped,x,y,z,true,true,true)
    end
  end
end)
    Citizen.CreateThread(function()
    while true do
    	if Admin.showcoords then
            x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
            roundx=tonumber(string.format("%.2f",x))
            roundy=tonumber(string.format("%.2f",y))
            roundz=tonumber(string.format("%.2f",z))
            DrawTxt("~b~X:~s~ "..roundx,0.05,0.00)
            DrawTxt("     ~r~Y:~s~ "..roundy,0.11,0.00)
            DrawTxt("        ~g~Z:~s~ "..roundz,0.17,0.00)
            DrawTxt("              ~p~Heading:~s~ "..GetEntityHeading(PlayerPedId()),0.21,0.00)
        end
        if Admin.showcrosshair then
            DrawTxt('+', 0.495, 0.484, 1.0, 0.3, MainColor)
        end
    	Citizen.Wait(0)
    end
end)
function admin_give_money()
	DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
	inputmoney = 1
end
Citizen.CreateThread(function()
	while true do
		Wait(0)
		if inputmoney == 1 then
			if UpdateOnscreenKeyboard() == 3 then
				inputmoney = 0
			elseif UpdateOnscreenKeyboard() == 1 then
					inputmoney = 2
			elseif UpdateOnscreenKeyboard() == 2 then
				inputmoney = 0
			end
		end
		if inputmoney == 2 then
			local repMoney = GetOnscreenKeyboardResult()
			local money = tonumber(repMoney)
			
			TriggerServerEvent('sp_admin:giveCash', money)
			inputmoney = 0
		end
	end
end)
function admin_give_bank()
	DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
	inputmoneybank = 1
end
Citizen.CreateThread(function()
	while true do
		Wait(0)
		if inputmoneybank == 1 then
			if UpdateOnscreenKeyboard() == 3 then
				inputmoneybank = 0
			elseif UpdateOnscreenKeyboard() == 1 then
					inputmoneybank = 2
			elseif UpdateOnscreenKeyboard() == 2 then
				inputmoneybank = 0
			end
		end
		if inputmoneybank == 2 then
			local repMoney = GetOnscreenKeyboardResult()
			local money = tonumber(repMoney)
			
			TriggerServerEvent('sp_admin:giveBank', money)
			inputmoneybank = 0
		end
	end
end)
function admin_give_dirty()
	DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
	inputmoneydirty = 1
end
Citizen.CreateThread(function()
	while true do
		Wait(0)
		if inputmoneydirty == 1 then
			if UpdateOnscreenKeyboard() == 3 then
				inputmoneydirty = 0
			elseif UpdateOnscreenKeyboard() == 1 then
					inputmoneydirty = 2
			elseif UpdateOnscreenKeyboard() == 2 then
				inputmoneydirty = 0
			end
		end
		if inputmoneydirty == 2 then
			local repMoney = GetOnscreenKeyboardResult()
			local money = tonumber(repMoney)
			
			TriggerServerEvent('sp_admin:giveDirtyMoney', money)
			inputmoneydirty = 0
		end
	end
end)
function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)


	AddTextEntry('FMMC_KEY_TIP1', TextEntry)
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght)
	blockinput = true

	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
		Citizen.Wait(0)
	end
		
	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult()
		Citizen.Wait(500)
		blockinput = false
		return result
	else
		Citizen.Wait(500)
		blockinput = false
		return nil
	end
end

RegisterNetEvent('sp_admin:openMenuPlayerZero')
AddEventHandler('sp_admin:openMenuPlayerZero', function()
	openMenuPlayerZero()
end)

RegisterNetEvent('sp_admin:costume2')
AddEventHandler('sp_admin:costume2', function()
	costume2()
end)

RegisterNetEvent('sp_admin:costume3')
AddEventHandler('sp_admin:costume3', function()
	costume3()
end)

RegisterNetEvent('sp_admin:costume4')
AddEventHandler('sp_admin:costume4', function()
	costume4()
end)

RegisterNetEvent('sp_admin:costume5')
AddEventHandler('sp_admin:costume5', function()
	costume5()
end)

RegisterNetEvent('sp_admin:monkeyped')
AddEventHandler('sp_admin:monkeyped', function()
	monkeyped()
end)

RegisterNetEvent('sp_admin:eagle')
AddEventHandler('sp_admin:eagle', function()
	eagle()
end)

RegisterNetEvent('sp_admin:stripper')
AddEventHandler('sp_admin:stripper', function()
	stripper()
end)

RegisterNetEvent('sp_admin:women1')
AddEventHandler('sp_admin:women1', function()
	women1()
end)

RegisterNetEvent('sp_admin:women2')
AddEventHandler('sp_admin:women2', function()
	women2()
end)

RegisterNetEvent('sp_admin:women3')
AddEventHandler('sp_admin:women3', function()
	women3()
end)

RegisterNetEvent('sp_admin:women4')
AddEventHandler('sp_admin:women4', function()
	women4()
end)

RegisterNetEvent('sp_admin:women5')
AddEventHandler('sp_admin:women5', function()
	women5()
end)

RegisterNetEvent('sp_admin:women6')
AddEventHandler('sp_admin:women6', function()
	women6()
end)

RegisterNetEvent('sp_admin:women7')
AddEventHandler('sp_admin:women7', function()
	women7()
end)

RegisterNetEvent('sp_admin:women8')
AddEventHandler('sp_admin:women8', function()
	women8()
end)

RegisterNetEvent('sp_admin:women9')
AddEventHandler('sp_admin:women9', function()
	women9()
end)

RegisterNetEvent('sp_admin:women10')
AddEventHandler('sp_admin:women10', function()
	women10()
end)

RegisterNetEvent('sp_admin:women11')
AddEventHandler('sp_admin:women11', function()
	women11()
end)

RegisterNetEvent('sp_admin:women12')
AddEventHandler('sp_admin:women12', function()
	women12()
end)

RegisterNetEvent('sp_admin:women13')
AddEventHandler('sp_admin:women13', function()
	women13()
end)

RegisterNetEvent('sp_admin:women14')
AddEventHandler('sp_admin:women14', function()
	women14()
end)

RegisterNetEvent('sp_admin:women15')
AddEventHandler('sp_admin:women15', function()
	women15()
end)

RegisterNetEvent('sp_admin:women16')
AddEventHandler('sp_admin:women16', function()
	women16()
end)

RegisterNetEvent('sp_admin:women17')
AddEventHandler('sp_admin:women17', function()
	women17()
end)

RegisterNetEvent('sp_admin:women18')
AddEventHandler('sp_admin:women18', function()
	women18()
end)

RegisterNetEvent('sp_admin:women19')
AddEventHandler('sp_admin:women19', function()
	women19()
end)

RegisterNetEvent('sp_admin:women20')
AddEventHandler('sp_admin:women20', function()
	women20()
end)

RegisterNetEvent('sp_admin:women21')
AddEventHandler('sp_admin:women21', function()
	women21()
end)

RegisterNetEvent('sp_admin:women22')
AddEventHandler('sp_admin:women22', function()
	women22()
end)

RegisterNetEvent('sp_admin:women23')
AddEventHandler('sp_admin:women23', function()
	women23()
end)

RegisterNetEvent('sp_admin:women24')
AddEventHandler('sp_admin:women24', function()
	women24()
end)

RegisterNetEvent('sp_admin:women25')
AddEventHandler('sp_admin:women25', function()
	women25()
end)

RegisterNetEvent('sp_admin:women26')
AddEventHandler('sp_admin:women26', function()
	women26()
end)

RegisterNetEvent('sp_admin:women27')
AddEventHandler('sp_admin:women27', function()
	women27()
end)

RegisterNetEvent('sp_admin:women28')
AddEventHandler('sp_admin:women28', function()
	women28()
end)

RegisterNetEvent('sp_admin:women29')
AddEventHandler('sp_admin:women29', function()
	women29()
end)

RegisterNetEvent('sp_admin:women30')
AddEventHandler('sp_admin:women30', function()
	women30()
end)

RegisterNetEvent('sp_admin:women31')
AddEventHandler('sp_admin:women31', function()
	women31()
end)

RegisterNetEvent('sp_admin:women32')
AddEventHandler('sp_admin:women32', function()
	women32()
end)

RegisterNetEvent('sp_admin:women33')
AddEventHandler('sp_admin:women33', function()
	women33()
end)

RegisterNetEvent('sp_admin:women34')
AddEventHandler('sp_admin:women34', function()
	women34()
end)

RegisterNetEvent('sp_admin:women35')
AddEventHandler('sp_admin:women35', function()
	women35()
end)

RegisterNetEvent('sp_admin:women36')
AddEventHandler('sp_admin:women36', function()
	women36()
end)

RegisterNetEvent('sp_admin:women37')
AddEventHandler('sp_admin:women37', function()
	women37()
end)

RegisterNetEvent('sp_admin:women38')
AddEventHandler('sp_admin:women38', function()
	women38()
end)

RegisterNetEvent('sp_admin:women39')
AddEventHandler('sp_admin:women39', function()
	women39()
end)

RegisterNetEvent('sp_admin:women40')
AddEventHandler('sp_admin:women40', function()
	women40()
end)

RegisterNetEvent('sp_admin:men1')
AddEventHandler('sp_admin:men1', function()
	men1()
end)

RegisterNetEvent('sp_admin:men2')
AddEventHandler('sp_admin:men2', function()
	men2()
end)

RegisterNetEvent('sp_admin:men3')
AddEventHandler('sp_admin:men3', function()
	men3()
end)

RegisterNetEvent('sp_admin:men4')
AddEventHandler('sp_admin:men4', function()
	men4()
end)

RegisterNetEvent('sp_admin:men5')
AddEventHandler('sp_admin:men5', function()
	men5()
end)

RegisterNetEvent('sp_admin:men6')
AddEventHandler('sp_admin:men6', function()
	men6()
end)

RegisterNetEvent('sp_admin:men7')
AddEventHandler('sp_admin:men7', function()
	men7()
end)

RegisterNetEvent('sp_admin:men8')
AddEventHandler('sp_admin:men8', function()
	men8()
end)

RegisterNetEvent('sp_admin:men9')
AddEventHandler('sp_admin:men9', function()
	men9()
end)

RegisterNetEvent('sp_admin:men10')
AddEventHandler('sp_admin:men10', function()
	men10()
end)

RegisterNetEvent('sp_admin:men11')
AddEventHandler('sp_admin:men11', function()
	men11()
end)

RegisterNetEvent('sp_admin:men12')
AddEventHandler('sp_admin:men12', function()
	men12()
end)

RegisterNetEvent('sp_admin:men13')
AddEventHandler('sp_admin:men13', function()
	men13()
end)

RegisterNetEvent('sp_admin:men14')
AddEventHandler('sp_admin:men14', function()
	men14()
end)

RegisterNetEvent('sp_admin:men15')
AddEventHandler('sp_admin:men15', function()
	men15()
end)

RegisterNetEvent('sp_admin:men16')
AddEventHandler('sp_admin:men16', function()
	men16()
end)

RegisterNetEvent('sp_admin:men17')
AddEventHandler('sp_admin:men17', function()
	men17()
end)

RegisterNetEvent('sp_admin:men18')
AddEventHandler('sp_admin:men18', function()
	men18()
end)

RegisterNetEvent('sp_admin:men19')
AddEventHandler('sp_admin:men19', function()
	men19()
end)

RegisterNetEvent('sp_admin:men20')
AddEventHandler('sp_admin:men20', function()
	men20()
end)

RegisterNetEvent('sp_admin:cosmonaut')
AddEventHandler('sp_admin:cosmonaut', function()
	cosmonaut()
end)

RegisterNetEvent('sp_admin:alien')
AddEventHandler('sp_admin:alien', function()
	alien()
end)

RegisterNetEvent('sp_admin:alien')
AddEventHandler('sp_admin:alien', function()
	alien()
end)

RegisterNetEvent('sp_admin:beach')
AddEventHandler('sp_admin:beach', function()
	beach()
end)

RegisterNetEvent('sp_admin:ped15')
AddEventHandler('sp_admin:ped15', function()
	ped15()
end)

RegisterNetEvent('sp_admin:ped16')
AddEventHandler('sp_admin:ped16', function()
	ped16()
end)

RegisterNetEvent('sp_admin:ped18')
AddEventHandler('sp_admin:ped18', function()
	ped18()
end)

RegisterNetEvent('sp_admin:ped19')
AddEventHandler('sp_admin:ped19', function()
	ped19()
end)

RegisterNetEvent('sp_admin:ped20')
AddEventHandler('sp_admin:ped20', function()
	ped20()
end)

RegisterNetEvent('sp_admin:ped21')
AddEventHandler('sp_admin:ped21', function()
	ped21()
end)

RegisterNetEvent('sp_admin:ped22')
AddEventHandler('sp_admin:ped22', function()
	ped22()
end)

RegisterNetEvent('sp_admin:ped23')
AddEventHandler('sp_admin:ped23', function()
	ped23()
end)

RegisterNetEvent('sp_admin:ped24')
AddEventHandler('sp_admin:ped24', function()
	ped24()
end)

function openMenuPlayerZero()
                ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
                    local isMale = skin.sex == 0


                    TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
                        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                            TriggerEvent('skinchanger:loadSkin', skin)
                            TriggerEvent('esx:restoreLoadout')
                    end)
                    end)
                    end)
            end
			
function monkeyped()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_c_chimp')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end
function keyped()
                local j1 = PlayerId()
                local newped = KeyboardInput('u_m_y_proldriver_01 / u_m_y_staggrm_01 / u_m_m_streetart_01', '', 45)
                local p1 = GetHashKey(newped)
                RequestModel(p1)
                while not HasModelLoaded(p1) do
                  Wait(100)
                 end
                 SetPlayerModel(j1, p1)
                 SetModelAsNoLongerNeeded(p1)	
				 end
function eagle()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('mp_m_fibsec_01')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function stripper()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('csb_stripper_01')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function women1()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_f_m_bevhills_01')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function women2()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_f_m_bevhills_02')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function women3()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_f_m_bodybuild_01')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function women4()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_f_m_business_02')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function women5()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_f_m_downtown_01')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function women6()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_f_m_eastsa_01')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function women7()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_f_m_eastsa_02')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function women8()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_f_m_fatbla_01')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function women9()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_f_m_fatcult_01')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function women10()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_f_m_fatwhite_01')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function women11()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_f_m_ktown_01')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function women12()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_f_m_ktown_02')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function women13()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_f_m_prolhost_01')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function women14()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_f_m_salton_01')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function women15()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_f_m_skidrow_01')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function women16()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_f_m_soucent_01')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function women17()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_f_m_soucent_02')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function women18()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_f_m_soucentmc_01')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function women19()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_f_m_tourist_01')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function women20()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_f_m_tramp_01')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function women21()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_f_m_trampbeac_01')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function women22()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_f_o_genstreet_01')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function women23()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_f_o_indian_01')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function women24()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_f_o_ktown_01')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function women25()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_f_o_salton_01')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function women26()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_f_o_soucent_01')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function women27()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_f_o_soucent_02')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function women28()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_f_y_beach_01')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function women29()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_f_y_bevhills_01')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function women30()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_f_y_bevhills_02')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function women31()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_f_y_bevhills_03')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function women32()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_f_y_bevhills_04')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function women33()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_f_y_business_01')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function women34()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_f_y_business_02')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function women35()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_f_y_business_03')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function women36()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_f_y_business_04')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function women37()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_f_y_clubcust_01')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function women38()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_f_y_clubcust_02')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function women39()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_f_y_clubcust_03')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function women40()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_f_y_eastsa_01')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function men1()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_m_m_acult_01')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function men2()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_m_m_afriamer_01')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function men3()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_m_m_beach_01')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function men4()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_m_m_beach_02')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function men5()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_m_m_bevhills_01')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function men6()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_m_m_business_01')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function men7()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_m_m_eastsa_02')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function men8()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_m_m_farmer_01')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function men9()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_m_m_fatlatin_01')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function men10()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_m_m_genfat_01')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function men11()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_m_m_golfer_01')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function men12()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('g_m_y_ballaorig_01')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function men13()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('g_m_y_famca_01')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function men14()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('g_m_y_salvagoon_01')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function men15()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('g_m_m_chigoon_02')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function men16()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('ig_paper')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function men17()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('ig_popov')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function men18()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('ig_priest')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function men19()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('csb_talcc')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function men20()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('csb_money')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function cosmonaut()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('s_m_m_movspace_01')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function alien()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('s_m_m_movalien_01')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function costume2()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('u_m_y_juggernaut_01')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function costume3()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('u_m_y_pogo_01')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function costume4()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('u_m_y_rsranger_01')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function costume5()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('u_m_y_imporage')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function beach()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_f_m_beach_01')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function ped15()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_c_boar')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function ped16()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_c_cat_01')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function ped18()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_c_cormorant')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function ped19()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_c_cow')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function ped20()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_c_coyote')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function ped21()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_c_crow')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function ped22()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_c_deer')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function ped23()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_c_dolphin')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

function ped24()
		    local j1 = PlayerId()
    			local p1 = GetHashKey('a_c_fish')
    			RequestModel(p1)
    			while not HasModelLoaded(p1) do
      			  Wait(100)
   				 end
   				 SetPlayerModel(j1, p1)
   				 SetModelAsNoLongerNeeded(p1)
end

local radarEsteso = false
local mostrablip = false
local mostranomi = false

RegisterNetEvent('mostraBlipsonn')
AddEventHandler('mostraBlipsonn', function()
    mostrablip = not mostrablip
    if mostrablip then
        mostrablip = true

    end
end)

RegisterNetEvent('mostraBlipsofff')
AddEventHandler('mostraBlipsofff', function()
    mostrablip = not mostrablip
    if mostrablip then
        mostrablip = false

    end
end)

Citizen.CreateThread(function()
    while true do
    Wait(1)

    for i = 0, 255 do
        if NetworkIsPlayerActive(i) and GetPlayerPed(i) ~= GetPlayerPed(-1) then
            ped = GetPlayerPed(i)
            blip = GetBlipFromEntity(ped)

            idTesta = Citizen.InvokeNative(0xBFEFE3321A3F5015, ped, GetPlayerName(i), false, false, "", false)

            if mostranomi then
                Citizen.InvokeNative(0x63BB75ABEDC1F6A0, idTesta, 0, true)

                if NetworkIsPlayerTalking(i) then
                    Citizen.InvokeNative(0x63BB75ABEDC1F6A0, idTesta, 9, true)
                else
                    Citizen.InvokeNative(0x63BB75ABEDC1F6A0, idTesta, 9, false)
                end
            else
                Citizen.InvokeNative(0x63BB75ABEDC1F6A0, idTesta, 9, false)
                Citizen.InvokeNative(0x63BB75ABEDC1F6A0, idTesta, 0, false)
            end

            if mostrablip then
                if not DoesBlipExist(blip) then
                    blip = AddBlipForEntity(ped)
                    SetBlipSprite(blip, 1)
                    Citizen.InvokeNative(0x5FBCA48327B914DF, blip, true)
                else
                    veh = GetVehiclePedIsIn(ped, false)
                    blipSprite = GetBlipSprite(blip)
                    if not GetEntityHealth(ped) then
                        if blipSprite ~= 274 then
                            SetBlipSprite(blip, 274)
                            Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                        end
                    elseif veh then
                        calsseVeicolo = GetVehicleClass(veh)
                        modelloVeicolo = GetEntityModel(veh)
                        if calsseVeicolo == 15 then
                            if blipSprite ~= 422 then
                                SetBlipSprite(blip, 422)
                                Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                            end
                        elseif calsseVeicolo == 16 then
                            if modelloVeicolo == GetHashKey("besra") or modelloVeicolo == GetHashKey("hydra") or modelloVeicolo == GetHashKey("lazer") then
                                if blipSprite ~= 424 then
                                    SetBlipSprite(blip, 424)
                                    Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                end
                            elseif blipSprite ~= 423 then
                                SetBlipSprite(blip, 423)
                                Citizen.InvokeNative (0x5FBCA48327B914DF, blip, false)
                            end
                        elseif calsseVeicolo == 14 then
                            if blipSprite ~= 427 then
                                SetBlipSprite(blip, 427)
                                Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                            end
                        elseif modelloVeicolo == GetHashKey("insurgent") or modelloVeicolo == GetHashKey("insurgent2") or modelloVeicolo == GetHashKey("limo2") then
                                if blipSprite ~= 426 then
                                    SetBlipSprite(blip, 426)
                                    Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                end
                            elseif modelloVeicolo == GetHashKey("rhino") then
                                if blipSprite ~= 421 then
                                    SetBlipSprite(blip, 421)
                                    Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                end
                            elseif blipSprite ~= 1 then
                                SetBlipSprite(blip, 1)
                                Citizen.InvokeNative(0x5FBCA48327B914DF, blip, true)
                            end

                            passengers = GetVehicleNumberOfPassengers(veh)
                            if passengers then
                                if not IsVehicleSeatFree(veh, -1) then
                                    passengers = passengers + 1
                                end
                                ShowNumberOnBlip(blip, passengers)
                            else
                                HideNumberOnBlip(blip)
                            end
                        else

                            HideNumberOnBlip(blip)
                            if blipSprite ~= 1 then
                                SetBlipSprite(blip, 1)
                                Citizen.InvokeNative(0x5FBCA48327B914DF, blip, true)
                            end
                        end
                        SetBlipRotation(blip, math.ceil(GetEntityHeading(veh)))
                        SetBlipNameToPlayerName(blip, i)
                        SetBlipScale(blip, 0.85)

                        if IsPauseMenuActive() then
                            SetBlipAlpha(blip, 255)
                        else
                            x1, y1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
                            x2, y2 = table.unpack(GetEntityCoords(GetPlayerPed(i), true))
                            distanza = (math.floor(math.abs(math.sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))) / -1)) + 900

                            if distanza < 0 then
                                distanza = 0
                            elseif distanza > 255 then
                                distanza = 255
                            end
                            SetBlipAlpha(blip, distanza)
                        end
                    end
                else
                    RemoveBlip(blip)
                end
            end
        end
    end
end)
Citizen.CreateThread(function()

  while true do
    Citizen.Wait(0)

    if infStamina then
      RestorePlayerStamina(source, 1.0)
    end

    if neverWanted then
        SetPlayerWantedLevel(PlayerId(), 0, false)
        SetPlayerWantedLevelNow(PlayerId(), false)
    end

    if superJump then
      SetSuperJumpThisFrame(PlayerId())
    end
  end

end)
RegisterNetEvent("sp_admin:toggleInfStamina")
AddEventHandler("sp_admin:toggleInfStamina", function()
  infStamina = not infStamina
  if infStamina then
  else
  end
end)
RegisterNetEvent("sp_admin:toggleInvisibility")
AddEventHandler("sp_admin:toggleInvisibility", function()
  invisibility = not invisibility
  SetEntityVisible(GetPlayerPed(-1), not invisibility, 0)
  SetForcePedFootstepsTracks(invisibility)
  if invisibility then
    drawNotification("~b~Invisibility activated")
  else
    drawNotification("~r~Invisibility deactivated")
  end
end) 
RegisterNetEvent("sp_admin:toggleFastSprint")
AddEventHandler("sp_admin:toggleFastSprint", function()
  fastSprint = not fastSprint
  if fastSprint then
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.49)
  else
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
  end
end)
RegisterNetEvent("sp_admin:toggleSuperJump")
AddEventHandler("sp_admin:toggleSuperJump", function()
  superJump = not superJump
  if superJump then
  else
  end
end)
RegisterNetEvent("sp_admin:toggleFastSwim")
AddEventHandler("sp_admin:toggleFastSwim", function()
  fastSwim = not fastSwim
  if fastSwim then
    SetSwimMultiplierForPlayer(PlayerId(), 1.49)
  else
    SetSwimMultiplierForPlayer(PlayerId(), 1.0)
  end
end)
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)

    if fireAmmo then
      SetFireAmmoThisFrame(PlayerId())
    end
  end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)

    if oneShotKill then
      if IsPlayerFreeAiming(PlayerId()) then
        local entity = getEntity(PlayerId())
        if IsPedShooting(GetPlayerPed(-1)) then
          if IsEntityAVehicle(entity) then
            Citizen.Trace("veh")
            NetworkExplodeVehicle(entity, true, true, 0)
          end
        end
      end
    end
  end
end)

Citizen.CreateThread(function() -- Explosive Ammo
  while true do
    Citizen.Wait(0)

    if explossiveAmmo then
      SetExplosiveAmmoThisFrame(PlayerId())
      local x,y,z = table.unpack(bulletCoords())
      if x ~= 0 and y ~= 0 and z ~= 0 then
        AddOwnedExplosion(GetPlayerPed(-1), x, y, z, explosionType, 20.0, true, false, 0.0)
      end
    end
  end
end)

Citizen.CreateThread(function() -- INFINITE Ammo
  while true do
    Citizen.Wait(0)

    if infiniteAmmo then
      SetPedInfiniteAmmo(GetPlayerPed(-1), true)
			SetPedInfiniteAmmoClip(GetPlayerPed(-1), true)
			SetPedAmmo(GetPlayerPed(-1), (GetSelectedPedWeapon(GetPlayerPed(-1))), 99999)
    else
      SetPedInfiniteAmmo(GetPlayerPed(-1), false)
			SetPedInfiniteAmmoClip(GetPlayerPed(-1), false)
    end
  end
end)

Citizen.CreateThread(function() -- Teleport Gun
  while true do
    Citizen.Wait(0)

    if teleportGun then
      local x,y,z = table.unpack(bulletCoords())
      if x ~= 0 and y ~= 0 and z ~= 0 then
        SetEntityCoords(GetPlayerPed(-1), x,y,z)
      end
    end
  end
end)

Citizen.CreateThread(function() -- Vehicle Gun
  while true do
    Citizen.Wait(0)

    if vehicleGun then
      if not IsPedInAnyVehicle(GetPlayerPed(-1), true) then
        if IsPedShooting(GetPlayerPed(-1)) then
          while not HasModelLoaded(GetHashKey(vehicleGunVehicle)) do
						Citizen.Wait(0)
						RequestModel(GetHashKey(vehicleGunVehicle))
          end
          local playerPos = GetEntityCoords(GetPlayerPed(-1), true)
          local veh =  CreateVehicle(GetHashKey(vehicleGunVehicle), playerPos.x + (10 * GetEntityForwardX(GetPlayerPed(-1))), playerPos.y + (10 * GetEntityForwardY(GetPlayerPed(-1))), getGroundZ(playerPos.x + (10 * GetEntityForwardX(GetPlayerPed(-1))), playerPos.y + (10 * GetEntityForwardY(GetPlayerPed(-1))), playerPos.z + 5), GetEntityHeading(GetPlayerPed(-1)), true, true)
          SetEntityAsNoLongerNeeded(veh)
          SetVehicleForwardSpeed(veh, 150.0)
        end
      end
    end
  end
end)

Citizen.CreateThread(function() --Whale Gun
	while true do
		Citizen.Wait(0)

		if whaleGun then
			local playerPedPos = GetEntityCoords(GetPlayerPed(-1), true)
			if (IsPedInAnyVehicle(GetPlayerPed(-1), true) == false) then
				if IsPedShooting(GetPlayerPed(-1)) then
					if not HasModelLoaded(GetHashKey("a_c_humpback")) then
						RequestModel(GetHashKey("a_c_humpback"))
						while not HasModelLoaded(GetHashKey("a_c_humpback")) do
							Citizen.Wait(0)
						end
					end
					local whale = CreatePed(28, GetHashKey("a_c_humpback"), playerPedPos.x + (10 * GetEntityForwardX(GetPlayerPed(-1))), playerPedPos.y + (10 * GetEntityForwardY(GetPlayerPed(-1))), playerPedPos.z, GetEntityHeading(GetPlayerPed(-1)), true, true)
					SetEntityAsNoLongerNeeded(whale)
					ApplyForceToEntity(whale, 1, GetEntityForwardX(whale) * 1000, GetEntityForwardY(whale) * 1000, 0.0, 0.0, 0.0, 0.0, 1, false, true, true, true, true)
				end
			end
		end
	end
end)
 Citizen.CreateThread(function()
	while true do
		if Admin.showName then
			for k, v in ipairs(ESX.Game.GetPlayers()) do
				local otherPed = GetPlayerPed(v)

				if otherPed ~= plyPed then
					if #(GetEntityCoords(plyPed, false) - GetEntityCoords(otherPed, false)) < 5000.0 then
						Admin.gamerTags[v] = CreateFakeMpGamerTag(otherPed, ('[%s] %s'):format(GetPlayerServerId(v), GetPlayerName(v)), false, false, '', 0)
					else
						RemoveMpGamerTag(Admin.gamerTags[v])
						Admin.gamerTags[v] = nil
					end
				end
			end
		end

		Citizen.Wait(100)
	end
end)

function notification(title, subject, msg)

  local mugshot, mugshotStr = ESX.Game.GetPedMugshot(GetPlayerPed(-1))
  
  ESX.ShowAdvancedNotification(title, subject, msg, mugshotStr, 1)
  
  UnregisterPedheadshot(mugshot)
  
end

 function admin_tp_marker()
  local WaypointHandle = GetFirstBlipInfoId(8)

  if DoesBlipExist(WaypointHandle) then
    local waypointCoords = GetBlipInfoIdCoord(WaypointHandle)

    for height = 1, 1000 do
      SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

      local foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords["x"], waypointCoords["y"], height + 0.0)

      if foundGround then
        SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

        break
      end

      Citizen.Wait(0)
    end

    notification("Téléportation", "Administration", "Téléportation ~g~Effectuée")
  else
    notification("Téléportation", "Administration", "Aucun ~r~Marqueur")
  end
end
