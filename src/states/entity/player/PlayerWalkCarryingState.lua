--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

PlayerWalkCarryingState = Class{__includes = PlayerWalkState}

function PlayerWalkCarryingState:init(player, dungeon)
    PlayerWalkState.init(self, player, dungeon)

    self.anims = {
        left = 'walk-carrying-left',
        right = 'walk-carrying-right',
        up = 'walk-carrying-up',
        down = 'walk-carrying-down',
        idle = 'idle-carrying'
    }
end

function PlayerWalkCarryingState:update(dt)
    if self.entity.control:pressed('buttonA') then
        print('throw')
        self.entity:changeState('walk')
    else
        PlayerWalkState.update(self, dt)
    end
end
