//
//  FullScreenViewController.swift

//
//  Created by Надежда Капацина on 22.09.2024.
//

import UIKit

class FullScreenViewController: UIViewController {
    
    var fullImage: UIImage?
    
    private lazy var imageView: UIImageView = {
            let iv = UIImageView()
            iv.contentMode = .scaleAspectFit
            iv.translatesAutoresizingMaskIntoConstraints = false
            return iv
        }()

    
   
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(imageView)
                imageView.image = fullImage
                
                NSLayoutConstraint.activate([
                    imageView.topAnchor.constraint(equalTo: view.topAnchor),
                    imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                    imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
                ])
                
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
                imageView.isUserInteractionEnabled = true
                imageView.addGestureRecognizer(tapGesture)
            }
            
            @objc func dismissFullscreenImage() {
                dismiss(animated: true, completion: nil)
            }
        }

    

        
        
    

        
        
     


