//
//  StarShape.swift
//  ProductFeatureUI
//
//  Created by Dhruv Jaiswal on 02/12/23.
//

import SwiftUI

struct StartShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.52806*width, y: 0.06957*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0.05208*height), control1: CGPoint(x: 0.52281*width, y: 0.05887*height), control2: CGPoint(x: 0.51192*width, y: 0.05208*height))
        path.addCurve(to: CGPoint(x: 0.47194*width, y: 0.06957*height), control1: CGPoint(x: 0.48808*width, y: 0.05208*height), control2: CGPoint(x: 0.47719*width, y: 0.05887*height))
        path.addLine(to: CGPoint(x: 0.35418*width, y: 0.30968*height))
        path.addLine(to: CGPoint(x: 0.12045*width, y: 0.34408*height))
        path.addCurve(to: CGPoint(x: 0.09532*width, y: 0.36521*height), control1: CGPoint(x: 0.10875*width, y: 0.34581*height), control2: CGPoint(x: 0.09903*width, y: 0.35398*height))
        path.addCurve(to: CGPoint(x: 0.10294*width, y: 0.39714*height), control1: CGPoint(x: 0.09162*width, y: 0.37644*height), control2: CGPoint(x: 0.09457*width, y: 0.3888*height))
        path.addLine(to: CGPoint(x: 0.2782*width, y: 0.57174*height))
        path.addLine(to: CGPoint(x: 0.21953*width, y: 0.83017*height))
        path.addCurve(to: CGPoint(x: 0.23086*width, y: 0.86179*height), control1: CGPoint(x: 0.21684*width, y: 0.84202*height), control2: CGPoint(x: 0.22126*width, y: 0.85435*height))
        path.addCurve(to: CGPoint(x: 0.26431*width, y: 0.86487*height), control1: CGPoint(x: 0.24046*width, y: 0.86924*height), control2: CGPoint(x: 0.25351*width, y: 0.87044*height))
        path.addLine(to: CGPoint(x: 0.5*width, y: 0.74349*height))
        path.addLine(to: CGPoint(x: 0.73569*width, y: 0.86487*height))
        path.addCurve(to: CGPoint(x: 0.76914*width, y: 0.86179*height), control1: CGPoint(x: 0.74649*width, y: 0.87044*height), control2: CGPoint(x: 0.75954*width, y: 0.86924*height))
        path.addCurve(to: CGPoint(x: 0.78048*width, y: 0.83017*height), control1: CGPoint(x: 0.77874*width, y: 0.85435*height), control2: CGPoint(x: 0.78316*width, y: 0.84202*height))
        path.addLine(to: CGPoint(x: 0.7218*width, y: 0.57174*height))
        path.addLine(to: CGPoint(x: 0.89706*width, y: 0.39714*height))
        path.addCurve(to: CGPoint(x: 0.90468*width, y: 0.36521*height), control1: CGPoint(x: 0.90543*width, y: 0.3888*height), control2: CGPoint(x: 0.90838*width, y: 0.37644*height))
        path.addCurve(to: CGPoint(x: 0.87955*width, y: 0.34408*height), control1: CGPoint(x: 0.90097*width, y: 0.35398*height), control2: CGPoint(x: 0.89125*width, y: 0.34581*height))
        path.addLine(to: CGPoint(x: 0.64582*width, y: 0.30968*height))
        path.addLine(to: CGPoint(x: 0.52806*width, y: 0.06957*height))
        path.closeSubpath()

        return path
    }
}
