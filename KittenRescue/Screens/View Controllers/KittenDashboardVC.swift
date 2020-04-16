//
//  KittenDashboardVC.swift
//  KittenRescue
//
//  Created by Wesley Otero on 4/12/20.
//  Copyright © 2020 Wesley Otero. All rights reserved.
//

import UIKit

class KittenDashboardVC: UIViewController {
    
    @IBOutlet var kittenTableView: UITableView!
    
    var kittens: [Kitten] = []
    var isNewContentAvailable = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kittenTableView.delegate = self
        kittenTableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if isNewContentAvailable {
            let indexPath = IndexPath(row: kittens.count - 1, section: 0)
            kittenTableView.beginUpdates()
            kittenTableView.insertRows(at: [indexPath], with: .automatic)
            kittenTableView.endUpdates()
            isNewContentAvailable = false
        }
    }
    
    @IBAction func addKitten(_ sender: Any) {
        let thisstoryboard = UIStoryboard(name: "Questionnaire", bundle: Bundle.main)
        let vc = thisstoryboard.instantiateViewController(identifier: "KittenDetails") as! KittenDetailsVC
        vc.addKittenDelegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension KittenDashboardVC: UITableViewDelegate,  UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.kittens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "KittenCell") as! KittenTableViewCell
        
        cell.kittenNameLabel.text = kittens[indexPath.row].name
        cell.kittenAgeLabel.text = String(kittens[indexPath.row].age)
        cell.kittenStatusLabel.text = kittens[indexPath.row].status
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow!
        let kittenProfile = storyboard?.instantiateViewController(identifier: "KittenProfile") as! KittenProfileVC
        kittenProfile.kitten = kittens[indexPath.row]
        //        navigationController?.pushViewController(kittenProfile, animated: true)
        present(kittenProfile, animated: true , completion: nil)
    }
}

extension KittenDashboardVC: AddKittenDelegate {
    
    func addKitten(kitten: Kitten, isNewContentAvailable: Bool) {
        self.isNewContentAvailable = isNewContentAvailable
        kittens.append(kitten)
    }
    
    
}
