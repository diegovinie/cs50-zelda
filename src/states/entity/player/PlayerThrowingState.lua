--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

PlayerThrowingState = Class{__includes = BaseState}

function PlayerThrowingState:init(player, dungeon)
    self.player = player
    self.dungeon = dungeon

    self.offsets = {
        right = {
            { x = 0, y = -5 },
            { x = 0, y = 0 },
        },
        left = {
            { x = -self.player.height * 0.5, y = -5 },
            { x = -self.player.height, y = 0 },
        },
        up = {
            { x = 0, y = -5 },
            { x = 0, y = 0 },
        },
        down = {
            { x = 0, y = -5 },
            { x = 0, y = 0 },
        }
    }

    self.player:changeAnimation('throw-' .. self.player.direction)
end

function PlayerThrowingState:enter(params)
    -- render offset for spaced character sprite (negated in render function of state)
    self.player.offsetY = 5
    self.player.offsetX = 0
    self.player.currentAnimation:refresh()
end

function PlayerThrowingState:update(dt)
    local direction = self.player.direction
    local anim = self.player.currentAnimation
    if self.player.control.left or self.player.control.right or
       self.player.control.up or self.player.control.down then
        self.player:changeState('walk-carrying')
    end

    if self.player.currentAnimation.timesPlayed > 0 then
        self.player.currentAnimation.timesPlayed = 0
        self.player.projectile.thrown = true
        self.player:changeState('idle')
    else
        if anim.currentFrame <= #self.offsets[direction] then
            local currentOffset = self.offsets[direction][anim.currentFrame]

            self.player.projectile.offsetX = currentOffset.x
            self.player.projectile.offsetY = currentOffset.y
        end
    end
end

function PlayerThrowingState:render()
    local anim = self.player.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
        math.floor(self.player.x - self.player.offsetX), math.floor(self.player.y - self.player.offsetY))
end