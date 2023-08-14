//
//  ViewController.swift
//  LeaguesApp
//
//  Created by Faustino Pulido Sarmiento on 14/08/23.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var mainTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leagueCell = UINib(nibName: Constants.LeagueCellIdentifier, bundle: Bundle.main)
        mainTableView.register(leagueCell, forCellReuseIdentifier: Constants.LeagueCellIdentifier)
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.LeagueCellIdentifier, for: indexPath) as? LeagueTableViewCell
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 87
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let SportsViewControllerStoryboar = UIStoryboard(name: "SportsViewController", bundle: nil)
        let SportsViewController = SportsViewControllerStoryboar.instantiateViewController(withIdentifier: "SportsViewControllerStoryboard") as! SportsViewController
        self.navigationController?.pushViewController(SportsViewController, animated: true)
    }
    
}

