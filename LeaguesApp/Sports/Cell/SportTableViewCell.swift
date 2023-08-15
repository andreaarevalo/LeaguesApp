//
//  SportTableViewCell.swift
//  LeaguesApp
//
//  Created by Faustino Pulido Sarmiento on 14/08/23.
//

import UIKit

class SportTableViewCell: UITableViewCell {

    @IBOutlet weak var StadiumName: UILabel!
    @IBOutlet weak var teamBadge: UILabel!
    @IBOutlet weak var badgeImageView: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUI(_ team : TeamModel) {
        self.StadiumName.text = team.strStadium
        self.teamName.text = team.strTeam
        Utils.loadImageWithUrlForImageView(url:team.strTeamBadge , imageView: badgeImageView)
    }
    
}
