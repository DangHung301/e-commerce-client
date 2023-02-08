//
//  SlideCell.swift
//  E-Commerce
//
//  Created by HungND on 07/02/2023.
//

import UIKit

class SlideCell: UICollectionViewCell {
    @IBOutlet weak var ViewContent: UIView!
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var line3: UILabel!
    @IBOutlet weak var line2: UILabel!
    @IBOutlet weak var line1: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        button.setTitle("Start", for: .normal)
        button.tintColor = .white
        
    }
    
    func setupData(data: Slide) {
        let attributedString1 = NSMutableAttributedString(string: data.line1)
        let attributedString3 = NSMutableAttributedString(string: data.line3)
        let paragraphStyle = NSMutableParagraphStyle()

        paragraphStyle.lineSpacing = 15
        paragraphStyle.alignment = .center
        
        attributedString1.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString1.length))
        attributedString3.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString3.length))

        // *** Set Attributed String to your label ***
        line1.attributedText = attributedString1
        line3.attributedText = attributedString3

        line1.text = data.line1
        
        line2.text = data.line2
        line3.text = data.line3
        
        image.image = UIImage(named: data.image)
        
        if(data.line1 != "Unique funiture") {
            button.isHidden = true
        }
    }

    @IBAction func act(_ sender: Any) {
    }
}
