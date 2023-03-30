--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

SAVE_DISTANCE = 1

GameObject = Class{}

function GameObject:init(def, x, y)

    -- string identifying this object type
    self.type = def.type

    self.texture = def.texture
    self.frame = def.frame or 1

    -- whether it acts as an obstacle or not
    self.solid = def.solid

    self.defaultState = def.defaultState
    self.state = self.defaultState
    self.states = def.states

    -- dimensions
    self.x = x
    self.y = y
    self.width = def.width
    self.height = def.height
    self.inPlay = true
    self.scale = def.scale or 1

    -- default empty collision callback
    self.onCollide = function() end
end

function GameObject:update(dt)

end

function GameObject:collideSolid(entity)
    if self.solid then
        if entity.direction == 'left' then
            entity.x = entity.x + SAVE_DISTANCE
        elseif entity.direction == 'right' then
            entity.x = entity.x - SAVE_DISTANCE
        elseif entity.direction == 'up' then
            entity.y = entity.y + SAVE_DISTANCE
        elseif entity.direction == 'down' then
            entity.y = entity.y - SAVE_DISTANCE
        end
    end
end

function GameObject:render(adjacentOffsetX, adjacentOffsetY)
    love.graphics.draw(
        gTextures[self.texture],
        gFrames[self.texture][self.states[self.state].frame or self.frame],
        self.x + (0.5 - 0.5 * self.scale) * self.width + adjacentOffsetX,
        self.y + (0.5 - 0.5 * self.scale) * self.height + adjacentOffsetY,
        nil,
        self.scale,
        self.scale
    )

    -- debugging
    -- love.graphics.rectangle(
    --     'line',
    --     self.x + (0.5 - 0.5 * self.scale) * self.width + adjacentOffsetX,
    --     self.y + (0.5 - 0.5 * self.scale) * self.height + adjacentOffsetY,
    --     self.width,
    --     self.height
    -- )
end