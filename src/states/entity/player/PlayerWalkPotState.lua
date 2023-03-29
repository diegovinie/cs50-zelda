--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

PlayerWalkPotState = Class{__includes = PlayerWalkState}

function PlayerWalkPotState:init(player, dungeon)
    PlayerWalkState.init(self, player, dungeon)

    self.anims = {
        left = 'walk-pot-left',
        right = 'walk-pot-right',
        up = 'walk-pot-up',
        down = 'walk-pot-down'
    }
end
