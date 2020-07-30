//
//  MasterViewController+ViewContract.swift
//  Earthquakes
//
//  Created by Shrawan Zadoo on 30/07/2020.
//  Copyright © 2020 Shrawan Zadoo. All rights reserved.
//

import UIKit

extension MasterViewController: EarthquakesViewContract {
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
    
    func updateEarthquakes(earthquakes: [Earthquake]) {
        
    }
    
    func showAlert(title: String, message: String, mainActionTitle: String?, mainActionCallback: (() -> Void)?) {
        showAlertWithAction(title: title, message: message, mainActionTitle: mainActionTitle, mainActionCallback: mainActionCallback)
    }
    
    
}
