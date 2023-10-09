os.loadAPI("utils.lua")
utils.cleanScreen()

print("Welcome to Coop's strip miner program")
print("how far will the main hall go? (Amount of 3x3 tunnels with 2 blocks between):")
local mainHallLength = tonumber(io.read())
utils.cleanScreen()
print("how far will each vein go?:")
local veinLength = tonumber(io.read())
utils.cleanScreen()

function updateScreen(hallLen, veinLen)
    utils.cleanScreen()
    print("Current Progress")
    print("----------------")
    print("Hall Length ",hallLen,"/",mainHallLength)
    print("Vein Length ",veinLen,"/",veinLength)
end

function digSides()
    turtle.turnLeft()
    turtle.dig()
    turtle.turnRight()
    turtle.turnRight()
    turtle.dig()
    turtle.turnLeft()
end

function hallSlice()
    turtle.dig()
    turtle.forward()
    digSides()
    turtle.digUp()
    turtle.up()
    digSides()
    turtle.digUp()
    turtle.up()
    digSides()
    turtle.down()
    turtle.down()
end

function emptyEnv()
    utils.awaitSelectItem("minecraft:chest")
    turtle.dig()
    turtle.placeDown()
    for i=1,16 do
        local slotData = turtle.getItemDetail(i)
        if slotData then
            if (string.match(slotData.name, "chest") == nil and string.match(slotData.name, "torch") == nil) then
                turtle.select(i)
                turtle.drop()
            end
        end
    end
end

function placeTorch()
    utils.awaitSelectItem("minecraft:torch")
    turtle.place()
end

function vein()
    for i = 1, veinLength do
        turtle.dig()
        turtle.forward()
        turtle.digUp()
        turtle.digDown()
        if utils.isInventoryFull() then
            turtle.down()
            emptyEnv()
            turtle.up()
        end
        if i % 7 == 0 then
            turtle.turnRight()
            turtle.dig()
            placeTorch()
            turtle.turnLeft()
        end
    end
    turtle.turnLeft()
    turtle.turnLeft()
    for i = 1, veinLength-1 do
        turtle.forward()
    end
end

for i=1,mainHallLength do
    hallSlice()
    if utils.isInventoryFull() then
        emptyEnv()
    end
    if i % 3 == 0 then
        turtle.turnLeft()
        turtle.forward()
        turtle.up()
        vein()
        if utils.isInventoryFull() then
            turtle.down()
            emptyEnv()
            turtle.up()
        end
        turtle.forward()
        turtle.forward()
        vein()
        turtle.down()
        turtle.forward()
        turtle.turnRight()
    end
    if i % 7 == 0 then
        turtle.turnRight()
        turtle.turnRight()
        placeTorch()
        turtle.turnRight()
        turtle.turnRight()
    end
end