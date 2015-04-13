//
//  CategoryNode.swift
//  CattleBattle
//
//  Created by Jarvis on 4/13/15.
//  Copyright (c) 2015 Cattle Battle. All rights reserved.
//

import UIKit
import SpriteKit

class CategoryNode: SKSpriteNode {
    struct Constants {
        internal static var IDENTIFIER = "categoryNode"
        internal static let SCALE_X: CGFloat = 0.6
        internal static let SCALE_Y: CGFloat = 0.5
    }
    
    internal var side: GameModel.Side = .LEFT
    
    init(side: GameModel.Side) {
        super.init()
        
        self.name = Constants.IDENTIFIER
        self.side = side
        
        self.texture = SKTexture(imageNamed: "category-"+self.side.rawValue+".png")
    
        self.size = self.texture!.size()
        self.xScale = Constants.SCALE_X
        self.yScale = Constants.SCALE_Y
        
        var bodySize = CGSizeMake(self.size.width-15, self.size.height-15)
        physicsBody = SKPhysicsBody(rectangleOfSize: bodySize)
        
        physicsBody!.categoryBitMask = GameScene.Constants.Category
        physicsBody!.contactTestBitMask = GameScene.Constants.Item
        physicsBody!.collisionBitMask = GameScene.Constants.All
        physicsBody!.dynamic = false
        
        physicsBody!.restitution = 1
    }

    override init(texture:SKTexture, color:SKColor, size:CGSize) {
        super.init(texture:texture, color:color, size:size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}