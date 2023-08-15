//
//  SportDetailsViewController.swift
//  LeaguesApp
//
//  Created by Faustino Pulido Sarmiento on 14/08/23.
//

import UIKit

class SportDetailsViewController: UIViewController {
    
    var team: TeamModel?

    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var formedYear: UILabel!
    @IBOutlet weak var sportName: UILabel!
    @IBOutlet weak var stadiumDescription: UILabel!
    @IBOutlet weak var stadiumCapacity: UILabel!
    @IBOutlet weak var stadiumName: UILabel!
    @IBOutlet weak var badgeImageView: UIImageView!
    @IBOutlet weak var descriptionTeam: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI(self.team!)
    }
    
    func setUI(_ team: TeamModel) {
        self.teamName.text = team.strTeam
        self.formedYear.text = team.intFormedYear
        self.sportName.text = team.strSport
        self.stadiumDescription.text = team.strStadiumDescription
        self.stadiumCapacity.text = team.intStadiumCapacity
        self.descriptionTeam.text = team.strDescriptionEN
        self.setImage()
    }
    
    func setImage(){
        if let team = self.team {
            Utils.loadImageWithUrlForImageView(url:team.strTeamBadge , imageView: badgeImageView)
        }
    }

}
