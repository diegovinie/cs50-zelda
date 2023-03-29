--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

PlayerIdleCarryingState = Class{__includes = PlayerIdleState}

function PlayerIdleCarryingState:init(entity)

    PlayerIdleState.init(self, entity)
    self.entity:changeAnimation('idle-carrying-' .. self.entity.direction)
end

function PlayerIdleCarryingState:update(dt)
    if self.entity.control.left or self.entity.control.right or
       self.entity.control.up or self.entity.control.down then
        self.entity:changeState('walk-carrying')
    end

    if self.entity.control.buttonA then
        self.entity:changeState('throw')
    end
end