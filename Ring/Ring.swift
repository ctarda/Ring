import UIKit

@IBDesignable public class Ring: UIView {
    
    private struct Constants {
        static let defaultProgress: CGFloat = 0.2
        static let defaultLineWidth: CGFloat = 4.0
        static let defaultLineColor: UIColor = .redColor()
        static let defaultFillColor: UIColor = .clearColor()
        static let defaultBackgroundColor: UIColor = .whiteColor()
        static let minProgress: CGFloat = 0
        static let maxProgress: CGFloat = 1
    }
    
    let pathLayer = CAShapeLayer()
    
    @IBInspectable public var progress: CGFloat = Constants.defaultProgress {
        didSet {
            progress = normalize(progress)
            pathLayer.strokeEnd = progress
        }
    }
    
    @IBInspectable public var lineWidth: CGFloat = Constants.defaultLineWidth {
        didSet {
            pathLayer.lineWidth = lineWidth
        }
    }
    
    @IBInspectable public var lineColor: UIColor = Constants.defaultLineColor {
        didSet {
            pathLayer.strokeColor = lineColor.CGColor
        }
    }
    
    @IBInspectable public var fillColor: UIColor = Constants.defaultFillColor {
        didSet {
            pathLayer.fillColor = fillColor.CGColor
        }
    }    
    
    @IBInspectable public var background: UIColor = Constants.defaultBackgroundColor {
        didSet {
            backgroundColor = background
        }
    }
    
    private func normalize(value: CGFloat) -> CGFloat {
        var returnValue = value
        if value > Constants.maxProgress {
            returnValue = Constants.maxProgress
        } else if value < Constants.minProgress {
            returnValue = Constants.minProgress
        }
        
        return returnValue
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureRing()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        configureRing()
    }
    
    
    private func configureRing() {
        pathLayer.frame = bounds
        
        pathLayer.lineWidth = lineWidth
        pathLayer.fillColor = fillColor.CGColor
        pathLayer.strokeColor = lineColor.CGColor
 
        
        layer.addSublayer(pathLayer)
        
        pathLayer.anchorPoint = CGPointMake(0.5, 0.5)
        pathLayer.transform = CATransform3DRotate(pathLayer.transform, -0.5 * CGFloat(M_PI), 0.0, 0.0, 1.0);
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        pathLayer.frame = bounds
        pathLayer.path = ringPath().CGPath
    }
    
    private func ringPath() -> UIBezierPath {
        return UIBezierPath(ovalInRect: ringFrame())
        
    }
    
    private func ringFrame() -> CGRect {
        return CGRectInset(CGRect(x: 0, y: 0, width: CGRectGetHeight(bounds), height: CGRectGetHeight(bounds)), lineWidth*2, lineWidth*2)
    }
}