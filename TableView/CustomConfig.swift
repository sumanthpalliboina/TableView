//
//  CustomConfig.swift
//  TableView
//
//  Created by Palliboina on 21/04/24.
//

import Foundation
import UIKit

class CustomConfig:UIContentConfiguration{
    var name:String!
    var picture:UIImage!
    var subName:String!
    
    func makeContentView() -> any UIView & UIContentView {
        let content = CustomCellContentView(configuration: self)
        return content
    }
    
    func updated(for state: any UIConfigurationState) -> Self {
        return self
    }
}
