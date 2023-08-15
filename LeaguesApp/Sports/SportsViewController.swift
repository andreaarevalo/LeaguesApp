//
//  SportsViewController.swift
//  LeaguesApp
//
//  Created by Faustino Pulido Sarmiento on 14/08/23.
//

import UIKit

class SportsViewController: UIViewController {
    
    @IBOutlet weak var mainTableView: UITableView!
    var interactor: Interactor<SportsViewController>?
    var leagueName: String = ""
    var teams: [TeamModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor = Interactor(view: self)
        interactor?.getTeams(leagueName: self.leagueName)

        let leagueCell = UINib(nibName: Constants.SportCellIdentifier, bundle: Bundle.main)
        mainTableView.register(leagueCell, forCellReuseIdentifier: Constants.SportCellIdentifier)
    }

}

extension SportsViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.SportCellIdentifier, for: indexPath) as? SportTableViewCell
        let team = self.teams[indexPath.row]
        cell?.setUI(team)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 112
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = SportDetailsViewController()
        let team = self.teams[indexPath.row]
        controller.team = team
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    
}

extension SportsViewController : BaseView {
    func showTeams(_ teams: [TeamModel]) {
        print(teams.count)
        self.teams = teams
        self.mainTableView.reloadData()
    }
    
    func showLeagues(_ Leagues: [LeagueModel]) {
        //
    }
    
    func showError(_ error: Error) {
        //
    }
    
    
}
