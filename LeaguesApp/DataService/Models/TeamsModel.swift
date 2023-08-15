//
//  LeaguesModel.swift
//  LeaguesApp
//
//  Created by Faustino Pulido Sarmiento on 15/08/23.
//

import Foundation

struct TeamsModel {
    var teams: [TeamModel] = []
    
    func fromJsonToTeamsModel(_ serialized: [String: Any]) -> TeamsModel {
      var newTeams = TeamsModel()
        if let validTeams = serialized["teams"] as? Array<AnyObject> {
            for team in validTeams {
                if let teamModel = TeamModel().fromJsonTeamModel(team) {
                    newTeams.teams.append(teamModel)
                }
           }
        }
      return newTeams
    }
}

struct TeamModel {
    var idTeam: String = ""
    var strTeamBadge : String = ""
    var strTeam : String = ""
    var strStadium : String = ""
    var intFormedYear : String = ""
    var strSport : String = ""
    var strDescriptionEN : String = ""
    var intStadiumCapacity : String = ""
    var strStadiumDescription : String = ""
    var strFacebook : String = ""
    var strInstagram : String = ""
    
    
    func fromJsonTeamModel(_ serialized: AnyObject?) -> TeamModel? {
        if let validJson = serialized {
            var newLeague = TeamModel()
            newLeague.idTeam = validJson["idTeam"] as? String ?? ""
            newLeague.strTeamBadge = validJson["strTeamBadge"] as? String ?? ""
            newLeague.strTeam = validJson["strTeam"] as? String ?? ""
            newLeague.strStadium = validJson["strStadium"] as? String ?? ""
            newLeague.intFormedYear = validJson["intFormedYear"] as? String ?? ""
            newLeague.strSport = validJson["strSport"] as? String ?? ""
            newLeague.strDescriptionEN = validJson["strDescriptionEN"] as? String ?? ""
            newLeague.intStadiumCapacity = validJson["intStadiumCapacity"] as? String ?? ""
            newLeague.strStadiumDescription = validJson["strStadiumDescription"] as? String ?? ""
            newLeague.strFacebook = validJson["strFacebook"] as? String ?? ""
            newLeague.strInstagram = validJson["strInstagram"] as? String ?? ""
            return newLeague
        }
        return nil
    }
}
