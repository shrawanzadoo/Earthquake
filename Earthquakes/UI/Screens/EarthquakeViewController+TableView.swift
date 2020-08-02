//
//  EarthquakeViewController+TableView.swift
//  Earthquakes
//
//  Created by Shrawan Zadoo on 02/08/2020.
//  Copyright © 2020 Shrawan Zadoo. All rights reserved.
//

import UIKit

extension EarthquakeViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return earthquakes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell!
        cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil {
            cell = getDefaultTableCell()
        }
        cell.textLabel?.text = "\(earthquakes[indexPath.row].magnitude)"
        cell.detailTextLabel?.text = "\(earthquakes[indexPath.row].intensity)"
        cell.backgroundColor = earthquakes[indexPath.row].intensity == .high ? .systemRed : .systemOrange
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.earthquakeSelected(earthquakes[indexPath.row])
    }
    
    func getDefaultTableCell() -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
        let view = UIView(frame: .zero)
        view.backgroundColor = .lightGray
        cell.selectedBackgroundView = view
        cell.textLabel?.textColor = .white
        cell.detailTextLabel?.textColor = .white
        
        return cell
    }
}
