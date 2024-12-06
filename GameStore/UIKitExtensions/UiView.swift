//
//  UiView.swift
//  GameStore
//
//  Created by Rafael on 04/12/24.
//

import Foundation
import UIKit

extension UIView {
    func setBackgroundOnTop() {
        let background = UIView()
        background.translatesAutoresizingMaskIntoConstraints = false
        background.backgroundColor = .purple
        self.addSubview(background)

        let foreground = UIView()
        foreground.translatesAutoresizingMaskIntoConstraints = false
        foreground.backgroundColor = .white
        self.addSubview(foreground)

        background.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        background.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        background.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        background.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true

        foreground.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        foreground.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
        foreground.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        foreground.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    var heightConstraint: NSLayoutConstraint? {
        get {
            return constraints.first(where: {
                $0.firstAttribute == .height && $0.relation == .equal
            })
        }
        set { setNeedsLayout() }
    }
}
