--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

PlayerLiftState = Class{__includes = BaseState}

function PlayerLiftState:init(player, dungeon)
    self.player = player
    self.dungeon = dungeon

    self.player:changeAnimation('lift-' .. self.player.direction)
end

function PlayerLiftState:enter(params)
    -- render offset for spaced character sprite (negated in render function of state)
    self.player.offsetY = 5
    self.player.offsetX = 0

    self.player.currentAnimation:refresh()
end

function PlayerLiftState:update(dt)
    if self.player.control.left or self.player.control.right or
       self.player.control.up or self.player.control.down then
        self.player:changeState('walk')
    end

    if self.player.currentAnimation.timesPlayed > 0 then
        self.player.currentAnimation.timesPlayed = 0
        self.player:changeState('idle-carrying')
    end
end

function PlayerLiftState:render()
    local anim = self.player.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
        math.floor(self.player.x - self.player.offsetX), math.floor(self.player.y - self.player.offsetY))
end