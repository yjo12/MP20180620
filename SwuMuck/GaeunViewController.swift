//
//  GaeunViewController.swift
//  SwuMuck
//
//  Created by 연쟁 on 2018. 5. 29..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class GaeunViewController: UIViewController, UITableViewDataSource {
    //@IBOutlet var tableviewGaeun: UITableView!
    
    @IBOutlet var gaeuntable: UITableView!
    @IBOutlet var label: UILabel!
    //@IBOutlet var cellGaeun: UIView!
    
    var gaeun:[[String]] = [["아메리카노", "카푸치노", "더치커피"], ["녹차라떼", "고구마라떼", "초코라떼"], ["플레인스무디","과일스무디(블루베리, 유자, 망고, 딸기)"],["자몽차", "허브차"]]
    
    let GaeunTitle : [String] = ["Coffee","Beverage","Smoothie","Tea"] //
    
    let price : [[String]] = [["HOT 1.8 ICE 2.0","HOT 2.3","ICE7.0"],["HOT, ICE 2.3", "HOT, ICE 2.3" , "HOT 2.3, ICE 3.0"],["3.3", "4.0"],["HOT 2.0, ICE 2.3", "HOT 1.9 ,ICE 2.0"]]
    
    var review:[[String]] = [["aaaaa아메리카노", "카푸치노", "더치커피"], ["녹차라떼", "고구마라떼", "초코라떼"], ["플레인스무디","과일스무디(블루베리, 유자, 망고, 딸기)"],["자몽차", "허브차"]]
    
    let reTitle : [String] = ["aaaCoffee","Beverage","Smoothie","Tea"] //
    
    let reprice : [[String]] = [["aaaaaaHOT 1.8 ICE 2.0","HOT 2.3","ICE7.0"],["HOT, ICE 2.3", "HOT, ICE 2.3" , "HOT 2.3, ICE 3.0"],["3.3", "4.0"],["HOT 2.0, ICE 2.3", "HOT 1.9 ,ICE 2.0"]]
    
    var tableviewno = 0
    
    @IBAction func changeSelection(_ sender: UISegmentedControl) {
        if sender.titleForSegment(at: sender.selectedSegmentIndex) == "Review" {
            tableviewno = 1
        } else {
            tableviewno = 0
        }
        gaeuntable.reloadData()
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //섹션 어떻게 나눌지는 상점별로 다르기 때문에 상점별 메뉴 구분을 보고 추후 정할 예정임
    func numberOfSections (in tableView: UITableView) -> Int {
        if tableviewno == 0 {
            return gaeun.count } else {
            return review.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableviewno == 0 {
            return gaeun[section].count } else {
            return review[section].count
        }
    }
    
    //헤더
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if tableviewno == 0 {
            return GaeunTitle[section] } else {
            return reTitle[section]
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Gaeun Cell", for: indexPath)
        if tableviewno == 0 {
        cell.textLabel?.text = gaeun[indexPath.section][indexPath.row]
            cell.detailTextLabel?.text = price[indexPath.section][indexPath.row] } else {
            cell.textLabel?.text = review[indexPath.section][indexPath.row]
            cell.detailTextLabel?.text = reprice[indexPath.section][indexPath.row]
        }
        
        return cell
    }
    
    
    
}
