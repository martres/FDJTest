//
//  PlayerViewCell.swift
//  FootFDJ
//
//  Created by Martreux Steven on 04/07/2019.
//  Copyright © 2019 Martreux Steven. All rights reserved.
//

import UIKit
import Kingfisher

class PlayerViewCell: UITableViewCell {

    @IBOutlet private weak var picture: UIImageView!
    @IBOutlet private weak var name: UILabel!
    @IBOutlet private weak var birthDate: UILabel!
    @IBOutlet private weak var position: UILabel!
    @IBOutlet private weak var price: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0))
    }
    
    func setup(with player: TeamDetail.getPlayers.ViewModel.Player) {
        name.text = player.name
        birthDate.text = "birthDate: \(player.birthDate)"
        position.text = player.position
        price.text = "price \(player.price)"
        
        let url = URL(string: player.pictureURL ?? "")
        let processor = DownsamplingImageProcessor(size: picture.frame.size)
        picture.kf.indicatorType = .activity
        picture.kf.setImage(
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
