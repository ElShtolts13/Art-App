//
//  Cell.swift

//
//  Created by Надежда Капацина on 21.09.2024.
//


import UIKit

class ArtistCell: UITableViewCell {
    
    
    var imageIV = UIImageView()
    let nameLabel = UILabel()
    let bioLabel = UILabel()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
      setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
  
    func setupView() {

          
        setupImageView()
        setupNameLabel()
        setupBioLabel()
      
    }
   
    func setupImageView() {
        addSubview(imageIV)
        
        imageIV.contentMode = .scaleToFill
        NSLayoutConstraint.activate([
            imageIV.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            imageIV.topAnchor.constraint(greaterThanOrEqualTo: self.topAnchor, constant: 10),
            imageIV.widthAnchor.constraint(equalToConstant: 140),
            imageIV.heightAnchor.constraint(equalToConstant: 130)
                ])
        imageIV.translatesAutoresizingMaskIntoConstraints = false
        
    }
  
    func setupNameLabel() {
        addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: imageIV.trailingAnchor, constant: 15),
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5)
                ])
        
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont(name: "Verdana-Bold", size: 15 )
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func setupBioLabel() {
        addSubview(bioLabel)
        
       
        NSLayoutConstraint.activate([
            bioLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            bioLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            bioLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor)
                ])
        bioLabel.contentMode = .scaleAspectFill
        bioLabel.textAlignment = .justified
        bioLabel.numberOfLines = 0
        bioLabel.font = UIFont(name: "Verdana", size: 12)
        bioLabel.translatesAutoresizingMaskIntoConstraints = false
        
    }
        
}
