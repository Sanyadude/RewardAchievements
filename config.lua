local modName, core = ...
core.Config = {}

local Config = core.Config

Config.colors = {
    printColorAddonNameRGB = "FF0000",
    printColorTextRGB = "FFFF00",
    printColorAddonSlashCommandRGB = "00CC66"
}

Config.DB_KEYS = {
    ALL = "ALL",
    NONVALID = "NONVALID",
    VALID = "VALID",
    REWARDS = "REWARDS",
    MOUNTS = "MOUNTS",
    PETS = "PETS",
    TITLES = "TITLES",
    TOYS = "TOYS",
    OTHER = "OTHER"
}

Config.maxAchievementId = 14924

Config.log = false
Config.useAddonNameAsTabName = false