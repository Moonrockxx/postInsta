//
//  ViewController.swift
//  instaProject
//
//  Created by TomF on 16/12/2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageLikes: [UIImageView]!
    @IBOutlet weak var profilIV: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setIVProfil(profilIV)
        imageLikes.forEach { (image) in
            setIVProfil(image)
        }
    }
    
    func setIVProfil(_ iv: UIImageView) {
        iv.layer.cornerRadius = iv.frame.height / 2
        iv.layer.borderColor = UIColor.systemBackground.cgColor
        iv.layer.borderWidth = 2
    }


}

