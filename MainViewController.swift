//
//  MainViewController.swift
//  Phototrope
//
//  Created by Dani Pletter on 10/22/15.
//  Copyright © 2015 Everyside Innovations, LLC. All rights reserved.
//

import UIKit
import SpriteKit
import AVFoundation

class MainViewController: UIViewController {
    var cameraLayer : AVCaptureVideoPreviewLayer?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    override func viewDidAppear(animated: Bool) {
        self.startCamera()

        let scene = DotScene()
        let skView = self.view as! SKView
        //skView.showsFPS = true
        //skView.showsNodeCount = true
        //skView.ignoresSiblingOrder = true
        skView.allowsTransparency = true
        scene.scaleMode = .ResizeFill
        skView.presentScene(scene)

    }

    func startCamera() {

        var frontCamera : AVCaptureDevice?
        let devices = AVCaptureDevice.devices()

        // Loop through all the capture devices
        for device in devices {
            // Make sure this particular device supports video
            if (device.hasMediaType(AVMediaTypeVideo)) {
                frontCamera = device as? AVCaptureDevice
                if frontCamera != nil {//&& frontCamera!.description.containsString("Logitech") {

                    let frontVideoSession = AVCaptureSession()
                    frontVideoSession.sessionPreset = AVCaptureSessionPresetHigh
                    

                    do {
                        let input = try AVCaptureDeviceInput(device: frontCamera)


                        frontVideoSession.addInput(input)

                        self.cameraLayer = AVCaptureVideoPreviewLayer(session: frontVideoSession)
                        self.cameraLayer!.videoGravity = AVLayerVideoGravityResizeAspectFill

                        self.cameraLayer!.connection.videoOrientation = AVCaptureVideoOrientation.LandscapeLeft
                        self.cameraLayer!.frame = self.view.bounds
                        self.cameraLayer?.opacity = 0.2
                        self.view.layer.addSublayer(self.cameraLayer!)

                        //self.view.wantsLayer = true

                        //let priority = DISPATCH_QUEUE_PRIORITY_HIGH
                        //dispatch_async(dispatch_get_global_queue(priority, 0)) {
                        frontVideoSession.startRunning()
                        //}
                        
                    }catch _ {
                        
                    }
                }
            }
        }
    }

}