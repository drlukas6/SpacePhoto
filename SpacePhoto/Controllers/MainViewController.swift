//
//  MainViewController.swift
//  SpacePhoto
//
//  Created by Lukas Sestic on 28/02/2018.
//  Copyright © 2018 Lukas Sestic. All rights reserved.
//

import UIKit



class MainViewController: UIViewController {
    
    @IBOutlet weak var nasaImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var copyrightLabel: UILabel!
    
    let photoInfoController = PhotoInfoController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        print("App loaded")
        
        descriptionLabel.text = ""
        copyrightLabel.text = ""
        
        photoInfoController.fetchphotoInfo{
            (photoInfo) in
            if let photoInfo = photoInfo {
                self.updateUI(photoInfo: photoInfo)
            }
            else {
                print("Error while loading photoImage")
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func updateUI(photoInfo: PhotoInfo) {
        let task = URLSession.shared.dataTask(with: photoInfo.url) {
            (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.nasaImageView.image = image
                    self.title = photoInfo.title
                    self.descriptionLabel.text = photoInfo.description
                    self.copyrightLabel.text = photoInfo.copyright ?? ""
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
            }
        }
        task.resume()
    }
    
    
}
