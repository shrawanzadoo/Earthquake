import UIKit

extension EarthquakeViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return earthquakes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = getTableCell()
        cell.configureCellWith(model: earthquakes[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.earthquakeSelected(earthquakes[indexPath.row])
    }
    
    func getTableCell() -> EarthquakeCell {
        let cellIdentifier = EarthquakeCell.reuseIdentifier
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EarthquakeCell.reuseIdentifier) as? EarthquakeCell else {
            fatalError("Could not dequeue EarthquakeCell with identifier \(cellIdentifier)")
        }
        return cell
    }
}
