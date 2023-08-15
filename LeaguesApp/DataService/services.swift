//
//  services.swift
//  LeaguesApp
//
//  Created by Faustino Pulido Sarmiento on 14/08/23.
//

import Foundation
import Alamofire

public typealias onCompletion<T> = (_ input: T) -> Void
public typealias onError = (_ error: Error) -> Void


class DataServices {
    
    static let instance = DataServices()
    
    func request(url: String, onCompletion: @escaping onCompletion<Any> , onError: @escaping onError) {
        
        let headers  = [
            "Content-Type": "application/json"
        ]
        
        var requestUrl =  URL(string: url)
        let encodedUrlString = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        if let url = encodedUrlString {
            requestUrl = URL(string: url)
        }
        

        Alamofire.request(requestUrl ?? url, method: HTTPMethod.get, headers: headers).responseJSON { response in
            switch response.result {
                case .success(let value):
                    onCompletion(value)
                case let .failure(error):
                    print(error)
                    print(url)
                    onError(error)
            }
        }
    }
    
    func LeaguesDataService(onCompletion: @escaping onCompletion<[LeagueModel]>, onError: @escaping onError){
        let url = Constants.leaguesUrl
        
        self.request(url: url, onCompletion: { response in
            guard let responseJSON = response as? [String: Any]
            else { return }
            let leaguesModel = LeaguesModel().fromJsonToLeaguesModel(responseJSON)
            onCompletion(leaguesModel.leagues)
        }, onError: onError)
    }

    func TeamsDataService(leagueName: String , onCompletion: @escaping onCompletion<[TeamModel]>, onError: @escaping onError){
        let url = Constants.teams + leagueName
        
        self.request(url: url, onCompletion: { response in
            guard let responseJSON = response as? [String: Any]
            
            else { return }
            let teamsModel = TeamsModel().fromJsonToTeamsModel(responseJSON)
            
            print(teamsModel.teams.count)
            onCompletion(teamsModel.teams)
        }, onError: onError)
    }
    
}
