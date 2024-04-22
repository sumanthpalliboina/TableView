//
//  FruitCell.swift
//  TableView
//
//  Created by Palliboina on 21/04/24.
//

import Foundation

import UIKit

class FruitCell: UITableViewCell{
    private var customView:UIListContentView!
    private var customBtn:UIButton!
    var item:ItemData!
    
    override func updateConfiguration(using state: UICellConfigurationState) {
        createViews()
        
        if let configuration = self.customView.configuration as? UIListContentConfiguration {
            var config = configuration.updated(for: state)
            config.text = item.name
            config.secondaryText = "\(item.calories) Calories"
            config.image = UIImage(named: item.image)
            config.imageProperties.maximumSize = CGSize(width: 60, height: 60)
            //config.prefersSideBySideTextAndSecondaryText = true
            self.customView.configuration = config
        }
    }
    
    func createViews(){
        guard contentView.viewWithTag(999) == nil else {
            return
        }
        
        customView = UIListContentView(configuration: .subtitleCell())
        customView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(customView)
        
        customView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8).isActive = true
        customView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8).isActive = true
        customView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 8).isActive = true
        
        customBtn = UIButton(configuration: .plain(), primaryAction: UIAction(image:UIImage(systemName: "trash"),handler: { [unowned self] action in
            deleteFruit()
        }))
        customBtn.translatesAutoresizingMaskIntoConstraints = false
        customBtn.tag = 999
        self.contentView.addSubview(customBtn)
        
        customBtn.leadingAnchor.constraint(equalTo: customView.trailingAnchor, constant: 8).isActive = true
        customBtn.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16).isActive = true
        customBtn.centerYAnchor.constraint(equalTo: customView.centerYAnchor).isActive=true
        customBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        customBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    func deleteFruit(){
        appData.items.removeAll(where: {$0.id == item.id})
        
        var currentSnapshot = appData.dataSource.snapshot()
        currentSnapshot.deleteItems([item.id])
        appData.dataSource.apply(currentSnapshot)
    }
}
