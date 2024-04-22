//
//  CustomContentViewCell.swift
//  TableView
//
//  Created by Palliboina on 21/04/24.
//

import Foundation
import UIKit

class CustomContentViewCell:UITableViewCell{
    var item:ItemData!
    
    override func updateConfiguration(using state: UICellConfigurationState) {
        let config = CustomConfig().updated(for: state)
        config.name = item.name
        config.picture = UIImage(named: item.image)
        config.subName = "\(item.calories) Calories"
        self.contentConfiguration = config       //this calls makeContentView method in customConfig class
        
        
        var bgConfig = UIBackgroundConfiguration.listPlainCell().updated(for: state)
        if state.isSelected {
            bgConfig.backgroundColor = .systemBrown
        }else{
            bgConfig.backgroundColor = .systemGray5
        }
        bgConfig.backgroundInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        bgConfig.cornerRadius = 10
        bgConfig.strokeWidth = 3
        bgConfig.strokeColor = .brown
        self.backgroundConfiguration = bgConfig
        
    }
    
}
