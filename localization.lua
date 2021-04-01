local modName, core = ...
core.Localization = {}

local Localization = core.Localization

local localizedStrings = {}

-- to add new locale support copy paste + translate values
localizedStrings["enUS"] = {
    ADDON_TAB_TEXT = "Rewards",
    ACHIEVEMENT_TITLE_STRING = "title",
    --Commands
    LIST_OF_COMMANDS = "List of available commands",
    PRINT_REWARD_ACHIEVEMENTS = " - print achievements with reward",
    PRINT_MOUNT_ACHIEVEMENTS = " - print achievements with mounts as reward",
    UPDATE_ACHIEVEMENTS_INFORMATION = " - update achievements information",
    TOGGLE_LOG = " - toggle log",
    PRINT_HELP = " - print available commands",
    ENABLED = "enabled",
    DISABLED = "disabled",
    LOG = "Log",
    UPDATE_STARTED = "Update started...",
    UPDATE_FINISHED = "Achievements updated",
    LIST_OF_REWARD_ACHIEVEMENTS = "List of achievements with rewards",
    LIST_OF_MOUNT_ACHIEVEMENTS = "List of achievements with mounts as reward",
    --UI
    LEFT_PANEL_REWARD_BUTTON_TEXT = "Rewards",
    LEFT_PANEL_MOUNT_BUTTON_TEXT = "Mounts",
    LEFT_PANEL_PET_BUTTON_TEXT = "Pets",
    LEFT_PANEL_TITLE_BUTTON_TEXT = "Titles",
    LEFT_PANEL_TOY_BUTTON_TEXT = "Toys",
    LEFT_PANEL_OTHER_BUTTON_TEXT = "Other",
    LEFT_PANEL_NONVALID_BUTTON_TEXT = "Nonvalid"
}

localizedStrings["ruRU"] = {
    ADDON_TAB_TEXT = "Награды",
    ACHIEVEMENT_TITLE_STRING = "звание",
    --Commands
    LIST_OF_COMMANDS = "Список доступных команд",
    PRINT_REWARD_ACHIEVEMENTS = " - показать достижения с наградами",
    PRINT_MOUNT_ACHIEVEMENTS = " - показать достижения с транспортом в награду",
    UPDATE_ACHIEVEMENTS_INFORMATION = " - обновить информацию о достижениях",
    TOGGLE_LOG = " - вкл/выкл логирование",
    PRINT_HELP = " - показать список доступных команд",
    ENABLED = "включено",
    DISABLED = "выключено",
    LOG = "Логирование",
    UPDATE_STARTED = "Начало обновление...",
    UPDATE_FINISHED = "Достижения обновлены",
    LIST_OF_REWARD_ACHIEVEMENTS = "Список достижений с наградами",
    LIST_OF_MOUNT_ACHIEVEMENTS = "Список достижений с транспортом в награду",
    --UI
    LEFT_PANEL_REWARD_BUTTON_TEXT = "Награды",
    LEFT_PANEL_MOUNT_BUTTON_TEXT = "Транспорт",
    LEFT_PANEL_PET_BUTTON_TEXT = "Питомцы",
    LEFT_PANEL_TITLE_BUTTON_TEXT = "Звания",
    LEFT_PANEL_TOY_BUTTON_TEXT = "Игрушки",
    LEFT_PANEL_OTHER_BUTTON_TEXT = "Другое",
    LEFT_PANEL_NONVALID_BUTTON_TEXT = "Недоступные"
}

local locale = GetLocale()
local localeKey = localizedStrings[locale] ~= nil and locale or "enUS" -- eng as default

core.Localization = localizedStrings[localeKey] --choose locale strings