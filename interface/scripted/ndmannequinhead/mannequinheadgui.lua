function init()
  self.functionalSlots = {
    head = {slot = 1, validType = "headarmor"}
  }

  self.cosmeticSlots = {
    headCosmetic = {slot = 1, validType = "headarmor"}
  }
end

function swapGender()
  world.sendEntityMessage(pane.containerEntityId(), "swapGender")
end

function equipFunctional()
  equip(self.functionalSlots)
end

function equipCosmetic()
  equip(self.cosmeticSlots)
end

function equip(slotMap)
  local contents = widget.itemGridItems("itemGrid")
  for slotName, slotConfig in pairs(slotMap) do
    local item = contents[slotConfig.slot]
    if item == nil or root.itemType(item.name) == slotConfig.validType then
      world.containerSwapItems(pane.containerEntityId(), player.equippedItem(slotName), slotConfig.slot - 1)
      player.setEquippedItem(slotName, item)
    end
  end
end
