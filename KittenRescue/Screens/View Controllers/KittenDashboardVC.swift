//
//  KittenDashboardVC.swift
//  KittenRescue
//
//  Created by Wesley Otero on 4/12/20.
//  Copyright © 2020 Wesley Otero. All rights reserved.
//

import UIKit

let newKittenNotificationKey = "net.wesleyotero.newKitten"

class KittenDashboardVC: UIViewController {
    
    let newKitten = Notification.Name(rawValue: newKittenNotificationKey)
    var kittenIsAdded = false

    var indexPath: IndexPath!
    
    var kittens: [Kitten] = KittenDataOperations.getAllKittens()
    
    @IBOutlet var kittenTableView: UITableView!
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kittenTableView.delegate = self
        kittenTableView.dataSource = self
        createObservers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        kittens = KittenDataOperations.getAllKittens()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if kittenIsAdded {
            kittenTableView.beginUpdates()
            indexPath = IndexPath(row: kittens.count - 1 , section: 0)
            kittenTableView.insertRows(at: [indexPath], with: .automatic)
            kittenTableView.endUpdates()
            kittenIsAdded = false
        }
    }
    
    @IBAction func addKitten(_ sender: Any) {
        let thisstoryboard = UIStoryboard(name: "Questionnaire", bundle: Bundle.main)
        let vc = thisstoryboard.instantiateViewController(identifier: "KittenDetails") as! KittenDetailsVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func createObservers(){
        NotificationCenter.default.addObserver(self, selector: #selector(KittenDashboardVC.updateKittenList(notification:)), name: newKitten, object: nil)
    }
    
    @objc func updateKittenList(notification: NSNotification) {
        kittenIsAdded = true
    }
}

extension KittenDashboardVC: UITableViewDelegate,  UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        kittens.count
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
        present(kittenProfile, animated: true , completion: nil)
    }
    
}

