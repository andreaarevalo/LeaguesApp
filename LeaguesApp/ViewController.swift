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
    @IBOutlet weak var searchBar: UISearchBar!
    
    var interactor: Interactor<ViewController>?
    var leagues: [LeagueModel] = []
    
    var leaguesFilter: [LeagueModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.interactor = Interactor(view: self)
        
        interactor?.getLeagues()
        
        let leagueCell = UINib(nibName: Constants.leagueCellIdentifier, bundle: Bundle.main)
        mainTableView.register(leagueCell, forCellReuseIdentifier: Constants.leagueCellIdentifier)
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.leaguesFilter.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.leagueCellIdentifier, for: indexPath) as? LeagueTableViewCell
        let league =  self.leaguesFilter[indexPath.row]
        cell?.leagueName.text = league.strLeague
        cell?.sportName.text = league.strSport
        cell?.selectionStyle = .none
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 87
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let SportsViewControllerStoryboar = UIStoryboard(name: Constants.sportsViewController, bundle: nil)
        let SportsViewController = SportsViewControllerStoryboar.instantiateViewController(withIdentifier: Constants.sportsViewControllerStoryboard) as! SportsViewController
        let league = self.leaguesFilter[indexPath.row]
        SportsViewController.leagueName = league.strLeague
        self.navigationController?.pushViewController(SportsViewController, animated: true)
    }
    
}

extension ViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        self.leaguesFilter = []
        
        if searchText == "" {
            self.leaguesFilter = self.leagues
        }else{
            for league in self.leagues {
                if league.strLeague.lowercased().contains(searchText.lowercased()){
                    leaguesFilter.append(league)
                }
            }
        }
        self.mainTableView.reloadData()
    }
}

extension ViewController : BaseView {
    func showTeams(_ teams: [TeamModel]) {
        //
    }
    
    func showLeagues(_ leagues: [LeagueModel]) {
        self.leaguesFilter = leagues
        self.leagues = leagues
        self.mainTableView.reloadData()
    }
    
    func showError(_ error: Error) {
        print(error)
    }
    
    
}

