//
//  ViewController.swift
//  PencilKitDemo
//
//  Created by shiga on 05/12/19.
//  Copyright © 2019 Shigas. All rights reserved.
// https://medium.com/better-programming/an-introduction-to-pencilkit-in-ios-4d40aa62ba5b

import UIKit
import PencilKit

class ViewController: UIViewController {

    @IBOutlet weak var canvasView: PKCanvasView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupCanvasView()
    }
    
    

    @IBAction func saveImage(_ sender: Any) {
        let image = canvasView.drawing.image(from: canvasView.drawing.bounds, scale: 1.0)
        UIImageWriteToSavedPhotosAlbum(image, self, nil, nil)
         }
    
    @IBAction func togglePicker(_ sender: Any) {
        if canvasView.isFirstResponder{
            canvasView.resignFirstResponder()
        }else{
            canvasView.becomeFirstResponder()
        }
    }
    
    @IBAction func clear(_ sender: Any) {
        canvasView.drawing = PKDrawing()
    }
   
    private func setupCanvasView(){
        guard let window = view.window, let toolPicker = PKToolPicker.shared(for: window) else { return }
        toolPicker.setVisible(true, forFirstResponder: canvasView)
        toolPicker.addObserver(canvasView)
        canvasView.becomeFirstResponder()
    }
    
}

