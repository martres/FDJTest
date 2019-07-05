//
//  TeamViewCell.swift
//  FootFDJ
//
//  Created by Martreux Steven on 03/07/2019.
//  Copyright © 2019 Martreux Steven. All rights reserved.
//

import UIKit

class TeamViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var name: UILabel!
    @IBOutlet private weak var logo: UIImageView!
    
    func setup(_ team: TeamList.getTeams.ViewModel.Team) {
        name.text = team.name
    }
}
