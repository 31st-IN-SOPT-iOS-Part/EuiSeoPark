//
//  AddSubViews.swift
//  IN_SOPT_First_Task
//
//  Created by 박의서 on 2022/10/09.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
