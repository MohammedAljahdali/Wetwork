//
//  WeatherViewController+UIKit.swift
//  Wetwork
//
//  Created by Ammar AlTahhan on 27/04/2019.
//  Copyright © 2019 Ammar AlTahhan. All rights reserved.
//

import UIKit

extension WeatherViewController {
    
    func setTitleView() {
        let titleView = navTitleWithImageAndText(titleText: cityName, imageName: "edit")
        titleView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(editTitle)))
        titleView.isUserInteractionEnabled = true
        self.navigationItem.titleView = titleView
    }
    
    @objc
    func editTitle() {
        let alertController = UIAlertController(title: "City Name", message: "Enter city name", preferredStyle: .alert)
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        alertController.addAction(UIAlertAction(title: "Done", style: .default, handler: { (action) in
            self.cityName = alertController.textFields!.first!.text!
        }))
        present(alertController, animated: true, completion: nil)
    }
    
    func startIndicator() -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        indicator.hidesWhenStopped = true
        
        view.addSubview(indicator)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        
        indicator.startAnimating()
        
        return indicator
    }
    
    func prepareAnimation() {
        locationLabel.alpha = 0
        conditionLabel.alpha = 0
        conditionImageView.alpha = 0
        conditionImageView.transform = CGAffineTransform(translationX: 0, y: 25)
        bottomStackView.alpha = 0
    }
    
    func startAnimation() {
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            self.locationLabel.alpha = 1
        })
        UIView.animate(withDuration: 0.8, delay: 0.4, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.conditionLabel.alpha = 1
            self.conditionImageView.alpha = 1
            self.conditionImageView.transform = .identity
        })
        UIView.animate(withDuration: 1, delay: 0.8, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
            self.bottomStackView.alpha = 1
        })
    }
    
    func setTheme(isDay: Bool) {
        if isDay {
            view.backgroundColor = UIColor.init(white: 0.95, alpha: 1)
            locationLabel.textColor = UIColor.init(white: 0.13, alpha: 1)
            conditionLabel.textColor = UIColor.init(white: 0.13, alpha: 1)
            tempLabel.textColor = UIColor.init(white: 0.13, alpha: 1)
            cloudLabel.textColor = UIColor.init(white: 0.13, alpha: 1)
            windSpeedLabel.textColor = UIColor.init(white: 0.13, alpha: 1)
            humidityLabel.textColor = UIColor.init(white: 0.13, alpha: 1)
            conditionImageView.tintColor = UIColor.init(white: 0.13, alpha: 1)
            view.allSubViewsOf(type: UIImageView.self).forEach({$0.tintColor = UIColor.init(white: 0.13, alpha: 1)})
        } else {
            view.backgroundColor = UIColor.init(white: 0.13, alpha: 1)
            locationLabel.textColor = UIColor.init(white: 0.95, alpha: 1)
            conditionLabel.textColor = UIColor.init(white: 0.95, alpha: 1)
            tempLabel.textColor = UIColor.init(white: 0.95, alpha: 1)
            cloudLabel.textColor = UIColor.init(white: 0.95, alpha: 1)
            windSpeedLabel.textColor = UIColor.init(white: 0.95, alpha: 1)
            humidityLabel.textColor = UIColor.init(white: 0.95, alpha: 1)
            view.allSubViewsOf(type: UIImageView.self).forEach({$0.tintColor = UIColor.init(white: 0.95, alpha: 1)})
        }
    }
}
