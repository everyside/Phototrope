//
//  MainViewController.swift
//  Phototrope
//
//  Created by Dani Pletter on 10/22/15.
//  Copyright © 2015 Everyside Innovations, LLC. All rights reserved.
//

import UIKit
import SpriteKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = SKScene(fileNamed: "Scene")!
        let skView = self.view as! SKView
        //skView.showsFPS = true
        //skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .ResizeFill
        skView.presentScene(scene)
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}