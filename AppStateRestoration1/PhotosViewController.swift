//
//  PhotosViewController.swift
//  StateRestoration1
//
//  Created by vaishanavi.sasane on 21/08/24.
//

import UIKit

enum SuperHeroType: Int {
    case batman = 0
    case ironman
}

class PhotosViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var superHeroImageView: UIImageView!
    
    /// Variables
    var selectedSuperheroId: SuperHeroType = .ironman
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    ///  Switch between items
    @IBAction func switchItems(_ sender: UIButton) {
        selectedSuperheroId = selectedSuperheroId == .ironman ? .batman : .ironman
        setImage()
    }
    
    /// set the image to imageView
    private func setImage() {
        superHeroImageView.image = selectedSuperheroId == .ironman ? #imageLiteral(resourceName: "ironman") : #imageLiteral(resourceName: "batman")
    }
   
}

/// UIStateRestoring delegates
extension PhotosViewController {
    override func encodeRestorableState(with coder: NSCoder) {
        coder.encode(selectedSuperheroId.rawValue, forKey: "imageId")
        super.encodeRestorableState(with: coder)
    }

    override func decodeRestorableState(with coder: NSCoder) {
        guard let id = SuperHeroType(rawValue: coder.decodeInteger(forKey: "imageId")) else { return }
        selectedSuperheroId =  id
        setImage()
    }
}
