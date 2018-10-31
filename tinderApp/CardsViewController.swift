//
//  CardsViewController.swift
//  tinderApp
//
//  Created by Marilyn Florek on 10/29/18.
//  Copyright © 2018 Marilyn Florek. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    @IBOutlet var viewFrame: UIView!
    
    @IBOutlet weak var profileImage: UIImageView!
    var cardInitialCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardInitialCenter = profileImage.center
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "profileSegue") {
            let destinationViewController = segue.destination as! ProfileViewController
            destinationViewController.image = self.profileImage.image
        }
    }
    
    @IBAction func didPanImage(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        let location = sender.location(in: view)
        var rotation = translation.x / 10 * CGFloat(Double.pi / 180)
        
        if sender.state == .began {
            if location.y > cardInitialCenter.y {
                rotation = -rotation
            }
        } else if sender.state == .changed {
            self.profileImage.center.y = cardInitialCenter.y + translation.y
            self.profileImage.center.x = cardInitialCenter.x + translation.x
            
            self.profileImage.transform = CGAffineTransform(rotationAngle: rotation)
            
        } else if sender.state == .ended {
            if translation.x > 50 {
                UIView.animate(withDuration: 0.3, animations: {
                    self.profileImage.center.x += self.view.bounds.width
                }, completion: nil)
                
            } else if translation.x < -50 {
                UIView.animate(withDuration: 0.3, animations: {
                    self.profileImage.center.x -= self.view.bounds.width
                }, completion: nil)
                
            } else {
                UIView.animate(withDuration: 0.3, animations: {
                    self.profileImage.center = self.cardInitialCenter
                }, completion: nil)
            }
        }
    }
    
}
