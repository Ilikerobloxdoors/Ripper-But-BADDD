local Creator = loadstring(game:HttpGet("https://pastebin.com/raw/0fSnvfGt"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "Ripper BUT BAD",

    Model = "https://github.com/Ilikerobloxdoors/Ripper-But-BADDD/raw/refs/heads/main/Ripper%20but%20BAD.rbxm",

    Speed = 320,
    DelayTime = 6.5,
    HeightOffset = 0,

    CanKill = true,
    KillRange = 60,

    BreakLights = true,
    BackwardsMovement = false,

    FlickerLights = {
        false,
        1,
    },

    Cycles = {
        Min = 1,
        Max = 1,
        WaitTime = 1,
    },

    CamShake = {
        true,
        {10, 60, 0.1, 1.2},
        150,
    },

    Jumpscare = {
        true,
        {
            Image1 = "rbxassetid://116014747538395",
            Image2 = "rbxassetid://116014747538395",

            Shake = true,

            Sound1 = {
                1846271108,
                {Volume = 0.5},
            },

            Sound2 = {
                105114600855336,
                {Volume = 0.5},
            },

            Flashing = {
                true,
                Color3.fromRGB(254, 30, 30),
            },

            Tease = {
                true,
                Min = 2,
                Max = 2,
            },
        },
    },

    CustomDialog = {
        "You died to Ripper BUT BAD...",
        "He was NOT supposed to be this fast.",
    },
})

-----[[ Ripper Arrival Effect ]]-----

entity.Debug.OnEntitySpawned = function(entityTable)
    print("Ripper BUT BAD has spawned!")

    -- Arrival scream
    local spawnSound = Instance.new("Sound")
    spawnSound.Parent = workspace
    spawnSound.SoundId = "rbxassetid://12971875415"
    spawnSound.Volume = 10

    spawnSound:Play()

    game.Debris:AddItem(spawnSound, 16)

    -- Ripper red-light effect
    local tweenLights = TweenInfo.new(1)

    local red = {
        Color = Color3.fromRGB(255, 0, 0)
    }

    local currentRooms = workspace:FindFirstChild("CurrentRooms")

    if currentRooms then
        for _, v in pairs(currentRooms:GetDescendants()) do
            if v:IsA("Light") then
                game.TweenService:Create(v, tweenLights, red):Play()

                if v.Parent and v.Parent.Name == "LightFixture" then
                    game.TweenService:Create(v.Parent, tweenLights, red):Play()
                end
            end
        end
    end
end

-----[[ Advanced ]]-----

entity.Debug.OnEntityDespawned = function(entityTable)
    print("Ripper BUT BAD has despawned:", entityTable.Model)
end

entity.Debug.OnEntityStartMoving = function(entityTable)
    print("Ripper BUT BAD has started moving:", entityTable.Model)
end

entity.Debug.OnEntityFinishedRebound = function(entityTable)
    print("Ripper BUT BAD has finished rebound:", entityTable.Model)
end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("Ripper BUT BAD has entered room:", room)
end

entity.Debug.OnLookAtEntity = function(entityTable)
    print("Player has looked at Ripper BUT BAD:", entityTable.Model)
end

entity.Debug.OnDeath = function(entityTable)
    warn("Player has died to Ripper BUT BAD.")
end

------------------------

-- Run the created entity
Creator.runEntity(entity)
