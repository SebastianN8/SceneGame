-----------------------------------------------------------------------------------------
--
-- main.lua
--
-- Created by: Sebastian N
-- Created on: May 15
--
-- This programs links scenes and physics
-----------------------------------------------------------------------------------------

-- Variables for requirements
local composer = require( "composer" )
local physics = require('physics')
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    physics.start()
    physics.setGravity(0, 10)
    -- physics.setDrawMode('hybrid')
 
end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
        local ground1 = display.newImage('./Assets/Sprites/land.png')
        ground1.x = display.contentCenterX * 0.5
        ground1.y = display.contentHeight
        ground1.id = 'ground 1'
        physics.addBody(ground1, 'static', {
        	friction = 0.5,
        	bounce = 0.3
        	})
        sceneGroup:insert(ground1)

        local ground2 = display.newImage('./Assets/Sprites/land.png')
        ground2.x = display.contentCenterX * 1.5
        ground2.y = display.contentHeight
        ground2.id = 'ground 2'
        physics.addBody(ground2, 'static', {
        	friction = 0.5,
        	bounce = 0.3
        	})
        sceneGroup:insert(ground2)

        --local character = display.newImage('./Assets/Sprites/character.png')
        --character.x = display.contentCenterX
        --character.y = display.contentCentery
        --character.id = 'character'
        --physics.addBody(character, 'dynamic', {
        --	friction = 0.5,
        --	bounce = 0.3
        --	})
        --character.isFixedRotation = true
        --sceneGroup:insert(character)

        local sheetOptionsIdleNinja = {
            width = 232,
            height = 439,
            numFrames = 10
        }
        local sheetIdleNinja = graphics.newImageSheet('./Assets/SpriteSheets/ninjaBoyIdle.png', sheetOptionsIdleNinja)

        local sequence_data_ninja = {
        {   
            name = 'idle',
            start = 1,
            count = 10,
            time = 800,
            loopCount = 0,
            sheet = sheetIdleNinja
        }
        }

        local ninja = display.newSprite(sheetIdleNinja, sequence_data_ninja)
        ninja.x = display.contentCenterX
        ninja.y = display.contentCentery
        physics.addBody(ninja, 'dynamic', {
            fisics = 0.5,
            bounce = 0.3
            })
        ninja.isFixedRotation = true
        ninja:setSequence('idle')
        ninja:play()

 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
 
    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 
    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
 
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
 
return scene