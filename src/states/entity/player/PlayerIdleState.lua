--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

PlayerIdleState = Class{__includes = EntityIdleState}

function PlayerIdleState:enter(params)

    -- render offset for spaced character sprite (negated in render function of state)
    self.entity.offsetY = 5
    self.entity.offsetX = 0
end

function PlayerIdleState:update(dt)
    if self.entity.control.left or self.entity.control.right or
       self.entity.control.up or self.entity.control.down then
        self.entity:changeState('walk-carrying')
    end

    if self.entity.control.buttonA then
        self.entity:changeState('swing-sword')
    end
end