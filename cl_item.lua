local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX              = nil
local PlayerData = {}
local ped = PlayerPedId()
local mainMenu = false


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer   
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)



local machines = {
  992069095,
  -654402915
}




exports['qtarget']:AddTargetModel(machines, {
	options = {
		{
			event = "curse-vending1",
			icon = "fas fa-hands",
			label = "Buy A Cola",
		},
		{
			event = "curse-vending2",
			icon = "fas fa-hands",
			label = "Buy A Gatorade",	
		},
	},
	distance = 2.5,
})

RegisterNetEvent('curse-vending1', function()
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 1,
            header = "Buy A Cola",
            txt = ""
        },
        {
            id = 2,
            header = "Buy A Cola($15)",
            txt = "This will purchase a cola",
            params = {
                event = "cola1",
                args = {
                    number = 1,
                    id = 2
                }
            }
        },
    })
end)

RegisterNetEvent('curse-vending2', function()
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 1,
            header = "Buy A Gatorade",
            txt = ""
        },
        {
            id = 2,
            header = "Blue Gatorade",
            txt = "$30",
            params = {
                event = "gatorb",
                args = {
                    number = 1,
                    id = 2
                }
            }
        },
		{
            id = 3,
            header = "Yellow Gatorade",
            txt = "$30",
            params = {
                event = "gatory",
                args = {
                    number = 1,
                    id = 2
                }
            }
        },
    })
end)


AddEventHandler('cola1', function ()
	TriggerServerEvent('curse-givecola', ped)
end)

AddEventHandler('gatorb', function ()
	TriggerServerEvent('curse-givegatorb', ped)
end)

AddEventHandler('gatory', function ()
	TriggerServerEvent('curse-givegatory', ped)
end)