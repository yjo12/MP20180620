//
//  ViewController.swift
//  SwuMuck
//
//  Created by SWUCOMPUTER on 2018. 5. 26..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
   
    @IBOutlet var UserWelcomelabel: UILabel!
    var info: String?
    
    @IBOutlet var coupon: UIButton!
    @IBOutlet var orderCheck: UIButton!
    @IBOutlet var order: UIButton!

    @IBOutlet var recommend: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate

        //환영문구
        if let name = appDelegate.userName {
            self.UserWelcomelabel.text = name + "님"}
    
     
        //사용자에게 랜덤으로 메뉴 추천
        let shopkey:[[String]] = [["아메리카노", "카푸치노", "더치커피", "녹차라떼", "고구마라떼", "초코라떼"],["바나나 주스", "딸기 주스", "파인애플 주스", "딸바유", "고구마유", "블루베리유"],["햄치즈 샌드위치", "에그 샌드위치", "크로와상 샌드위치", "에땅 버거", "칠리 버거", "핫도그"],["제스티 그릴드 스테이크", "더블 치즈 스테이크", "로스트 비프/구아카몰", "치킨 까르보나라", "치킨 베이컨 랜치", "허니 머스타드 치킨"]]
       
        let shopValue = Array (0 ... 3)
        let menuValue = Array (0 ... 5)
        let index1 = Int(arc4random_uniform(UInt32(shopValue.count)))
        let index2 = Int(arc4random_uniform(UInt32(menuValue.count)))
       
        recommend.text = "오늘은 " + shopkey[index1][index2] + " 어떠세요?"
    
    
        
        //버튼 모서리를 둥글게
        coupon.layer.cornerRadius = 10
        orderCheck.layer.cornerRadius = 10
        order.layer.cornerRadius = 10
        
    
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

