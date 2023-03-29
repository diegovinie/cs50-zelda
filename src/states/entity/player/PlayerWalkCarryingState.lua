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
        down = 'walk-carrying-down'
    }
end
