//
//  ViewController.swift

//
//  Created by Надежда Капацина on 21.09.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - UI
    
    private lazy var headerStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .horizontal
        element.alignment = .fill
        element.distribution = .fill
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var searchTextField: UITextField = {
        let element = UITextField()
        element.placeholder = "Search"
        element.borderStyle = .roundedRect
        element.textAlignment = .right
        element.font = .systemFont(ofSize: 25)
        element.textColor = .label
        element.tintColor = .label
        element.backgroundColor = .systemFill
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var searchButton: UIButton = {
        let element = UIButton(type: .system)
        element.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        element.tintColor = .label
        element.addTarget(self, action: #selector(searchPressed), for: .touchUpInside)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    let tableView = UITableView()
    
    // MARK: - Property
    
        var artist = [Artist]()
        let identifire = "cellid"
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupHeaderStackView()
        setupTableView()
        
        
        let anonymousFuncrion = {(fetchArtistList: [Artist]) in
            DispatchQueue.main.async {
                self.artist = fetchArtistList
                self.tableView.reloadData()
            }
        }

        ArtAPIManager.shared.fetchData(oneComplection: anonymousFuncrion)
    }

    // MARK: - Setup Views
    
    func setupHeaderStackView() {
        view.addSubview(headerStackView)
       
        headerStackView.addArrangedSubview(searchTextField)
        headerStackView.addArrangedSubview(searchButton)
        
        NSLayoutConstraint.activate([
            headerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            headerStackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -15),
            headerStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            searchButton.heightAnchor.constraint(equalToConstant: 40),
            searchButton.widthAnchor.constraint(equalToConstant: 40)
                ])
        
    }

//    func textFieldDidEndEditing(_ textField: UITextField) {
//        if let city = searchTextField.text {
//            //weatherManager.fetchWeather(cityName: city )
//        }
//    }

    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.register(ArtistCell.self, forCellReuseIdentifier: identifire)
        tableView.dataSource = self

 
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 15),
                    tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
                ])

        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    // MARK: - Actions

     @objc func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
         print("hello")
    }
}


// MARK: - UiTableViewDataSourse

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifire, for: indexPath)
        
       let artist = artist[indexPath.row]
        
        guard let artistoCell = cell as? ArtistCell else {
            return cell
        }

     
        artistoCell.imageIV.image = UIImage(named: artist.image)
        artistoCell.nameLabel.text = artist.name
        artistoCell.bioLabel.text = artist.bio
        artistoCell.setNeedsLayout()

//        }
       return cell
    }

   }


// MARK: - UiTableViewDelegane

extension MainViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let artist = artist[indexPath.row]
        let detailViewConroller = DetailViewController()
        detailViewConroller.artist = artist
        self.present(detailViewConroller, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let text = artist[indexPath.row].bio
          let width = tableView.frame.width 
          let size = CGSize(width: width, height: .greatestFiniteMagnitude)
        
          let minHeight: CGFloat = 170
          let estimatedHeight = (text as NSString).boundingRect(with: size,
                                                                options: .usesLineFragmentOrigin,
                                                                attributes: [.font: UIFont.systemFont(ofSize: 17)],
                                                                context: nil).height
          
        return max(estimatedHeight + 65, minHeight)
      }
  }

// MARK: UITextFieldDelegate

extension MainViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    private func textFieldDidBeginEditing(_ textField: UITextField) -> Bool {
        if !textField.text!.isEmpty{
            return true
        } else {
            textField.placeholder = "Type something"
            return false
        }
    }
    
//    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
//        if let city = searchTextField.text {
//            //weatherManager.fetchWeather(cityName: city)
//        }
//        searchTextField.text = ""
//    }
    
}

    



