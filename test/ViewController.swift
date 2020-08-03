import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
    }
    
    func numberOfSections(in tableView: UITableView) -> Int { 2 }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 20 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: indexPath.section == 0 ? "mainCell": "testCell", for: indexPath)
        
        if let cell = cell as? TestCell{
                let randomColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
                
                cell.bgView.backgroundColor = randomColor
                cell.titleLabel.text = "this is a test"
                cell.descriptionLabel.text = String(repeating: "test ", count: Int.random(in: 10...500))
                cell.startButton.setTitle("START NOW", for: .normal)
                
                cell.titleLabel.textColor = randomColor.isDark ? .white : .black
                cell.descriptionLabel.textColor = randomColor.isDark ? .white : .black
                cell.startButton.tintColor = randomColor.isDark ? .white : .black
        }
        
        
        return cell
    }

}

class TestCell: UITableViewCell {
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
}
