//
//  EttangViewController.swift
//  SwuMuck
//
//  Created by 연쟁 on 2018. 6. 18..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class EttangViewController: UIViewController, UITableViewDataSource {
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Do any additional setup after loading the view.
        }
        //@IBOutlet var tableviewGaeun: UITableView!
        
        @IBOutlet var Ettangtable: UITableView!
        @IBOutlet var label: UILabel!
        //@IBOutlet var cellGaeun: UIView!
        
        var ettang:[[String]] = [["햄치즈 샌드위치", "에그 샌드위치", "크로와상 샌드위치"],["에땅 버거","칠리 버거","핫도그"]]
        
        let EttangTitle : [String] = ["샌드위치","버거"]
        
        let price : [[String]] = [["세모:1350원/ 네모:1850원", "1900원","3000원"],["1850원","2500원","1750원"]]
        
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
            Ettangtable.reloadData()
        }
        
        
        //섹션을 몇 개로 나눌 것인지 결정
        func numberOfSections (in tableView: UITableView) -> Int {
            if tableviewno == 0 {
                return ettang.count } else {
                return review.count
            }
        }
        
        //섹션 별로 각각 몇 개가 들어가는지 결정
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if tableviewno == 0 {
                return ettang[section].count } else {
                return review[section].count
            }
        }
        
        //각각 섹션 별로 헤더가 적용
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            if tableviewno == 0 {
                return EttangTitle[section] } else {
                return reTitle[section]
            }
        }
    
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Ettang Cell", for: indexPath)
            if tableviewno == 0 {
                cell.textLabel?.text = ettang[indexPath.section][indexPath.row]
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
