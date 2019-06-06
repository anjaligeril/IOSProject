//
//  imgFilterViewController.swift
//  ImageFilterProject
//
//  Created by Anjali Joseph on 2019-05-30.
//  Copyright © 2019 Anjali Joseph. All rights reserved.
//

import UIKit

class imgFilterViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var imgPlaceHolder: UIImageView!
    
    var originalImage=UIImage.init()
    
    @IBOutlet var imageUploadProgress: UIView!
    
    @IBOutlet weak var uploadBtn: UIButton!
    
    @IBOutlet weak var progressLabel: UILabel!
   
    
    
    var inputRadius=2.50
   var inputIntensity=0.50
   
    override func viewDidLoad() {
        super.viewDidLoad()
        //originalImage=imgPlaceHolder.image!
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
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        if(info[UIImagePickerController.InfoKey.originalImage] as? UIImage != nil){
      let userSelection=info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        imgPlaceHolder.image=userSelection
        imgPlaceHolder.backgroundColor = UIColor.clear
        self.dismiss(animated:true,completion: nil)
        originalImage=imgPlaceHolder.image!
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        
    }
    
    @IBAction func upload(_ sender: Any) {
        var myPickerController=UIImagePickerController()
        myPickerController.delegate=self
       myPickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
myPickerController.allowsEditing=true
        self.present(myPickerController,animated:true,completion: nil)
        
    }
    
    @IBAction func blackAndWhite(_ sender: Any) {
        //originalImage=imgPlaceHolder.image!
       
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
        let boxBlurParams: [String:Any]=[kCIInputImageKey:rawImage,kCIInputRadiusKey:30]
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
 
    @IBAction func sliderInputRadius(_ sender: UISlider) {
        inputRadius=Double(sender.value)
    }
    
    @IBAction func sliderInputAngle(_ sender: UISlider) {
        inputIntensity=Double(sender.value)
    }
    /*
    @IBAction func circularWrap(_ sender: Any) {
        let inputImage1=originalImage
         let rawImage=CIImage(image:inputImage1)!
        let circularWrapParams: [String:Any]=[kCIInputImageKey:rawImage, kCIInputCenterKey: CIVector(string:"[100 100]"),kCIInputRadiusKey:inputRadius,kCIInputAngleKey:inputAngle]
        let circularWrapFilter=CIFilter(name: "CICircularWrap", parameters: circularWrapParams)
        let context=CIContext(options: nil)
        if let  output=circularWrapFilter?.outputImage{
            if let ciImg=context.createCGImage(output, from: output.extent){
                let finalImage=UIImage(cgImage: ciImg)
                 imgPlaceHolder.image=finalImage
                
            }
            
        }
        
    }
    
    */
    
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
    
    @IBAction func unSharpMask(_ sender: Any) {
        
        let inputImage1=originalImage
        let rawImage=CIImage(image:inputImage1)!
        let circularWrapParams: [String:Any]=[kCIInputImageKey:rawImage, kCIInputRadiusKey:inputRadius,kCIInputIntensityKey:inputIntensity]
        let circularWrapFilter=CIFilter(name: "CIUnsharpMask", parameters: circularWrapParams)
        let context=CIContext(options: nil)
        if let  output=circularWrapFilter?.outputImage{
            if let ciImg=context.createCGImage(output, from: output.extent){
                let finalImage=UIImage(cgImage: ciImg)
                imgPlaceHolder.image=finalImage
                
            }
            
        }
    }
}
