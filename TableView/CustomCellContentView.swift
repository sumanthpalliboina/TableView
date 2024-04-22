//
//  CustomCellContentView.swift
//  TableView
//
//  Created by Palliboina on 21/04/24.
//

import Foundation
import UIKit

class CustomCellContentView:UIView,UIContentView{
    
    let name = UILabel(frame: .zero)
    let picture = UIImageView(frame: .zero)
    let subName = UILabel(frame: .zero)
    
    var configuration: UIContentConfiguration{
        didSet{
            newConfiguration()
        }
    }
    
    init(configuration:UIContentConfiguration){
        self.configuration = configuration
        super.init(frame: .zero)
        
        picture.translatesAutoresizingMaskIntoConstraints = false
        picture.contentMode = .scaleAspectFit
        self.addSubview(picture)
        
        let cp1 = picture.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        let cp2 = picture.topAnchor.constraint(equalTo: self.topAnchor, constant: 10)
        let cp3 = picture.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        cp3.priority = .defaultLow
        let cp4 = picture.widthAnchor.constraint(equalToConstant: 100)
        let cp5 = picture.heightAnchor.constraint(equalToConstant: 100)
        self.addConstraints([cp1,cp2,cp3,cp4,cp5])
        
        name.translatesAutoresizingMaskIntoConstraints = false
        name.font = UIFont.preferredFont(forTextStyle: .title1)
        self.addSubview(name)
        
        let cn1 = name.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let cn2 = name.trailingAnchor.constraint(equalTo: picture.leadingAnchor, constant: 0)
        let cn3 = name.centerYAnchor.constraint(equalTo: picture.centerYAnchor)
        self.addConstraints([cn1,cn2,cn3])
        
        subName.translatesAutoresizingMaskIntoConstraints = false
        subName.font = UIFont.preferredFont(forTextStyle: .caption1)
        self.addSubview(subName)
        
        let cs1 = subName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let cs2 = subName.trailingAnchor.constraint(equalTo: picture.leadingAnchor, constant: 0)
        let cs3 = subName.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 5)
        //let cs4 = subName.centerYAnchor.constraint(equalTo: picture.centerYAnchor)
        self.addConstraints([cs1,cs2,cs3])
        
        newConfiguration()   //if we dont call this, data will not diaplay
    }
    
    func newConfiguration(){
        if let config = self.configuration as? CustomConfig {
            name.text = config.name
            picture.image = config.picture
            subName.text = config.subName
        }
    }
    
    //UIView conforms to NSCoder protocal which requires this init to archive this view code
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
