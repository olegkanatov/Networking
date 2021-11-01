//
//  ImageViewController.swift
//  Networking
//
//  Created by Oleg Kanatov on 28.10.21.
//

import UIKit
import Alamofire

class ImageViewController: UIViewController {
    
    private let url = "https://applelives.com/wp-content/uploads/2016/03/iPhone-SE-11.jpeg"
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
    }
    
    func fetchImage() {
        
        NetworkManager.downloadImage(url: url) { image in
            
            self.activityIndicator.stopAnimating()
            self.imageView.image = image
        }
    }
    
    func fetchDataWithAlamofire() {
        
        AF.request(url).responseData { responceData in
            
            switch responceData.result {
                
            case .success(let data):
                
                guard let image = UIImage(data: data) else { return }
                
                self.activityIndicator.stopAnimating()
                self.imageView.image = image
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
