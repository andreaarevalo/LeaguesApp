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
    
    var interactor: Interactor<ViewController>?
    var leagues: [LeagueModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.interactor = Interactor(view: self)
        
        interactor?.getLeagues()
        
        let leagueCell = UINib(nibName: Constants.LeagueCellIdentifier, bundle: Bundle.main)
        mainTableView.register(leagueCell, forCellReuseIdentifier: Constants.LeagueCellIdentifier)
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.leagues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.LeagueCellIdentifier, for: indexPath) as? LeagueTableViewCell
        let league =  self.leagues[indexPath.row]
        cell?.leagueName.text = league.strLeague
        cell?.sportName.text = league.strSport
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 87
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let SportsViewControllerStoryboar = UIStoryboard(name: "SportsViewController", bundle: nil)
        let SportsViewController = SportsViewControllerStoryboar.instantiateViewController(withIdentifier: "SportsViewControllerStoryboard") as! SportsViewController
        let league = self.leagues[indexPath.row]
        SportsViewController.leagueName = league.strLeague
        self.navigationController?.pushViewController(SportsViewController, animated: true)
    }
    
}
extension ViewController : BaseView {
    func showTeams(_ teams: [TeamModel]) {
        //
    }
    
    func showLeagues(_ leagues: [LeagueModel]) {
        self.leagues = leagues
        self.mainTableView.reloadData()
    }
    
    func showError(_ error: Error) {
        //
    }
    
    
}

