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
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var instagramButton: UIButton!
    
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
        self.facebookButton.isHidden = team.strFacebook.isEmpty
        self.instagramButton.isHidden = team.strInstagram.isEmpty
        self.setImage()
    }
    
    func setImage(){
        if let team = self.team {
            Utils.loadImageWithUrlForImageView(url:team.strTeamBadge , imageView: badgeImageView)
        }
    }
    
    @IBAction func didiTapFacebook(_ sender: Any) {
        if let team = self.team {
            self.openFacebookOrInstagram(team.strFacebook, "https://www.facebook.com/")
        }
       
    }
    
    @IBAction func didTapInstagram(_ sender: Any) {
        if let team = self.team {
            self.openFacebookOrInstagram(team.strInstagram, "https://www.instagram.com/")
        }
    }
    
    func openFacebookOrInstagram(_ url: String, _ web: String) {
        let appURL = URL(string: url)!
                
        if UIApplication.shared.canOpenURL(appURL) {
            UIApplication.shared.open(appURL, options: [:], completionHandler: nil)
        } else {
           let webURL = URL(string: web)!
           UIApplication.shared.open(webURL, options: [:], completionHandler: nil)
        }
    }
}
