local Arrow = class("Arrow",function()
    return cc.Sprite:create("button.png")
end)


function Arrow:init(sp)
    
    self.target = sp
    
    self.touchListener = cc.EventListenerTouchOneByOne:create();
    self.touchListener:setSwallowTouches(true)

    function onTouchBegin(touch, event)
        if self.target == nil then return end
        if cc.rectContainsPoint(self:getBoundingBox(), touch:getLocation()) == false then
            return false
        end
        
        local p = self.convertTouchToNodeSpace(self,touch)

        local w = self.getContentSize(self).width
        
        if p.x <= w/2 then
            --left
            self.target:getPhysicsBody():setVelocity(cc.p(-100,0))
        else
            --right
            self.target:getPhysicsBody():setVelocity(cc.p(100,0))
        end
        
        local tex = cc.Director:getInstance():getTextureCache():addImage("button1.png")
        
        return true
    end
    
    
    function onTouchEnded(touch, event)
        if self.target then
            self.target:getPhysicsBody():setVelocity(cc.p(0, 0))
        end
        
        local tex = cc.Director:getInstance():getTextureCache():addImage("button.png")
        self:setTexture(tex)
    end
    
    
    self.touchListener:registerScriptHandler(onTouchBegin,cc.Handler.EVENT_TOUCH_BEGAN)
    self.touchListener:registerScriptHandler(onTouchEnded,cc.Handler.EVENT_TOUCH_ENDED)
    cc.Director:getInstance():getEventDispatcher():addEventListenerWithSceneGraphPriority(self.touchListener,self);
    
end

return Arrow