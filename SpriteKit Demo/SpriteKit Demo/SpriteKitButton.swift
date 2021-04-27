//
//  SpriteKitButton.swift
//  SpriteKit Demo
//
//  Created by Dayal, Utkarsh on 23/04/21.
//

import SpriteKit

class SpriteKitButton : SKSpriteNode{
    
    var defaultButton: SKSpriteNode
    var action: (Int)->()
    var index: Int
    
    init(defaultButtonImage: String, action: @escaping (Int) -> (), index: Int ) {
        self.defaultButton = SKSpriteNode(imageNamed: defaultButtonImage)
        self.action = action
        self.index = index
        
        super.init(texture: nil, color: UIColor.clear, size: self.defaultButton.size)
        
        isUserInteractionEnabled = true
        addChild(self.defaultButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        defaultButton.alpha = 0.75
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch = touches.first! as UITouch
        let location: CGPoint = touch.location(in: self)
        
        if defaultButton.contains(location){
            defaultButton.alpha = 0.75
        }
        else{
            defaultButton.alpha = 1
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch = touches.first! as UITouch
        let location: CGPoint = touch.location(in: self)
        
        if defaultButton.contains(location){
            action(index)
        }
        
        defaultButton.alpha = 1
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        defaultButton.alpha = 1
    }
    
}
