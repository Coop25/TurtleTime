os.loadAPI("utils.lua")
utils.cleanScreen()

local yDistance = tonumber(io.read()) - 13
turtle.dig()
turtle.forward()

function emptyInv()
    for i=1,16 do
        local slotData = turtle.getItemDetail(i)
        if slotData then
            if (slotData.name ~= "minecraft:stone_stairs" and slotData.name ~= "minecraft:torch") then
                turtle.select(i)
                turtle.drop()
                turtle.select(1)
            end
        end
    end
    return false
end

for i = 1, yDistance do
    for i = 1, 4 do
        turtle.turnLeft()
        turtle.dig()
        turtle.turnRight()
        if i <= 3 then
            turtle.dig()
            turtle.forward()
        end
    end
    for i = 1, 3 do
        turtle.back()
    end
    emptyInv()
    utils.findAndSelectItem("minecraft:stone_stairs", 2)
    turtle.digDown()
    turtle.turnLeft()
    turtle.forward()
    turtle.digDown()
    turtle.turnRight()
    turtle.place()
    turtle.turnRight()
    turtle.forward()
    turtle.turnLeft()
    turtle.forward()
    turtle.digDown()
    turtle.down()
end