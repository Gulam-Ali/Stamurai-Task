//
//  Extensions.swift
//  Stamurai-GulamALI
//
//  Created by gulam ali on 07/04/20.
//  Copyright © 2020 gulam ali. All rights reserved.
//
import Foundation
import UIKit
 


//MARK:>>>>>>>>> UIBUTTON Extension

extension UIButton {
    
    func getShadow(){
        
        // Shadow and Radius
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.50).cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowOpacity = 2.0
        self.layer.shadowRadius = 1.0
        self.layer.masksToBounds = false
       // self.layer.cornerRadius = corners
    }
    
    func RoundCorners(corners:CGFloat){
        self.layer.masksToBounds = false
        self.layer.cornerRadius = corners
    }
    
    func GetBorder(border:CGFloat){
        
       self.layer.borderWidth = border
        self.layer.borderColor = UIColor.lightGray.cgColor
        //UIColor(red: 228, green: 245, blue: 254, alpha: 1)
    }
    
}



//MARK:>>>>> UICOLOR

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(hexValue: Int) {
        self.init(
            red: (hexValue >> 16) & 0xFF,
            green: (hexValue >> 8) & 0xFF,
            blue: hexValue & 0xFF
        )
    }
}

//MARK:>>>>> UIVIEW

extension UIView{
    
    //to get the shadow on view and setting its opacity and radius as well
    func GetShadow(myview:UIView,opacity:Float,Shadowradius:CGFloat){
        
        myview.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.50).cgColor
        myview.layer.shadowOffset = CGSize(width: 0, height: 1)
        myview.layer.shadowOpacity = opacity
        myview.layer.shadowRadius = Shadowradius
        
    }
    
    func GetblackShadow(myview:UIView,opacity:Float,Shadowradius:CGFloat){
        
        myview.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.90).cgColor
        myview.layer.shadowOffset = CGSize(width: 0, height: 1)
        myview.layer.shadowOpacity = opacity
        myview.layer.shadowRadius = Shadowradius
        
    }
    
    func GetdesiredShadow(myview:UIView,opacity:Float,Shadowradius:CGFloat,clr:UIColor){
        myview.layer.shadowColor = clr.cgColor
        myview.layer.shadowOffset = CGSize(width: 2, height: 2)
        myview.layer.shadowOpacity = opacity
        myview.layer.shadowRadius = Shadowradius
    }
    
}


///////////

extension UIButton {
    
    func flash() {
        // Take as snapshot of the button and render as a template
        let snapshot = self.snapshot?.withRenderingMode(.alwaysTemplate)
        let imageView = UIImageView(image: snapshot)
        // Add it image view and render close to white
        imageView.tintColor = UIColor(white: 0.9, alpha: 1.0)
        guard let image = imageView.snapshot  else { return }
        let width = image.size.width
        let height = image.size.height
        // Create CALayer and add light content to it
        let shineLayer = CALayer()
        shineLayer.contents = image.cgImage
        shineLayer.frame = bounds
        
        // create CAGradientLayer that will act as mask clear = not shown, opaque = rendered
        // Adjust gradient to increase width and angle of highlight
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor,
                                UIColor.clear.cgColor,
                                UIColor.black.cgColor,
                                UIColor.clear.cgColor,
                                UIColor.clear.cgColor]
        gradientLayer.locations = [0.0, 0.35, 0.50, 0.65, 0.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        
        gradientLayer.frame = CGRect(x: -width, y: 0, width: width, height: height)
        // Create CA animation that will move mask from outside bounds left to outside bounds right
        let animation = CABasicAnimation(keyPath: "position.x")
        animation.byValue = width * 2
        // How long it takes for glare to move across button
        animation.duration = 3
        // Repeat forever
        animation.repeatCount = Float.greatestFiniteMagnitude
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        
        layer.addSublayer(shineLayer)
        shineLayer.mask = gradientLayer
        
        // Add animation
        gradientLayer.add(animation, forKey: "shine")
    }
    
    func stopFlash() {
        // Search all sublayer masks for "shine" animation and remove
        layer.sublayers?.forEach {
            $0.mask?.removeAnimation(forKey: "shine")
        }
    }
}

extension UIView {
    // Helper to snapshot a view
    var snapshot: UIImage? {
        let renderer = UIGraphicsImageRenderer(size: bounds.size)
        
        let image = renderer.image { context in
            layer.render(in: context.cgContext)
        }
        return image
    }
    
    
    
    
}

//gradient

extension UIView {
    
    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor) {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}


// MARK:>>>>>> TableView
extension UITableView {
    func isLastVisibleCell(at indexPath: IndexPath) -> Bool {
        guard let lastIndexPath = indexPathsForVisibleRows?.last else {
            return false
        }

        return lastIndexPath == indexPath
    }
}
