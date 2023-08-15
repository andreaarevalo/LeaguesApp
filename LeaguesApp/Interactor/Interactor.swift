//
//  Interactor.swift
//  LeaguesApp
//
//  Created by Faustino Pulido Sarmiento on 15/08/23.
//

import Foundation

protocol BaseView: AnyObject{
    func showLeagues(_ leagues: [LeagueModel])
    func showTeams(_ teams: [TeamModel])
    func showError(_ error: Error)
}


class Interactor<V: BaseView> {
    
    weak var view: V?
    var dataServices = DataServices.instance
    
    required init(view: V){
        self.view = view
    }
    
    func getLeagues() {
        self.dataServices.LeaguesDataService(onCompletion: {reponse in
            print(reponse.count)
            self.view?.showLeagues(reponse)
        }, onError: { error in
            self.view?.showError(error)
            
        })
    }
    
    func getTeams(leagueName: String){
        self.dataServices.TeamsDataService(leagueName: leagueName, onCompletion: {response in
            self.view?.showTeams(response)
        }, onError: { error in
            self.view?.showError(error)
        })
    }
}

