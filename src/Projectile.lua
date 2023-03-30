--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

Projectile = Class{__includes = GameObject}

function Projectile:init(def, holder)
    GameObject.init(self, def , holder.x, holder.y)

    self.holder = holder
    self.thrown = false
    self.solid = false
    self.offsetX = 0
    self.offsetY = 0
    self.speed = 2.5
end

function Projectile:update(dt)
    local direction = self.holder.direction
    local dir = { x = 0, y = 0 }

    if self.thrown then
        self.solid = true
        if direction == 'left' then
            dir.x = -1
        elseif direction == 'right' then
            dir.x = 1
        elseif direction == 'up' then
            dir.y = -1
        elseif direction == 'down' then
            dir.y = 1
        end

        self.x = self.x + dir.x * self.speed
        self.y = self.y + dir.y * self.speed
    else
        self.x = self.holder.x + self.offsetX
        self.y = self.holder.y + self.offsetY
    end
end
