import UIKit

@IBDesignable public class Ring: UIView {
    let pathLayer = CAShapeLayer()
    
    @IBInspectable public var progress: CGFloat = 0.2 {
        didSet {
            progress = normalize(progress)
            pathLayer.strokeEnd = progress
        }
    }
    
    @IBInspectable public var lineWidth: CGFloat = 20.0 {
        didSet {
            pathLayer.lineWidth = lineWidth
        }
    }
    
    @IBInspectable public var lineColor: UIColor = .redColor() {
        didSet {
            pathLayer.strokeColor = lineColor.CGColor
        }
    }
    
    @IBInspectable public var fillColor: UIColor = .clearColor() {
        didSet {
            pathLayer.fillColor = fillColor.CGColor
        }
    }    
    
    @IBInspectable public var background: UIColor = .whiteColor() {
        didSet {
            backgroundColor = background
        }
    }
    
    private func normalize(value: CGFloat) -> CGFloat {
        var returnValue = value
        if value > 1 {
            returnValue = 1
        } else if value < 0 {
            returnValue = 0
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
        pathLayer.transform = CATransform3DRotate(pathLayer.transform, -1/2 * CGFloat(M_PI), 0.0, 0.0, 1.0);        
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