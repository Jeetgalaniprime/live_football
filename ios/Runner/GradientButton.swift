import UIKit

@IBDesignable
class GradientButton: UIButton {

    private var gradientLayer: CAGradientLayer?
    
    // Set both startColor and endColor to the new hex color "078905"
    @IBInspectable var startColor: UIColor = UIColor(red: 7/255, green: 137/255, blue: 5/255, alpha: 1.0)
    @IBInspectable var endColor: UIColor   = UIColor(red: 7/255, green: 137/255, blue: 5/255, alpha: 1.0)

    // A new inspectable property for the corner radius
    @IBInspectable var cornerRadiusValue: CGFloat = 8.0


    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        self.titleLabel?.numberOfLines = 0
        self.titleLabel?.textAlignment = .center
        self.titleLabel?.lineBreakMode = .byWordWrapping
        self.contentEdgeInsets = UIEdgeInsets(top: 20, left: 15, bottom: 20, right: 15)
        self.setTitleColor(.white, for: .normal)
        self.clipsToBounds = true
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        updateGradient()
        
        // Set the corner radius in layoutSubviews to ensure it updates correctly
        layer.cornerRadius = cornerRadiusValue
        gradientLayer?.cornerRadius = cornerRadiusValue
    }

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + contentEdgeInsets.left + contentEdgeInsets.right,
                      height: size.height + contentEdgeInsets.top + contentEdgeInsets.bottom)
    }

    private func updateGradient() {
      if gradientLayer == nil {
          let gradient = CAGradientLayer()
          gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
          gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
          layer.insertSublayer(gradient, at: 0)
          gradientLayer = gradient
      }

      gradientLayer?.frame = bounds
      gradientLayer?.colors = [startColor.cgColor, endColor.cgColor]
      // Corner radius is now set in layoutSubviews

      layer.masksToBounds = true
      backgroundColor = .clear
    }
}
