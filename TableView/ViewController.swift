//
//  ViewController.swift
//  TableView
//
//  Created by Palliboina on 20/04/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var myTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTable.register(UITableViewCell.self, forCellReuseIdentifier: "myCell")
        //myTable.rowHeight = 100
        //myTable.separatorStyle = .none
        myTable.delegate = self
        prepareDataSource()
        prepareSnapshot()
    }
    
    func prepareDataSource(){
        appData.dataSource = UITableViewDiffableDataSource<Sections,ItemData.ID>(tableView: myTable, cellProvider: { tableView, indexPath, itemID in
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for:indexPath)
            
            if let item = appData.items.first(where: {$0.id == itemID}) {
                
                //cell.item = item
                
                /* var config = cell.defaultContentConfiguration()
                //var config = UIListContentConfiguration.valueCell()
                config.text = item.name
                config.textProperties.color = .systemBlue
                config.secondaryText = "\(item.calories) Calories"
                config.secondaryTextProperties.color = .systemGray
                config.image = UIImage(named: item.image)
                config.imageProperties.maximumSize = CGSize(width: 70, height: 70)
                cell.contentConfiguration = config */
                
                cell.configurationUpdateHandler = { cell, state in
                    
                    var config = cell.defaultContentConfiguration()
                    config.text = item.name
                    //config.textProperties.color = .systemBlue
                    config.secondaryText = "\(item.calories) Calories"
                    config.secondaryTextProperties.color = .systemGray
                    config.image = UIImage(named: item.image)
                    config.imageProperties.maximumSize = CGSize(width: 70, height: 70)
                    cell.contentConfiguration = config
                    
                    cell.accessoryType = item.selected ? .checkmark : .none
                    
                    /* var backgroundConfig = UIBackgroundConfiguration.listPlainCell().updated(for: state)
                    if state.isSelected {
                        backgroundConfig.backgroundColor = .systemMint
                    }else{
                        backgroundConfig.backgroundColor = .systemGray6
                    }
                    backgroundConfig.backgroundInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
                    backgroundConfig.cornerRadius = 10
                    backgroundConfig.strokeWidth = 3
                    backgroundConfig.strokeColor = .brown
                    cell.backgroundConfiguration = backgroundConfig  */
                }
            }
            
            return cell
            
        })
    }
    
    func prepareSnapshot(){
        var snapshot = NSDiffableDataSourceSnapshot<Sections,ItemData.ID>()
        snapshot.appendSections([.main])
        snapshot.appendItems(appData.items.map({$0.id}))
        appData.dataSource.apply(snapshot)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let itemId = appData.dataSource.itemIdentifier(for: indexPath) {
            if let item = appData.items.first(where: {$0.id == itemId}) {
                item.selected.toggle()
            }
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

