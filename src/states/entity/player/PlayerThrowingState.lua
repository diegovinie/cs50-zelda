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

    self.player:changeAnimation('throw-' .. self.player.direction)
end

function PlayerThrowingState:enter(params)
    -- render offset for spaced character sprite (negated in render function of state)
    self.player.offsetY = 5
    self.player.offsetX = 0

    self.player.currentAnimation:refresh()
end

function PlayerThrowingState:update(dt)
    if self.player.control.left or self.player.control.right or
       self.player.control.up or self.player.control.down then
        self.player:changeState('walk-carrying')
    end

    if self.player.currentAnimation.timesPlayed > 0 then
        self.player.currentAnimation.timesPlayed = 0
        self.player:changeState('idle')
    end
end

function PlayerThrowingState:render()
    local anim = self.player.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
        math.floor(self.player.x - self.player.offsetX), math.floor(self.player.y - self.player.offsetY))
end