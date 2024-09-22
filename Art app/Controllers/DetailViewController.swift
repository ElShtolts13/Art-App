//
//  DetailViewController.swift

//
//  Created by Надежда Капацина on 22.09.2024.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - UI
    
    private lazy var artistLabel: UILabel = {
        let element = UILabel()
        element.font = UIFont(name: "Verdana-Bold", size: 17)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    let detailTableView = UITableView()
    
    // MARK: - Property
    
    var artist: Artist?
    
    let identifire = "detailCellid"

    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupArtistLabel()
        setupDetailTableView()

    }

    
    // MARK: - SetupView
    
    
    func setupArtistLabel() {
        view.addSubview(artistLabel)
        
        NSLayoutConstraint.activate([
            artistLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            artistLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
                ])
        artistLabel.text = artist?.name
    }

    func setupDetailTableView() {
        view.addSubview(detailTableView)
        detailTableView.delegate = self
        detailTableView.register(WorkCell.self, forCellReuseIdentifier: identifire)
        detailTableView.dataSource = self

 
        NSLayoutConstraint.activate([
            detailTableView.topAnchor.constraint(equalTo: artistLabel.bottomAnchor, constant: 15),
            detailTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
                ])

        detailTableView.translatesAutoresizingMaskIntoConstraints = false
    }

}

// MARK: - UiTableViewDataSourse

extension DetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artist?.works.count ?? 0

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifire, for: indexPath)
        
        guard let work = artist?.works[indexPath.row] else {
                    return cell
                }

        guard let workCell = cell as? WorkCell else {
            return cell
        }

        workCell.titleLabel.text = work.title
        workCell.workImageIV.image = UIImage(named: work.image)
        workCell.infoLabel.text = work.info
        
       return cell
    }

   }


// MARK: - UiTableViewDelegane

extension DetailViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let work = artist?.works[indexPath.row]
        
        let fullScreenVC = FullScreenViewController()
        
        fullScreenVC.fullImage = UIImage(named: work?.image ?? "")
        
        
        self.present(fullScreenVC, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       

        let text = artist?.works[indexPath.row].info ?? ""
          let width = tableView.frame.width
          let size = CGSize(width: width, height: .greatestFiniteMagnitude)
        
          let minHeight: CGFloat = 260
          let estimatedHeight = (text as NSString).boundingRect(with: size,
                                                                options: .usesLineFragmentOrigin,
                                                                attributes: [.font: UIFont.systemFont(ofSize: 14)],
                                                                context: nil).height
          
        return max(estimatedHeight + 300, minHeight)
      }
  }
