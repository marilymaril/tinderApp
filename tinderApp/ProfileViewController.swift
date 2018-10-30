//
//  ProfileViewController.swift
//  tinderApp
//
//  Created by Marilyn Florek on 10/29/18.
//  Copyright © 2018 Marilyn Florek. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profileImage.image = image
    }
    

}
