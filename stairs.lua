os.loadAPI("utils.lua")
utils.cleanScreen()
print("What Y level is your head?: ")
local yDistance = tonumber(io.read()) + 50
print("How often do you want a torch?: ")
local torchDistance = tonumber(io.read())
while turtle.detect() do
    turtle.dig()
end
turtle.forward()

function emptyInv()
    for i=1,16 do
        local slotData = turtle.getItemDetail(i)
        if slotData then
            if (slotData.name ~= "minecraft:cobblestone_stairs" and slotData.name ~= "minecraft:torch") then
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
        while turtle.detect() do
            turtle.dig()
        end
        turtle.turnRight()
        turtle.turnRight()
        while turtle.detect() do
            turtle.dig()
        end 
        turtle.turnLeft()
        if i <= 3 then
            while turtle.detect() do
                turtle.dig()
            end
            turtle.forward()
        end
    end
    if i % torchDistance == 0 then
        while turtle.detect() do
            turtle.dig()
        end
        turtle.forward()
        turtle.turnLeft()
        while turtle.detect() do
            turtle.dig()
        end
        turtle.turnRight()
        turtle.turnRight()
        while turtle.detect() do
            turtle.dig()
        end
        turtle.turnLeft()
        turtle.back()
        utils.awaitSelectItem("minecraft:torch")
        turtle.place()
    end
    for i = 1, 3 do
        turtle.back()
    end
    emptyInv()
    utils.awaitSelectItem("minecraft:cobblestone_stairs")
    turtle.digDown()
    turtle.turnLeft()
    turtle.forward()
    turtle.digDown()
    turtle.turnLeft()
    turtle.placeDown()
    turtle.turnLeft()
    turtle.forward()
    turtle.forward()
    turtle.turnRight()
    turtle.digDown()
    turtle.placeDown()
    turtle.turnRight()
    turtle.forward()
    turtle.turnLeft()
    turtle.placeDown()
    turtle.turnLeft()
    turtle.turnLeft()
    turtle.forward()
    turtle.digDown()
    turtle.down()
end