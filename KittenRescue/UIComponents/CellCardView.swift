//
//  CellCardView.swift
//  KittenRescue
//
//  Created by Wesley Otero on 4/12/20.
//  Copyright © 2020 Wesley Otero. All rights reserved.
//

import UIKit

class CellCardView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configuration()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configuration()
    }
    
    func configuration(){
        layer.cornerRadius = 10
        backgroundColor = .white
    }
}
