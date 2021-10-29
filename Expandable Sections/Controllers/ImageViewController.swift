//
//  ImageViewController.swift
//  Expandable Sections
//
//  Created by Esraa on 29/10/2021.
//

import UIKit

class ImageViewController: UIViewController {
    
    let image: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "dog_owner")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15)
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .orange
        return label
    }()
    



    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupViews()
    }
    
    
    func setupViews(){
        view.addSubview(image)
        view.addSubview(label)
        
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
        
            label.topAnchor.constraint(equalTo: image.bottomAnchor),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        image.setContentHuggingPriority(.defaultLow, for: .vertical)
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)

        
//        image.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
//        label.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
    }



}
