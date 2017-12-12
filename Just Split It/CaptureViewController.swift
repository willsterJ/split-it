//
//  CaptureViewController.swift
//  Just Split It
//
//  Created by Muhammad Joyo on 12/9/17.
//

import UIKit
import AVFoundation
import Vision

class CaptureViewController: UIViewController {

	 @IBOutlet weak var previewView: UIView!
	
	//Allows us to transfer data between one or more device inputs
	var captureSession: AVCaptureSession?
	//Allows us to render the live feed from the camera to the view
	var videoPreviewLayer: AVCaptureVideoPreviewLayer?
	
	//Array of generic VNRequests
	//var requests = [VNRequest]()
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		//Init a device object with a video media type
		let captureDevice = AVCaptureDevice.default(for: AVMediaType.video)
		
		do {
			//Connect input device to capture device
			let inputDevice = try AVCaptureDeviceInput(device: captureDevice!)
			
			//Init capture session
			captureSession = AVCaptureSession()
			//Add input device to capture session
			captureSession?.addInput(inputDevice)
			
			//Init videoPreviewLayer and add it as a sublayer to previewView
			videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
			videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
			videoPreviewLayer?.frame = view.layer.bounds
			previewView.layer.addSublayer(videoPreviewLayer!)
			
			//Start capture session
			captureSession?.startRunning()
			
		} catch {
			print(error)
		}

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
	}
	
	override func viewWillAppear(_ animated: Bool) {
		//startLiveVideo()
		//startTextDetection()
	}
	
//	override func viewDidLayoutSubviews() {
//		imageView.layer.sublayers?[0].frame = imageView.bounds
//	}
	
//	//Connect the session to our device
//	func startLiveVideo() {
//		//Modify the settings of our session
//		session.sessionPreset = AVCaptureSession.Preset.photo
//		//Set AVMediaType as video
//		let captureDevice = AVCaptureDevice.default(for: AVMediaType.video)
//
//		//Define device input and output
//		let deviceInput = try! AVCaptureDeviceInput(device: captureDevice!)
//		let deviceOutput = AVCaptureVideoDataOutput()
//		//Set video format
//		deviceOutput.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String: Int(kCVPixelFormatType_32BGRA)]
//		deviceOutput.setSampleBufferDelegate(self, queue: DispatchQueue.global(qos: DispatchQoS.QoSClass.default))
//		//Add input and output to the session
//		session.addInput(deviceInput)
//		session.addOutput(deviceOutput)
//
//		//Add a sublayer containing the video preview to the imageview
//		let imageLayer = AVCaptureVideoPreviewLayer(session: session)
//		imageLayer.frame = imageView.bounds
//		imageView.layer.addSublayer(imageLayer)
//
//		//Start running the session
//		session.startRunning()
//
//	}
//
//	func startTextDetection() {
//		//type of VNRequest that looks for rectangles with some text in them
//		//When the request is completed, call detectTextHandler
//		let textRequest = VNDetectTextRectanglesRequest(completionHandler: self.detectTextHandler)
//		//tells the framework to give us exacly what it recognized
//		textRequest.reportCharacterBoxes = true
//		self.requests = [textRequest]
//
//	}
//
//	func detectTextHandler(request: VNRequest, error: Error?) {
//		//create observations which will contain the results of the request
//		guard let observations = request.results else {
//			print("No Result")
//			return
//		}
//		//Go through all the results of request and transform them into VNTextObservation and set them to result
//		let result = observations.map({$0 as? VNTextObservation})
//
//		//Run code asynchronously
//		DispatchQueue.main.async() {
//			//remove bottom most layer in imageview
//			self.imageView.layer.sublayers?.removeSubrange(1...)
//
//			for region in result {
//				//check if region exists in the result from the textObservation
//				guard let rg = region else {
//					continue
//				}
//
//				self.highlightWord(box: rg)
//
//				//Check if there are character boxes
//				if let boxes = region?.characterBoxes {
//					for characterBox in boxes {
//						self.highlightLetters(box: characterBox)
//					}
//				}
//			}
//		}
//	}
//
//	func highlightWord(box: VNTextObservation) {
//		guard let boxes = box.characterBoxes else {
//			return
//		}
//
//		var maxX: CGFloat = 9999.0
//		var minX: CGFloat = 0.0
//		var maxY: CGFloat = 9999.0
//		var minY: CGFloat = 0.0
//
//		for char in boxes {
//			if(char.bottomLeft.x < maxX) {
//				maxX = char.bottomLeft.x
//			}
//			if(char.bottomRight.x > minX) {
//				minX = char.bottomRight.x
//			}
//			if(char.bottomRight.y < maxY) {
//				maxY = char.bottomRight.y
//			}
//			if(char.topRight.y > minY) {
//				minY = char.topRight.y
//			}
//		}
//
//		let xCord = maxX * imageView.frame.size.width
//		let yCord = (1 - minY) * imageView.frame.size.height
//		let width = (minX - maxX) * imageView.frame.size.width
//		let height = (minY - maxY) * imageView.frame.size.height
//
//		let outline =  CALayer()
//		outline.frame = CGRect(x: xCord, y: yCord, width: width, height: height)
//		outline.borderWidth = 2.0
//		outline.borderColor = UIColor.red.cgColor
//
//		imageView.layer.addSublayer(outline)
//	}
//
//	func highlightLetters(box: VNRectangleObservation) {
//		let xCord = box.topLeft.x * imageView.frame.size.width
//		let yCord = (1 - box.topLeft.y) * imageView.frame.size.height
//		let width = (box.topRight.x - box.bottomLeft.x) * imageView.frame.size.width
//		let height = (box.topLeft.y - box.bottomLeft.y) * imageView.frame.size.height
//
//		let outline = CALayer()
//		outline.frame = CGRect(x: xCord, y: yCord, width: width, height: height)
//		outline.borderWidth = 1.0
//		outline.borderColor = UIColor.blue.cgColor
//
//		imageView.layer.addSublayer(outline)
//	}
//
//	//adopts the AVCaptureVideoDataOutputSampleBufferDelegate protocol
//	func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
//		guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {
//			return
//		}
//
//		var requestOptions:[VNImageOption : Any] = [:]
//
//		if let camData = CMGetAttachment(sampleBuffer, kCMSampleBufferAttachmentKey_CameraIntrinsicMatrix, nil) {
//			requestOptions = [.cameraIntrinsics:camData]
//		}
//
//		let imageRequestHandler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, orientation: CGImagePropertyOrientation(rawValue: 6)!, options: requestOptions)
//
//		do {
//			try imageRequestHandler.perform(self.requests)
//		} catch {
//			print(error)
//		}
//	}
	
	
}

extension CaptureViewController: AVCaptureVideoDataOutputSampleBufferDelegate {
	
}
