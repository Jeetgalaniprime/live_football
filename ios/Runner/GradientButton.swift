import UIKit

@IBDesignable
class GradientButton: UIButton {

    private var gradientLayer: CAGradientLayer?
    
    @IBInspectable var startColor: UIColor = UIColor(red: 55/255, green: 85/255, blue: 107/255, alpha: 1.0) // lighter shade
    @IBInspectable var endColor: UIColor   = UIColor(red: 39/255, green: 63/255, blue: 79/255, alpha: 1.0)  // #273F4F

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
      gradientLayer?.cornerRadius = bounds.height / 2

      layer.cornerRadius = bounds.height / 2
      layer.masksToBounds = true
      backgroundColor = .clear
    }
}
