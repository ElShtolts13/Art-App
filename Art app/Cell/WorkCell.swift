//
//  WorkCell.swift

//
//  Created by Надежда Капацина on 22.09.2024.
//

import UIKit

class WorkCell: UITableViewCell {
    
    
    var workImageIV = UIImageView()
    let titleLabel = UILabel()
    let infoLabel = UILabel()
    let fullScreenButton = UIButton()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
      setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
  
    func setupView() {

        setupTitleLabel()
        setupWorkImageIV()
        setupButton()
        setupInfoLabel()
      
    }
    
    func setupTitleLabel() {
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 15)
                ])
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: "Verdana-Bold", size: 15 )
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
    }
   
    func setupWorkImageIV() {
        addSubview(workImageIV)
        
        workImageIV.contentMode = .scaleAspectFit
        NSLayoutConstraint.activate([
            workImageIV.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            workImageIV.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            workImageIV.widthAnchor.constraint(equalToConstant: 250),
            workImageIV.heightAnchor.constraint(equalToConstant: 200)
                ])
        workImageIV.translatesAutoresizingMaskIntoConstraints = false
        
    }
  
    func setupButton() {
        addSubview(fullScreenButton)
        
        fullScreenButton.setImage(UIImage(systemName: "plus.magnifyingglass"), for: .normal)
        fullScreenButton.tintColor = .white
        NSLayoutConstraint.activate([
            fullScreenButton.trailingAnchor.constraint(equalTo: workImageIV.trailingAnchor),
            fullScreenButton.bottomAnchor.constraint(equalTo: workImageIV.bottomAnchor),
            
            fullScreenButton.widthAnchor.constraint(equalToConstant: 50),
            fullScreenButton.heightAnchor.constraint(equalToConstant: 50)
                ])
        
        fullScreenButton.translatesAutoresizingMaskIntoConstraints = false
        
        fullScreenButton.addTarget(self, action: #selector(fullScreenButtonPressed), for: .touchUpInside)
    }
    
    @objc func fullScreenButtonPressed() {
        print("press")
    }
    
    func setupInfoLabel() {
        addSubview(infoLabel)
        
        NSLayoutConstraint.activate([
            infoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            infoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            infoLabel.topAnchor.constraint(equalTo: workImageIV.bottomAnchor, constant: 10)
                ])
        infoLabel.textAlignment = .justified
        infoLabel.numberOfLines = 0
        infoLabel.font = UIFont(name: "Verdana", size: 14)
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        
    }
        
}
