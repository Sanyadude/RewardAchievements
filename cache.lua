local modName, core = ...
core.Cache = {}

local Config = core.Config
local Helper = core.Helper
local Data = core.Data
local Cache = core.Cache

local VALID_KEY = Config.DB_KEYS.VALID
local NONVALID_KEY = Config.DB_KEYS.NONVALID

local REWARDS_KEY = Config.DB_KEYS.REWARDS
local MOUNTS_KEY = Config.DB_KEYS.MOUNTS
local PETS_KEY = Config.DB_KEYS.PETS
local TITLES_KEY = Config.DB_KEYS.TITLES
local TOYS_KEY = Config.DB_KEYS.TOYS
local OTHER_KEY = Config.DB_KEYS.OTHER

RewardAchievements_Cache = {}
local FILTERED_DATA_KEY = "FILTERED_DATA_KEYS"
RewardAchievements_Cache[FILTERED_DATA_KEY] = {}

local function filterValidCache(ids, key)
    if (RewardAchievements_Cache[FILTERED_DATA_KEY][key]) then
        return ids
    end
    local validIds = Cache:GetValid()
    if (not validIds) then
        return ids
    end
    local validHash = {}
    for i = 1, #validIds do
        validHash[validIds[i]] = true
    end
    local filtered = {}
    for i = 1, #ids do
        local id = ids[i]
        if (validHash[id]) then
            table.insert(filtered, id)
        end
    end
    Helper:Log("Save cache for key - " .. key)
    Cache:Set(key, filtered)
    RewardAchievements_Cache[FILTERED_DATA_KEY][key] = true
    return filtered
end

function Cache:ResetFilters()
    RewardAchievements_Cache[FILTERED_DATA_KEY] = {}
end

function Cache:Get(key, sourceFunc)
    if (RewardAchievements_Cache[key]) then
        return RewardAchievements_Cache[key]
    end

    if (type(sourceFunc) == "function") then
        local value = sourceFunc()
        Cache:Set(key, value)
        return value
    end

    return nil
end

function Cache:Set(key, value)
    RewardAchievements_Cache[FILTERED_DATA_KEY][key] = false
    RewardAchievements_Cache[key] = value
end

-- rewards
function Cache:GetRewards(ignoreCache)
    if (ignoreCache) then
        return Data:GetRewards()
    end
    local result = Cache:Get(REWARDS_KEY, Data.GetRewards)
    local filtered = filterValidCache(result, REWARDS_KEY)
    return filtered
end

function Cache:SetRewards(value)
    Cache:Set(REWARDS_KEY, value)
end

-- mounts
function Cache:GetMounts()
    local result = Cache:Get(MOUNTS_KEY, Data.GetMounts)
    local filtered = filterValidCache(result, MOUNTS_KEY)
    return filtered
end

function Cache:SetMounts(value)
    Cache:Set(MOUNTS_KEY, value)
end

-- nonvalid
function Cache:GetNonValid()
    return Cache:Get(NONVALID_KEY)
end

function Cache:SetNonValid(value)
    Cache:Set(NONVALID_KEY, value)
end

-- valid
function Cache:GetValid()
    return Cache:Get(VALID_KEY)
end

function Cache:SetValid(value)
    Cache:Set(VALID_KEY, value)
end

-- pets
function Cache:GetPets()
    local result = Cache:Get(PETS_KEY, Data.GetPets)
    local filtered = filterValidCache(result, PETS_KEY)
    return filtered
end

function Cache:SetPets(value)
    Cache:Set(PETS_KEY, value)
end

-- titles
function Cache:GetTitles()
    local result = Cache:Get(TITLES_KEY, Data.GetTitles)
    local filtered = filterValidCache(result, TITLES_KEY)
    return filtered
end

function Cache:SetTitles(value)
    Cache:Set(TITLES_KEY, value)
end

-- toys
function Cache:GetToys()
    local result = Cache:Get(TOYS_KEY, Data.GetToys)
    local filtered = filterValidCache(result, TOYS_KEY)
    return filtered
end

function Cache:SetToys(value)
    Cache:Set(TOYS_KEY, value)
end

-- other
function Cache:GetOther()
    local result = Cache:Get(OTHER_KEY, Data.GetOther)
    local filtered = filterValidCache(result, OTHER_KEY)
    return filtered
end

function Cache:SetOther(value)
    Cache:Set(OTHER_KEY, value)
end

function Cache:GenerateOther()
    local all = Data:GetRewards()
    local mounts = Data:GetMounts()
    local titles = Data:GetTitles()
    local pets = Data:GetPets()
    local toys = Data:GetToys()

    local hash = {}
    for i = 1, #mounts do
        hash[mounts[i]] = true
    end
    for i = 1, #titles do
        hash[titles[i]] = true
    end
    for i = 1, #pets do
        hash[pets[i]] = true
    end
    for i = 1, #toys do
        hash[toys[i]] = true
    end
    local filtered = {}
    for i = 1, #all do
        local id = all[i]
        if (not hash[id]) then
            table.insert(filtered, id)
        end
    end
    return filtered
end
