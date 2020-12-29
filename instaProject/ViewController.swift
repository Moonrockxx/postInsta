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
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var postLabel: UILabel!
    
    var isLiked = false
    var newProfile: UIImageView?
    var baseLikes = 420
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setIVProfil(profilIV)
        imageLikes.forEach { (image) in
            setIVProfil(image)
        }
        setupDoubleTap()
        profilIV.isUserInteractionEnabled = true
        updateLikeLabel()
        setupAttributeString("Thomas Ferré", "Une journée géniale au Staples Center", ["NBA", "Lakers", "Travel"])
    }
    
    func setupAttributeString(_ username: String, _ desc: String, _ hashtags: [String]) {
        let attributedString = NSMutableAttributedString(string: username + ": ", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
        let secondString = NSAttributedString(string: desc, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13)])
        attributedString.append(secondString)
        
        var hashtagString = " "
        hashtags.forEach { (hash) in
            let str = "#" + hash + " "
            hashtagString.append(str)
        }
        let thirdString = NSAttributedString(string: hashtagString, attributes: [NSAttributedString.Key.font: UIFont.italicSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.systemBlue
            ])
        attributedString.append(thirdString)
        
        postLabel.attributedText = attributedString
    }
    
    func setIVProfil(_ iv: UIImageView) {
        iv.layer.cornerRadius = iv.frame.height / 2
        iv.layer.borderColor = UIColor.systemBackground.cgColor
        iv.layer.borderWidth = 2
    }

    func setupDoubleTap() {
        postImage.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(addOrRemoveLike))
        tap.numberOfTapsRequired = 2
        postImage.addGestureRecognizer(tap)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let first = touches.first {
            if first.view == profilIV {
                if newProfile == nil {
                    newProfile = UIImageView(frame: view.bounds)
                    newProfile?.image = UIImage(named: "images")
                    newProfile?.contentMode = .scaleAspectFill
                    view.addSubview(newProfile!)
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        newProfile?.removeFromSuperview()
        newProfile = nil
    }
    
    func updateLikeLabel() {
        baseLikes = isLiked ? 421 : 420
        let likesString = "\(baseLikes) j'aime"
        likesLabel.text = likesString
    }

    @objc func addOrRemoveLike() {
        isLiked.toggle()
        let imageString = isLiked ? "heart.fill" : "heart"
        likeButton.setImage(UIImage(systemName: imageString), for: .normal)
        updateLikeLabel()
    }
    
    
    @IBAction func likePressed(_ sender: Any) {
        addOrRemoveLike()
    }
    
    @IBAction func otherButtonPressed(_ sender: UIButton) {
        switch sender.tag {
        case 1: print("Commentaire")
        case 2: print("Partager")
        case 3: print("Sauvegarder")
        default: return
        }
    }
}

