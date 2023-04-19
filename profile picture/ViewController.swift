//
//  ViewController.swift
//  profile picture
//
//  Created by ved katrodiya on 16/12/22.
//

import UIKit

class ViewController: UIViewController , UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    
    
    
    @IBOutlet weak var ProfilePicture: UIButton!
    
    
    @IBOutlet weak var profilePictureImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private func setup(){
        [profilePictureImageView, ProfilePicture].forEach{
            setcornerRadios(view: $0, cornorRadious: 10)
        }
        
    }
    
    func setcornerRadios(view: UIView?, cornorRadious: CGFloat){
        view?.layer.cornerRadius = cornorRadious
        view?.layer.masksToBounds = true
        
    }
    
    private func displayActionSheet(){
        let alert: UIAlertController = UIAlertController(title: "Profile pictur", message: "Plese select Photo following opction ", preferredStyle: .actionSheet)
        
        let cameraButton: UIAlertAction = UIAlertAction(title: "Camera", style: .default){ butoon in
            
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                self.openCamera()
            }else{
                self.displayAlert(messge: "Please Try Again")
            }
            
        }
        let gallaryButon: UIAlertAction = UIAlertAction(title: "Gallary", style: .default){ butoon in
            
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                self.openGallary()
            }else{
                self.displayAlert(messge: "Please Try Again")
            }
            
        }
        
        
        let cancleButton: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(cameraButton)
        alert.addAction(gallaryButon)
        alert.addAction(cancleButton)
        present(alert, animated: true, completion: nil)
    }
    
    
    
    private func openCamera(){
        let imagePiker: UIImagePickerController = UIImagePickerController()
        imagePiker.delegate = self
        imagePiker.sourceType = .camera
        imagePiker.allowsEditing = true
        present(imagePiker, animated: true, completion: nil)
        
    }
    
    
    private func openGallary(){
        let imagePiker: UIImagePickerController = UIImagePickerController()
        imagePiker.delegate = self
        imagePiker.sourceType = .photoLibrary
        imagePiker.allowsEditing = true
        present(imagePiker, animated: true, completion: nil)
        
    }
    
    
    private func displayAlert(messge: String){
        
        let alert: UIAlertController = UIAlertController(title: "Erorr", message: messge, preferredStyle: .alert)
        
        
        let okButoon: UIAlertAction = UIAlertAction(title: "Ok", style: .default) { butoon in
            print("Okay butoon taped")
        }
        let cancelButoon: UIAlertAction = UIAlertAction(title: "Cancel", style: .destructive) { butoon in
            
        }
        
        
        
        alert.addAction(okButoon)
        alert.addAction(cancelButoon)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func ProfilePictureButtonTapped(_ sender: UIButton) {
        displayActionSheet()
    }
    
       func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            dismiss(animated: true, completion: nil)
    profilePictureImageView.image = info[.originalImage] as? UIImage
        profilePictureImageView.image = info[.editedImage] as? UIImage
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
        print("Cancel Button Clicked")

    }


}


