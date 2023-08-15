//
//  Constants.swift
//  LeaguesApp
//
//  Created by Faustino Pulido Sarmiento on 14/08/23.
//

import Foundation

struct Constants {
    static let leaguesUrl = "https://www.thesportsdb.com/api/v1/json/3/all_leagues.php"
    static let teams =  "https://www.thesportsdb.com/api/v1/json/3/search_all_teams.php?l="
    
    //Cells
    static let leagueCellIdentifier = "LeagueTableViewCell"
    static let sportCellIdentifier = "SportTableViewCell"
    
    static let sportsViewControllerStoryboard = "SportsViewControllerStoryboard"
    static let sportsViewController = "SportsViewController"
}
