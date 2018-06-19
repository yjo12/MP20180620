//
//  BeetleViewController.swift
//  SwuMuck
//
//  Created by 연쟁 on 2018. 6. 17..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class BeetleViewController: UIViewController, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //@IBOutlet var tableviewGaeun: UITableView!
    
    @IBOutlet var Beetletable: UITableView!
    @IBOutlet var label: UILabel!
    //@IBOutlet var cellGaeun: UIView!

    var beetle:[[String]] = [["바나나 주스", "딸기 주스", "파인애플 주스"], ["딸바유", "고구마유", "블루베리유"]]
    
    let BeetleTitle : [String] = ["생과일 주스","우유 주스"]
    
    let price : [[String]] = [["2.7", "3.7","3.7"],["3.5","3.9","4.9"]]
    
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
        Beetletable.reloadData()
    }
    
    
    //섹션 어떻게 나눌지는 상점별로 다르기 때문에 상점별 메뉴 구분을 보고 추후 정할 예정임
    func numberOfSections (in tableView: UITableView) -> Int {
        if tableviewno == 0 {
            return beetle.count } else {
            return review.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableviewno == 0 {
            return beetle[section].count } else {
            return review[section].count
        }
    }
    
    //헤더
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if tableviewno == 0 {
            return BeetleTitle[section] } else {
            return reTitle[section]
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Beetle Cell", for: indexPath)
        if tableviewno == 0 {
            cell.textLabel?.text = beetle[indexPath.section][indexPath.row]
            cell.detailTextLabel?.text = price[indexPath.section][indexPath.row] } else {
            cell.textLabel?.text = review[indexPath.section][indexPath.row]
            cell.detailTextLabel?.text = reprice[indexPath.section][indexPath.row]
        }
        
        return cell
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
