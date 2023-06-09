fx_version 'cerulean'
games {'gta5'}

shared_scripts { "shared/*.lua" }

client_scripts {
    "libs/RMenu.lua",
    "libs/menu/RageUI.lua",
    "libs/menu/Menu.lua",
    "libs/menu/MenuController.lua",
    "libs/components/*.lua",
    "libs/menu/elements/*.lua",
    "libs/menu/items/*.lua",
    "libs/menu/panels/*.lua",
    "libs/menu/windows/*.lua",

    "client/*.lua",
}

server_scripts {
    "server/*.lua",
}

--- Xed#1188 | https://discord.gg/HvfAsbgVpM