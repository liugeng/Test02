require("Cocos2d")

local TestScene = class("PhysicTest", function()
    --创建物理世界
    return cc.Scene:createWithPhysics()
end)

function TestScene.create()

    local scene = TestScene.new()

    --设置重力  -1000
    scene:getPhysicsWorld():setGravity(cc.p(0,-100))

    --绘制调试框线
    scene:getPhysicsWorld():setDebugDrawMask(1)

    --AddBox
    --ControlMove
    local layer = require("ControlMove").new()
    layer:init()
    scene:addChild(layer)

    return scene
end


return TestScene