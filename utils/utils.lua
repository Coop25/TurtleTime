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
    slotNo = -1
    while(hasItem == false) do
        cleanScreen()
        print("Locating " .. item)
        hasItem, slotNo = checkInventory(item)
        if hasItem then
            print(item .. " FOUND!")
            sleep(2)
        else
            print("ERROR: " .. item .. " Not Found Please add " .. item .. " to the inventory I will check again in 5 seconds")
            sleep(5)
        end
    end
    return slotNo
end

function findAndSelectItem(item)
    slotNo = awaitItem(item)
    turtle.select(slotNo)
end