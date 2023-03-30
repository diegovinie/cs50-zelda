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
        self.entity:changeState('walk')
    end

    if self.entity.control.buttonA then
        if self.entity.control:pressed('buttonA') then
            local box = self.entity:createActionBox()

            for _, object in pairs(self.dungeon.currentRoom.objects) do
                if self.entity.collides(box, object) then
                    if object.type == 'carriable' then
                        self.entity:changeState('lift', { object = object })
                        goto continue
                    end
                end
            end

            self.entity:changeState('swing-sword')

            ::continue::
        end
    end
end