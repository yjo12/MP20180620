//
//  CouponViewController.swift
//  SwuMuck
//
//  Created by 연쟁 on 2018. 6. 9..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class CouponViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {

    
    @IBOutlet var gaeunCoupon: UICollectionView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gaeunCoupon.delegate = self
        gaeunCoupon.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    //셀의 갯수(쿠폰 갯수)
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    
    //셀의 내용
    public func collectionView(_ collectionView:UICollectionView,cellForItemAt indexPath:IndexPath) ->UICollectionViewCell
    {
        // 재사용 큐에 셀을 가져옴
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GaeunCell" ,for: indexPath) as! CouponCollectionViewCell
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        //초기 쿠폰이미지 10개
        appDelegate.couponImages = [#imageLiteral(resourceName: "Stamp_0.png"),#imageLiteral(resourceName: "Stamp_0.png"),#imageLiteral(resourceName: "Stamp_0.png"),#imageLiteral(resourceName: "Stamp_0.png"),#imageLiteral(resourceName: "Stamp_0.png"),#imageLiteral(resourceName: "Stamp_0.png"),#imageLiteral(resourceName: "Stamp_0.png"),#imageLiteral(resourceName: "Stamp_0.png"),#imageLiteral(resourceName: "Stamp_0.png"),#imageLiteral(resourceName: "Stamp_0.png")]
        
        //coupon갯수만큼 초기이미지(비어있는 도장)에서 삭제 후 그 자리들에 채워진 도장이미지를 삽입
        if(appDelegate.couponnumber != 0)
        {
            for i in 0...appDelegate.couponnumber-1{
                appDelegate.couponImages?.remove(at: i)
                appDelegate.couponImages?.insert(#imageLiteral(resourceName: "Stamp_1.png"), at:i)
            }
        }
        
        //표시할 이미지 설정
        cell.gaeunImage.image = appDelegate.couponImages?[indexPath.row]
        cell.gaeunImage.contentMode = .scaleAspectFill
        
        return cell
    }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


