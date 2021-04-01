local modName, core = ...
core.Main = {}

local Config = core.Config
local Helper = core.Helper
local Cache = core.Cache
local Main = core.Main

local function isAchievementValid(id)
    local categoryId = GetAchievementCategory(id)
    local categoryNum = GetCategoryNumAchievements(categoryId)
    for j = 1, categoryNum do
        local categoryAchievementId = GetAchievementInfo(categoryId, j)
        if (not categoryAchievementId) then
            return false
        end
        if (id == categoryAchievementId) then
            return true
        else
            local nextID = GetNextAchievement(categoryAchievementId)
            if (id == nextID) then
                return true
            end
            while (nextID) do
                if (id == nextID) then
                    return true
                end
                nextID = GetNextAchievement(nextID)
            end
        end
    end
    return false
end

local function validateAchivements(achievementIds)
    Helper:PrintDefault("Start achievements validation")

    local validAchievements, nonValidAchievements = {}, {}

    for key, value in pairs(achievementIds) do
        if isAchievementValid(value) then
            table.insert(validAchievements, value)
        else
            table.insert(nonValidAchievements, value)
        end
    end

    Helper:PrintDefault("Found " .. #validAchievements .. " valid achievements")
    Helper:PrintDefault("Found " .. #nonValidAchievements .. " nonvalid achievements")
    return validAchievements, nonValidAchievements
end

local function updateCache()
    local achievementIds = Cache:GetRewards(true)
    local validAchievementsIds, nonValidAchievementsIds = validateAchivements(achievementIds)
    Cache:SetValid(validAchievementsIds)
    Cache:SetNonValid(nonValidAchievementsIds)
    Cache:ResetFilters()
end

function Main:InitCache()
    if ((not Cache:GetValid()) or (not Cache:GetNonValid())) then
        updateCache()
    end
end

function Main:UpdateCache()
    updateCache()
end

local function printLink(id)
    Helper:Print(GetAchievementLink(id))
end

function Main:ShowRewardAchievements()
    Helper:ForEach(Cache:GetRewards(), printLink)
end

function Main:ShowRewardAchievementsByType(typeOfReward)
    if typeOfReward == "mount" then
        Helper:ForEach(Cache:GetMounts(), printLink)
    end
end

function Main:Test()
    print("test")
end
