//
//  UIColor.swift
//  Wetwork
//
//  Created by Ammar AlTahhan on 26/04/2019.
//  Copyright © 2019 Ammar AlTahhan. All rights reserved.
//

import UIKit

extension UIColor {
    
    open class var nearbyWeatherStandard: UIColor {
        get {
            return UIColor(red: 80/255, green: 180/255, blue: 250/255, alpha: 1.0)
        }
    }
    
    open class var nearbyWeatherStandardDark: UIColor {
        get {
            return UIColor(red: 80/255, green: 138/255, blue: 250/255, alpha: 1.0)
        }
    }
    
    open class var nearbyWeatherNight: UIColor {
        get {
            return UIColor(red: 50/255, green: 113/255, blue: 156/255, alpha: 1.0)
        }
    }
}
