//
//  QuiznosViewController.swift
//  SwuMuck
//
//  Created by 연쟁 on 2018. 6. 18..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class QuiznosViewController: UIViewController, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    //@IBOutlet var tableviewGaeun: UITableView!
    
    @IBOutlet var Ettangtable: UITableView!
    @IBOutlet var label: UILabel!
    //@IBOutlet var cellGaeun: UIView!
    
    var quiznos:[[String]] = [["제스티 그릴드 스테이크", "더블 치즈 스테이크", "로스트 비프/구아카몰"],["치킨 까르보나라", "치킨 베이컨 랜치", "허니 머스타드 치킨"]]
    
    let QuiznosTitle : [String] = ["STEAK R: 7.7 M: 9.9 L: 12100", "CHICKEN& TURKEY R: 6.2 M: 8.4 L: 10600"]
    
    var review:[[String]] = [["aaaaa아메리카노", "카푸치노", "더치커피"], ["녹차라떼", "고구마라떼", "초코라떼"], ["플레인스무디","과일스무디(블루베리, 유자, 망고, 딸기)"],["자몽차", "허브차"]]
    let quiznosImages : [[UIImage]] = [[#imageLiteral(resourceName: "quiznos_1.png"),#imageLiteral(resourceName: "quiznos_2.png"),#imageLiteral(resourceName: "quiznos_3.png")],[#imageLiteral(resourceName: "quiznos_4.png"),#imageLiteral(resourceName: "quiznos_5.png"),#imageLiteral(resourceName: "quiznos_6.png")]]
    
    
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
            return quiznos.count } else {
            return review.count
        }
    }
    
    //섹션 별로 각각 몇 개가 들어가는지 결정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableviewno == 0 {
            return quiznos[section].count } else {
            return review[section].count
        }
    }
    
    //각각 섹션 별로 헤더가 적용
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if tableviewno == 0 {
            return QuiznosTitle[section] } else {
            return reTitle[section]
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Quiznos Cell", for: indexPath)
        if tableviewno == 0 {
            cell.textLabel?.text = quiznos[indexPath.section][indexPath.row]
            cell.imageView?.image = quiznosImages[indexPath.section][indexPath.row]
        } else {
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
