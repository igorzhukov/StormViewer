//
//  DetailViewController.swift
//  P1_Storm Viewer
//
//  Created by Igor Zhukov on 1/25/17.
//  Copyright © 2017 Igor Zhukov. All rights reserved.
//

import UIKit
import Social


class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedImage
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        if let imageToLoad = selectedImage {
            imageView.image  = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    func shareTapped() {
        // way 1: creates another view controller where user can choose app to share to
        let vc = UIActivityViewController(activityItems: [imageView.image!], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem 
        present(vc, animated: true)
        
        // way 2: directly Facebook specifying to share to
        // works as well :)
        /* if let vc = SLComposeViewController(forServiceType: SLServiceTypeFacebook) {
         vc.setInitialText("Look at this great picture!")
         vc.add(imageView.image!)
         vc.add(URL(string: "http://www.photolib.noaa.gov/nssl"))
         present(vc, animated: true)
         } */
    }
    
}
