//
//  imgFilterViewController.swift
//  ImageFilterProject
//
//  Created by Anjali Joseph on 2019-05-30.
//  Copyright © 2019 Anjali Joseph. All rights reserved.
//

import UIKit

class imgFilterViewController: UIViewController {

    @IBOutlet weak var imgPlaceHolder: UIImageView!
    var originalImage=UIImage.init()
    override func viewDidLoad() {
        super.viewDidLoad()
        originalImage=imgPlaceHolder.image!
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func blackAndWhite(_ sender: Any) {
       let inputImage1=originalImage
       // originalImage=inputImage1
        let rawImage=CIImage(image:inputImage1)!
        let blackAndWhiteParams: [String:Any]=[kCIInputImageKey:rawImage]
        let backAndWhiteFilter=CIFilter(name: "CIPhotoEffectNoir", parameters: blackAndWhiteParams)
        let context=CIContext(options: nil)
        if let  output=backAndWhiteFilter?.outputImage{
            if let ciImg=context.createCGImage(output, from: output.extent){
                let finalImage=UIImage(cgImage: ciImg)
               imgPlaceHolder.image=finalImage
            }
            
        }
        
        
    }
    
    @IBAction func boxBlur(_ sender: Any) {
 let inputImage1=originalImage
       // originalImage=inputImage1
        let rawImage=CIImage(image:inputImage1)!
        let boxBlurParams: [String:Any]=[kCIInputImageKey:rawImage,kCIInputRadiusKey:7]
        let boxBlurFilter=CIFilter(name: "CIBoxBlur", parameters: boxBlurParams)
        let context=CIContext(options: nil)
        if let  output=boxBlurFilter?.outputImage{
            if let ciImg=context.createCGImage(output, from: output.extent){
                let finalImage=UIImage(cgImage: ciImg)
               imgPlaceHolder.image=finalImage            }
            
        }
       
        
    }
    
    @IBAction func colorInvert(_ sender: Any) {
        let inputImage1=originalImage
     //   originalImage=inputImage1
        let rawImage=CIImage(image:inputImage1)!
        
        let colorInvertParams: [String:Any]=[kCIInputImageKey:rawImage]
        let colorInvertFilter=CIFilter(name: "CIColorInvert", parameters: colorInvertParams)
        let context=CIContext(options: nil)
        if let  output=colorInvertFilter?.outputImage{
            if let ciImg=context.createCGImage(output, from: output.extent){
                let finalImage=UIImage(cgImage: ciImg)
                imgPlaceHolder.image=finalImage
                
            }
            
        }    }
    
    
    @IBAction func reset(_ sender: Any) {
        imgPlaceHolder.image=originalImage
    }
    
    @IBAction func circularWrap(_ sender: Any) {
        let inputImage1=originalImage
         let rawImage=CIImage(image:inputImage1)!
        let circularWrapParams: [String:Any]=[kCIInputImageKey:rawImage, kCIInputCenterKey: CIVector(string:"[100 100]"),kCIInputRadiusKey:100,kCIInputAngleKey:0.5]
        let circularWrapFilter=CIFilter(name: "CICircularWrap", parameters: circularWrapParams)
        let context=CIContext(options: nil)
        if let  output=circularWrapFilter?.outputImage{
            if let ciImg=context.createCGImage(output, from: output.extent){
                let finalImage=UIImage(cgImage: ciImg)
                 imgPlaceHolder.image=finalImage
                
            }
            
        }
        
    }
    
    @IBAction func photoEffectsProcess(_ sender: Any) {
        let inputImage1=originalImage
        let rawImage=CIImage(image:inputImage1)!
        let photoEffectProcessParams: [String:Any]=[kCIInputImageKey:rawImage]
        let photoEffectProcessFilter=CIFilter(name: "CIPhotoEffectProcess", parameters: photoEffectProcessParams)
        let context=CIContext(options: nil)
        if let  output=photoEffectProcessFilter?.outputImage{
            if let ciImg=context.createCGImage(output, from: output.extent){
                let finalImage=UIImage(cgImage: ciImg)
                imgPlaceHolder.image=finalImage
            }
       
    }
}
}
