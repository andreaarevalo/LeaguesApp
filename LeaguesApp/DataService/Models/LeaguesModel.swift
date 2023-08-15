//
//  LeaguesModel.swift
//  LeaguesApp
//
//  Created by Faustino Pulido Sarmiento on 15/08/23.
//

import Foundation

struct LeaguesModel {
    var leagues: [LeagueModel] = []
    
    func fromJsonToLeaguesModel(_ serialized: [String: Any]) -> LeaguesModel {
      var newLeagues = LeaguesModel()
        let data = Dictionary<String, Any>()
        if let validLeagues = serialized["leagues"] as? Array<AnyObject> {
            print("LEAGUES ")
            for league in validLeagues {
                if let leagueModel = LeagueModel().fromJsonLeagueModel(league) {
                    newLeagues.leagues.append(leagueModel)
                }
           }
        }
      return newLeagues
    }
}

struct LeagueModel {
    var idLeague : String = ""
    var strLeague : String = ""
    var strSport : String = ""
    var strLeagueAlternate : String = ""
    
    func fromJsonLeagueModel(_ serialized: AnyObject?) -> LeagueModel? {
        if let validJson = serialized {
            var newLeague = LeagueModel()
            newLeague.idLeague = validJson["idLeague"] as? String ?? ""
            newLeague.strLeague = validJson["strLeague"] as? String ?? ""
            newLeague.strSport = validJson["strSport"] as? String ?? ""
            newLeague.strLeagueAlternate = validJson["strLeagueAlternate"] as? String ?? ""
            return newLeague
        }
        return nil
    }
}
