//
//  CustomShape.swift
//  Chili Test Task
//
//  Created by Артур Олехно on 18/04/2023.
//

import SwiftUI

struct CustomShape : Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight, .bottomLeft], cornerRadii: .zero)
        return Path(path.cgPath)
    }

}
