import UIKit


extension CGFloat {
    func degreesToRadians(degrees: CGFloat) -> CGFloat {
        return degrees * CGFloat(M_PI) / 180.0
    }
}