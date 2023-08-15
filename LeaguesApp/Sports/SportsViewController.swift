//
//  SportsViewController.swift
//  LeaguesApp
//
//  Created by Faustino Pulido Sarmiento on 14/08/23.
//

import UIKit

class SportsViewController: UIViewController {
    
    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var interactor: Interactor<SportsViewController>?
    var leagueName: String = ""
    var teamsFilter: [TeamModel] = []
    var teams: [TeamModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor = Interactor(view: self)
        interactor?.getTeams(leagueName: self.leagueName)

        let leagueCell = UINib(nibName: Constants.sportCellIdentifier, bundle: Bundle.main)
        mainTableView.register(leagueCell, forCellReuseIdentifier: Constants.sportCellIdentifier)
    }

}

extension SportsViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        self.teamsFilter = []
        
        if searchText == "" {
            self.teamsFilter = self.teams
        }else{
            for team in self.teams {
                if team.strTeam.lowercased().contains(searchText.lowercased()){
                    self.teamsFilter.append(team)
                }
            }
        }
        self.mainTableView.reloadData()
    }
}

extension SportsViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.teamsFilter.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.sportCellIdentifier, for: indexPath) as? SportTableViewCell
        let team = self.teamsFilter[indexPath.row]
        cell?.selectionStyle = .none
        cell?.setUI(team)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 112
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = SportDetailsViewController()
        let team = self.teamsFilter[indexPath.row]
        controller.team = team
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    
}

extension SportsViewController : BaseView {
    func showTeams(_ teams: [TeamModel]) {
        self.teams = teams
        self.teamsFilter = teams
        self.mainTableView.reloadData()
    }
    
    func showLeagues(_ Leagues: [LeagueModel]) {
        //
    }
    
    func showError(_ error: Error) {
        print(error)
    }
}
