//
//  SportsViewController.swift
//  LeaguesApp
//
//  Created by Faustino Pulido Sarmiento on 14/08/23.
//

import UIKit

class SportsViewController: UIViewController {
    
    @IBOutlet weak var mainTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let leagueCell = UINib(nibName: Constants.SportCellIdentifier, bundle: Bundle.main)
        mainTableView.register(leagueCell, forCellReuseIdentifier: Constants.SportCellIdentifier)
    }

}

extension SportsViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.SportCellIdentifier, for: indexPath) as? SportTableViewCell
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 112
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = SportDetailsViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    
}
