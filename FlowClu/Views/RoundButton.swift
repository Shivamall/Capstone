import UIKit



@IBDesignable class RoundButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 15 {
        didSet {
            refreshCorners(value: cornerRadius)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    override func prepareForInterfaceBuilder() {
        sharedInit()
    }
    
    func sharedInit() {
        refreshCorners(value: cornerRadius)
        refreshColor()
    }
    
    func refreshCorners(value: CGFloat) {
        layer.cornerRadius = value
    }
    
    func refreshColor() {
        backgroundColor = UIColor(hexString: "#0db99e")
        clipsToBounds = true
    }
    
    
}


