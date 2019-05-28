//
//  ViewController.swift
//  SnapApp
//
//  Created by ITP312 on 28/5/19.
//  Copyright © 2019 NYP. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet weak var takePicture: UIButton!
    @IBOutlet weak var selectPicture: UIButton!
    
    
    
    // This function is called when the user clicks on the
    // Take Picture button. The purpose of this is to open // the Image Picker (using the camera as a source). //
    @IBAction func takePicture(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        // Setting this to true allows the user to crop and scale // the image to a square after the photo is taken.
        //
        picker.allowsEditing = true
        picker.sourceType = UIImagePickerController.SourceType.camera
        
        self.present( picker, animated: true)
        
    }
    

    
    @IBAction func selectPicture(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        // Setting this to true allows the user to crop and scale // the image to a square after the image is selected. //
        picker.allowsEditing = true
        picker.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(
            picker, animated: true)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // We check if this device has a camera
        //
        if !(UIImagePickerController.isSourceTypeAvailable( UIImagePickerController.SourceType.camera))
        {
            // If not, we will just hide the takePicture button //
            takePicture.isHidden = true
        }
    }


    
    // This function is called after the user took the picture, // or selected a picture from the photo library.
    // When that happens, we simply assign the image binary,
    // represented by UIImage, into the imageView we created. //
    // iOS doesn’t close the picker controller
    // automatically, so we have to do this ourselves by calling // dismissViewControllerAnimated.
    //
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info:
        [UIImagePickerController.InfoKey : Any])
    { let chosenImage : UIImage =
        info[.editedImage] as! UIImage
        self.imageView!.image = chosenImage
        // This saves the image selected / shot by the user
        //
        UIImageWriteToSavedPhotosAlbum(chosenImage, nil, nil, nil)
        
        // This closes the picker //
        picker.dismiss(animated: true)
    }
    
    // This function is called after the user decides not to
    // take/select any picture. iOS doesn’t close the picker controller // automatically, so we have to do this ourselves by calling // dismissViewControllerAnimated.
    //
    func imagePickerControllerDidCancel( _ picker: UIImagePickerController)
    { picker.dismiss(animated: true) }
    
}

