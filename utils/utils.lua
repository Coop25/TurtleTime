function cleanScreen()
    term.clear()
    term.setCursorPos(1,1)
    return
end

function checkInventory(itemString)
    for i=1,16 do
        local slotData = turtle.getItemDetail(i)
        if slotData then
            if (itemString == slotData.name) then
                return true, i
            end
        end
    end
    return false, -1
end

function awaitItem(item)
    while(hasItem == false) do
        cleanScreen()
        print("Locating " .. item)
        hasItem, slotNo = checkInventory("minecraft:torch")
        if hasItem then
            print(item .. " FOUND!")
            sleep(2)
            return slotNo
        else
            print("ERROR: " .. item .. " Not Found Please add " .. item .. " to the inventory I will check again in 5 seconds")
            sleep(5)
        end
    end
end

function findAndSelectItem(item, quantity)
    while(hasItem == false) do
        hasItem = false
        quantity = quantity or 2
        slotNo = awaitItem(item)
        slotData = turtle.getItemDetail(slotNo)
        if slotData.count > quantity then
            turtle.select(slotNo)
            hasItem = true
        else
            print("ERROR: " .. item .. " Not Found in specified quantity Please add " .. item .. " to the inventory I will check again in 5 seconds")
            sleep(5)
        end
    end
end