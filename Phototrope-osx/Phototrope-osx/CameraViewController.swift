//
//  CameraViewController.swift
//  Phototrope-osx
//
//  Created by Dani Pletter on 10/25/15.
//  Copyright © 2015 Everyside Innovations, LLC. All rights reserved.
//

import Cocoa
import AVFoundation

class CameraViewController: NSViewController {


    var cameraLayer : AVCaptureVideoPreviewLayer?


    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear() {
        self.startCamera()
    }

    func startCamera() {

        var frontCamera : AVCaptureDevice?
        let devices = AVCaptureDevice.devices()

        // Loop through all the capture devices
        for device in devices {
            // Make sure this particular device supports video
            if (device.hasMediaType(AVMediaTypeVideo)) {
                    frontCamera = device as? AVCaptureDevice
                    if frontCamera != nil && frontCamera!.description.containsString("Logitech") {

                        let frontVideoSession = AVCaptureSession()
                        frontVideoSession.sessionPreset = AVCaptureSessionPresetHigh

                        do {
                            let input = try AVCaptureDeviceInput(device: frontCamera)


                            frontVideoSession.addInput(input)

                            self.cameraLayer = AVCaptureVideoPreviewLayer(session: frontVideoSession)
                            self.cameraLayer!.videoGravity = AVLayerVideoGravityResizeAspectFill

                            self.cameraLayer!.frame = self.view.bounds

                            self.view.layer = self.cameraLayer!
                            self.view.wantsLayer = true

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
