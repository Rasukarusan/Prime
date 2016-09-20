//
//  ShowAllViewController.swift
//  PrimeNumber
//
//  Created by 田中直登 on 2016/09/16.
//  Copyright © 2016年 NaotoTanaka. All rights reserved.
//

import UIKit
import LTMorphingLabel
import TextFieldEffects
class ShowAllViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ud = UserDefaults.standard
        var max:String
        var primeArray:Array<AnyObject> = []
      
        if((ud.array(forKey: "primeArray")) == nil){
            max = "120"
            
            primeArray = [2 as AnyObject, 3 as AnyObject, 5 as AnyObject, 7 as AnyObject, 11 as AnyObject, 13 as AnyObject, 17 as AnyObject, 19 as AnyObject, 23 as AnyObject, 29 as AnyObject, 31 as AnyObject, 37 as AnyObject, 41 as AnyObject, 43 as AnyObject, 47 as AnyObject, 53 as AnyObject, 59 as AnyObject, 61 as AnyObject, 67 as AnyObject, 71 as AnyObject, 73 as AnyObject, 79 as AnyObject, 83 as AnyObject, 89 as AnyObject, 97 as AnyObject, 101 as AnyObject, 103 as AnyObject, 107 as AnyObject, 109 as AnyObject, 113 as AnyObject]
 
        }else{
            max = ud.string(forKey: "max")!
            primeArray = ud.array(forKey: "primeArray")! as Array<AnyObject>
        }
        
 
        
        let title: UILabel = UILabel()
        title.frame = CGRect(x: 0,y: 0,width: self.view.bounds.width,height: 50)
        title.text = "素数一覧"
        title.font = UIFont(name:"sweet heavy calligraphy",size: 35)
        title.textColor = UIColor.black
        title.textAlignment = NSTextAlignment.center
        title.layer.position = CGPoint(x: self.view.bounds.width/2,y: 50)
        self.view.addSubview(title)
        
        let subtitle: UILabel = UILabel()
        subtitle.frame = CGRect(x: 0,y: 0,width: self.view.bounds.width,height: 50)
        subtitle.text = "1 から "
        subtitle.font = UIFont(name:"sweet heavy calligraphy",size: 35)
        subtitle.textColor = UIColor.black
        subtitle.textAlignment = NSTextAlignment.center
        subtitle.layer.position = CGPoint(x: self.view.bounds.width/3,y: 100)
        self.view.addSubview(subtitle)
        
        let primelbl: UILabel = UILabel()
        primelbl.frame = CGRect(x: 0,y: 0,width: self.view.bounds.width,height: 50)
        primelbl.text = String(max)
        primelbl.font = UIFont(name:"sweet heavy calligraphy",size: 35)
        primelbl.textColor = UIColor.black
        primelbl.textAlignment = NSTextAlignment.center
        primelbl.layer.position = CGPoint(x: self.view.bounds.width/2+50,y: 100)
        self.view.addSubview(primelbl)
        
        let backBtn: UIButton = UIButton()
        let buttonImage:UIImage = UIImage(named: "Fragmentr.png")!;
        backBtn.setBackgroundImage(buttonImage, for: UIControlState());
        backBtn.frame = CGRect(x: 0,y: 0,width: self.view.bounds.width/2,height: 50)
        // ボタンの位置を指定する.
        backBtn.layer.position = CGPoint(x: self.view.frame.width/2, y:self.view.bounds.height-40)
        // イベントを追加する.
        backBtn.addTarget(self, action:#selector(ShowAllViewController.backBtnTapped(sender:)), for: .touchUpInside)
       // backBtn.rippleOverBounds = true
        // ボタンをViewに追加する.
        self.view.addSubview(backBtn)
        
        let myLabel : UILabel = UILabel()
        myLabel.frame = CGRect(x: 0,y: 0,width: self.view.bounds.width,height: 50)
        myLabel.text = "戻る"
        myLabel.font = UIFont(name:"sweet heavy calligraphy",size: 35)
        myLabel.textColor = UIColor.black
        myLabel.textAlignment = NSTextAlignment.center
        myLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: self.view.bounds.height-50)
        self.view.addSubview(myLabel)
        
        // TextView生成する
        let myTextView: UITextView = UITextView(frame: CGRect(x: 30, y: 130, width: self.view.frame.width - 60, height: self.view.frame.height/2+self.view.frame.height/7))
        // TextViewの背景を黃色に設定する
        myTextView.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.0)
        
        //TextViewで表示する素数一覧を作成
        var text:String = ""
       for i in 0...primeArray.count-1{
            text = text + String(describing: primeArray[i])+", "
        }
        //表示させるテキストを設定する
        myTextView.text = text
        // 角に丸みをつける
        myTextView.layer.masksToBounds = true
        // 丸みのサイズを設定する
        myTextView.layer.cornerRadius = 20.0
        // 枠線の太さを設定する
        myTextView.layer.borderWidth = 1
        // 枠線の色を黒に設定する
        myTextView.layer.borderColor = UIColor.black.cgColor
        // フォントの設定をする
        myTextView.font = UIFont.systemFont(ofSize: CGFloat(20))
        // フォントの色の設定をする
        myTextView.textColor = UIColor.black
        // 左詰めの設定をする
        myTextView.textAlignment = NSTextAlignment.left
        // リンク、日付などを自動的に検出してリンクに変換する.
        myTextView.dataDetectorTypes = UIDataDetectorTypes.all
        // 影の濃さを設定する
        myTextView.layer.shadowOpacity = 0.5
        // テキストを編集不可にする
        myTextView.isEditable = false
        // TextViewをViewに追加する
        self.view.addSubview(myTextView)
 
        
    }
    

    func backBtnTapped(sender:UIButton){
        //前の画面に戻る
        self.dismiss(animated: true, completion: nil)
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
}
