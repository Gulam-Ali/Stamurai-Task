//
//  File.swift
//  Stamurai-GulamALI
//
//  Created by gulam ali on 08/04/20.
//  Copyright © 2020 gulam ali. All rights reserved.
//

import Foundation
import UIKit

class CustomSlider: UISlider {

    @IBInspectable var thumbImage: UIImage?

    // MARK: Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()

        if let thumbImage = thumbImage {
            self.setThumbImage(thumbImage, for: .normal)
        }
    }
}
