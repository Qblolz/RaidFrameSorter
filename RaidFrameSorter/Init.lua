local AddonName, AddonVars = ...
local Addon = LibStub("AceAddon-3.0"):NewAddon(AddonName, "AceEvent-3.0")
_G[AddonName] = Addon

local globals = AddonVars.globals
local InterfaceOptionsFrame_OpenToCategory = globals.InterfaceOptionsFrame_OpenToCategory
local SlashCmdList = globals.SlashCmdList

function Addon:OnInitialize()
    self:SetupOptions()
    self:RegisterEvent("PLAYER_REGEN_ENABLED", "ApplySort")
    self:RegisterEvent("PARTY_MEMBERS_CHANGED", "ApplySort")
    --self:RegisterEvent("PLAYER_ENTERING_WORLD", "ApplySort")

    hooksecurefunc("CompactUnitFrameProfiles_ActivateRaidProfile", self.ApplySort)
end

_G["SLASH_" .. AddonName .. "1"] = '/rfs'

SlashCmdList[AddonName] = function(msg)
    InterfaceOptionsFrame_OpenToCategory(AddonName)
    InterfaceOptionsFrame_OpenToCategory(AddonName)
end
