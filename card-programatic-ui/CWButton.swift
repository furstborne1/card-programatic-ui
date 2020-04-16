//
//  CWButton.swift
//  card-programatic-ui
//
//  Created by MARC on 4/15/20.
//  Copyright © 2020 MARC. All rights reserved.
//

import UIKit

class CWButton: UIButton {
    
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backGroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        self.backgroundColor = backGroundColor
        self.setTitle(title, for: .normal)
        configure()
    }
    
    
    
    func configure() {
        layer.cornerRadius = 7
        titleLabel?.font = .systemFont(ofSize: 19, weight: .bold)
        setTitleColor(.white, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }

}
