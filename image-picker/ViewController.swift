//
//  ViewController.swift
//  image-picker
//
//  Created by Sandhya Baghel on 06/07/21.
//  Copyright © 2021 Sandhya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
     var identity = CGAffineTransform.identity

    private let view1 : UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.frame = CGRect(x: 0, y:0, width: 600, height: 800)
        view.backgroundColor = UIColor.white
        return view
    }()
    
        private let label:UILabel = {
            let lbl = UILabel()
            lbl.text = "Open Gallary"
            lbl.textAlignment = .center
            lbl.backgroundColor = UIColor.black
            lbl.textColor = UIColor.white
            lbl.font = UIFont(name: "arial", size: 25)
            return lbl
        }()
        private let myImageView:UIImageView = {
                 let imageView = UIImageView()
                 imageView.contentMode = .scaleAspectFill

                 return imageView
             }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.addSubview(view1)
            view.addSubview(myImageView)
            view.addSubview(label)
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapView(_:)))

            // Configure Tap Gesture Recognizer
            tapGestureRecognizer.numberOfTouchesRequired = 1
                      // tapGestureRecognizer.numberOfTapsRequired = 2
            imagePicker.delegate = self

            // Add Tap Gesture Recognizer
            view1.addGestureRecognizer(tapGestureRecognizer)
            view1.isUserInteractionEnabled = true
            
            let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(scale))
                   let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(rotate))
                   
          //  pinchGesture.delegate = self as! UIGestureRecognizerDelegate
           // rotationGesture.delegate = self as! UIGestureRecognizerDelegate

                   myImageView.addGestureRecognizer(pinchGesture)
                   myImageView.addGestureRecognizer(rotationGesture)
            
            let gesture = UIPanGestureRecognizer(target: self,
                                                 action: Selector(("wasDragged:")))
            myImageView.addGestureRecognizer(gesture)
            myImageView.isUserInteractionEnabled = true

           }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myImageView.frame = CGRect(x:170,y:230,width:74,height:250)
         label.frame = CGRect(x:100,y:50,width:200,height:40)
       
    }


    @IBAction func didTapView(_ sender: UITapGestureRecognizer) {
         self.view1.isHidden = true
     _ = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(handleGallery))
           handleGallery()
          }
       @objc private func handleGallery() {
                  print("gallery called")
                  imagePicker.sourceType = .photoLibrary
                  DispatchQueue.main.async {
                      self.present(self.imagePicker, animated: true)
                  }
              }
       private let imagePicker:UIImagePickerController = {
                 let imagePicker = UIImagePickerController()
                 imagePicker.allowsEditing = false
                 return imagePicker
             }()
    
    @objc func scale(_ gesture: UIPinchGestureRecognizer) {
           switch gesture.state {
           case .began:
               identity = myImageView.transform
           case .changed,.ended:
              myImageView.transform = identity.scaledBy(x: gesture.scale, y: gesture.scale)
           case .cancelled:
               break
           default:
               break
           }
       }
       @objc func rotate(_ gesture: UIRotationGestureRecognizer) {
           myImageView.transform = myImageView.transform.rotated(by: gesture.rotation)
       }
    @objc func wasDragged(_ gestureRecognizer: UIPanGestureRecognizer) {
        
            if gestureRecognizer.state == UIGestureRecognizer.State.began || gestureRecognizer.state == UIGestureRecognizer.State.changed {

                let translation = gestureRecognizer.translation(in: self.view)
                print(gestureRecognizer.view!.center.y)

                if(gestureRecognizer.view!.center.y < 555) {

                    gestureRecognizer.view!.center = CGPoint(x: gestureRecognizer.view!.center.x, y: gestureRecognizer.view!.center.y + translation.y)

                }else {
                    gestureRecognizer.view!.center = CGPoint(x:gestureRecognizer.view!.center.x, y:554)
                }
                gestureRecognizer.setTranslation(CGPoint(x: 0, y: 0), in: self.view)
            }
    
    
    }
       
}

extension ViewController:UIImagePickerControllerDelegate, UINavigationControllerDelegate {
func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    
    if let selectedImage = info[.originalImage] as? UIImage {
        self.myImageView.image = selectedImage
    }
    
    picker.dismiss(animated: true)
}

func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
     picker.dismiss(animated: true)
        }
    }
