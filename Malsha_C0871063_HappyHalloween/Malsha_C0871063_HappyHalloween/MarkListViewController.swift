//
//  MarkListViewController.swift
//  Malsha_C0871063_HappyHalloween
//
//  Created by Malsha Lambton on 2022-11-01.
//

import UIKit

class MarkListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var pointList = [Int]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismissView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    // MARK: - TableView Delegation
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pointList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MarkCell",
                                                 for: indexPath)
        cell.textLabel?.text = "Round " + String(indexPath.row) + " Points : " + String(pointList[indexPath.row])
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
