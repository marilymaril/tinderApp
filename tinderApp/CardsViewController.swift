//
//  CardsViewController.swift
//  tinderApp
//
//  Created by Marilyn Florek on 10/29/18.
//  Copyright © 2018 Marilyn Florek. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    var cardInitialCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "profileSegue") {
            let destinationViewController = segue.destination as! ProfileViewController
            destinationViewController.image = self.profileImage.image
        }
    }
    

}
