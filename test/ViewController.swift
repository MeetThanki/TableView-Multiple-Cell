import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 300
    }
    
    func numberOfSections(in tableView: UITableView) -> Int { 2 }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 0 ? 1 : 20
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 100 : UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            return tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath)
        } else if let cell = tableView.dequeueReusableCell(withIdentifier: "testCell", for: indexPath) as? TestCell {
            cell.bgView.backgroundColor = UIColor.random()
            cell.titleLabel.text = "this is a test"
            cell.descriptionLabel.text = String(repeating: "test ", count: Int.random(in: 10...500))
            cell.startButton.setTitle("START NOW", for: .normal)
            return cell
        } else {
            fatalError("invalid cell dequeued")
        }
    }

}

class TestCell: UITableViewCell {
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
}
