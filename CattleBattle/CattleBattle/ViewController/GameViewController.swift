//
//  GameViewController.swift
//  CattleBattle
//
//  Created by Ding Ming on 25/3/15.
//  Copyright (c) 2015 Cattle Battle. All rights reserved.
//

import UIKit
import SpriteKit


class GameViewController: UIViewController {

    var sheepScene: GameScene!
    var sheepView: UIView!
    var riverScene: RiverScene!
    var riverView: UIView!
    var gameMode: GameModel.GameMode!
    
    internal func setupGame(_ mode: GameModel.GameMode) {
        gameMode = mode
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(GameViewController.backToPreviousScene(_:)), name: NSNotification.Name(rawValue: GameScene.Constants.BACK_HOME_MESS), object: nil)

        self.sheepView = SKView(frame: CGRect(x: 0, y: 0, width: self.view!.frame.width, height: self.view!.frame.height))
        self.riverView = SKView(frame: CGRect(x: 0, y: 0, width: self.view!.frame.width, height: self.view!.frame.height))
        
        
        if var scene = RiverScene.unarchiveFromFile("RiverScene") as? RiverScene {
            let skView = self.riverView as! SKView
            self.riverScene = scene
            
            skView.ignoresSiblingOrder = true
            scene.scaleMode = .aspectFill
            
            self.view!.addSubview(skView)
            self.view!.sendSubviewToBack(skView)
            
            skView.allowsTransparency = true
            scene.backgroundColor = UIColor.clear
            skView.presentScene(scene)
        }
        
        
        
        if var scene = GameScene.unarchiveFromFile("GameScene") as? GameScene {
            scene.setupGame(gameMode)
            let skView = self.sheepView as! SKView
            self.sheepScene = scene
            
            skView.ignoresSiblingOrder = true
            scene.scaleMode = .aspectFill

            self.view!.addSubview(skView)
            self.view!.bringSubviewToFront(skView)
            
            skView.allowsTransparency = true
            scene.backgroundColor = UIColor.clear
            skView.presentScene(scene)
        }
    }

    override var shouldAutorotate : Bool {
        return true
    }

    @objc func backToPreviousScene(_ sender: Notification) {
        navigationController?.popViewController(animated: true)
    }
}
