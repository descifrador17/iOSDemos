//
//  GameScene.swift
//  SpriteKit Demo
//
//  Created by Dayal, Utkarsh on 22/04/21.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var myFirstNode = SKNode()
    var spriteNode = SKSpriteNode(color: UIColor.red, size: CGSize(width: 150, height: 150))
    var spaceshipSprite = SKSpriteNode(imageNamed: "spaceship")
    var blueBox = SKSpriteNode(color: UIColor.blue, size: CGSize(width: 75.0, height: 75.0))
    
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        
        addChild(myFirstNode)
        
        spriteNode.position = CGPoint(x: view.frame.midX, y: view.frame.midY)
        spriteNode.anchorPoint = CGPoint.zero
        
        spaceshipSprite.size =  CGSize(width: 75, height: 75)
        spriteNode.addChild(spaceshipSprite)
        
        addChild(spriteNode)
        
        spriteNode.addChild(blueBox)
        blueBox.position = CGPoint(x: spriteNode.frame.width/2, y: spriteNode.frame.height/2)
        
        physicsWorld.gravity = CGVector(dx: 0.0, dy: -2.0)
        spaceshipSprite.physicsBody = SKPhysicsBody(circleOfRadius: spaceshipSprite.frame.width/2)
        spaceshipSprite.physicsBody!.restitution = 1.0
        
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//
//        //simple actions
//        //spaceshipSprite.run(SKAction.move(to: CGPoint(x: spriteNode.frame.width, y: spriteNode.frame.height), duration: 2))
//        //blueBox.run(SKAction.rotate(byAngle: .pi*2, duration: 2.0))
//
//        //action with completion handler
//        //spaceshipSprite.run(SKAction.move(to: CGPoint(x: spriteNode.frame.width, y: spriteNode.frame.height), duration: 2)){
//        //    self.spaceshipSprite.position = CGPoint.zero
//        //}
//
//        //repeat forever
//
//        if !blueBox.hasActions(){
//            blueBox.run(SKAction.repeatForever(SKAction.rotate(byAngle: .pi*2, duration: 2.0)))
//
//            //AKActions Group
//            blueBox.run(SKAction.group([SKAction.rotate(byAngle: .pi*2, duration: 2.0), SKAction.scale(by: 0.9, duration: 2.0)]))
//
//            //SKActions Sequence
//            blueBox.run(SKAction.sequence([SKAction.rotate(byAngle: .pi*2, duration: 2.0), SKAction.scale(by: 0.9, duration: 2.0)]))
//
//        }
//        else{
//            blueBox.removeAllActions()
//        }
//
//    }
    
    //Update Loop
    override func update(_ currentTime: TimeInterval) {
        print("1")
    }
    
    override func didEvaluateActions() {
        print("2")
    }
    
    override func didSimulatePhysics() {
        print("3")
    }
    
    override func didApplyConstraints() {
        print("4")
    }
    
    override func didFinishUpdate() {
        print("5")
        isPaused = true
    }
    
}
