//
//  TeamViewCell.swift
//  FootFDJ
//
//  Created by Martreux Steven on 03/07/2019.
//  Copyright © 2019 Martreux Steven. All rights reserved.
//

import UIKit
import Kingfisher

class TeamViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var name: UILabel!
    @IBOutlet private weak var logo: UIImageView!
    
    func setup(_ team: TeamList.getTeams.ViewModel.Team) {
        name.text = team.name
        let url = URL(string: team.urlLogo)
        let processor = DownsamplingImageProcessor(size: logo.frame.size)
        logo.kf.indicatorType = .activity
        logo.kf.setImage(
            with: url,
            placeholder: UIImage(named: "placeholder_team"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
    }
}
