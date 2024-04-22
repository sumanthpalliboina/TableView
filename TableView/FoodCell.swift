//
//  FoodCell.swift
//  TableView
//
//  Created by Palliboina on 21/04/24.
//

import Foundation
import UIKit

class FoodCell: UITableViewCell {
    var item:ItemData!
    
    override func updateConfiguration(using state: UICellConfigurationState) {
        var config = self.defaultContentConfiguration()
        //var config = UIListContentConfiguration.valueCell()
        config.text = item.name
        config.textProperties.color = .systemBlue
        config.secondaryText = "\(item.calories) Calories"
        config.secondaryTextProperties.color = .systemGray
        config.image = UIImage(named: item.image)
        config.imageProperties.maximumSize = CGSize(width: 70, height: 70)
        //config.prefersSideBySideTextAndSecondaryText = true
        //config.textToSecondaryTextVerticalPadding = 14
        //config.imageToTextPadding = 44
        self.contentConfiguration = config
        
        //Note: configurationUpdateHandler closure is no need because we have state
        
        var backgroundConfig = UIBackgroundConfiguration.listPlainCell().updated(for: state)
        if state.isSelected {
            backgroundConfig.backgroundColor = .systemMint
        }else{
            backgroundConfig.backgroundColor = .systemGray6
        }
        
        backgroundConfig.backgroundInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        backgroundConfig.cornerRadius = 10
        backgroundConfig.strokeWidth = 3
        backgroundConfig.strokeColor = .brown
        self.backgroundConfiguration = backgroundConfig

    }
}
