//
//  Kadai3ViewController.swift
//  PrimeNumber
//
//  Created by 田中直登 on 2016/09/13.
//  Copyright © 2016年 NaotoTanaka. All rights reserved.
//

import UIKit
import LTMorphingLabel
import TextFieldEffects
class ViewController: UIViewController {
    
    var primeTxtField: HoshiTextField!
    var max_primelbl: LTMorphingLabel!
    var sum_primelbl: LTMorphingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let title: LTMorphingLabel = LTMorphingLabel()
        title.frame = CGRect(x: 0,y: 0,width: self.view.bounds.width,height: 30)
        title.text = "落ち着け… 心を平静にして考えるんだ…こんな時どうするか……"
        //title.font = UIFont.systemFontOfSize(UIFont.smallSystemFontSize())
        title.font = UIFont.systemFont(ofSize: 10)
        title.textColor = UIColor.darkGray
        title.textAlignment = NSTextAlignment.center
        title.morphingEffect = .evaporate
        title.layer.position = CGPoint(x: self.view.bounds.width/2+self.view.bounds.width/8,y:self.view.bounds.height/15)
        self.view.addSubview(title)
        
        let title2: LTMorphingLabel = LTMorphingLabel()
        title2.frame = CGRect(x: 0,y: 0,width: self.view.bounds.width,height: 50)
        title2.morphingEffect = .evaporate
        title2.text = "２… ３ ５… ７… 落ち着くんだ…『素数』を数えて落ち着くんだ…"
        title2.font = UIFont.systemFont(ofSize: 10)
        title2.textColor = UIColor.darkGray
        title2.textAlignment = NSTextAlignment.center
        title2.layer.position = CGPoint(x: self.view.bounds.width/2+self.view.bounds.width/8,y: self.view.bounds.height/11)
        self.view.addSubview(title2)
        
        let title3: LTMorphingLabel = LTMorphingLabel()
        title3.frame = CGRect(x: 0,y: 0,width: self.view.bounds.width,height: 50)
        title3.morphingEffect = .evaporate
        title3.text = "『素数』は１と自分の数でしか割ることのできない孤独な数字……"
        title3.font = UIFont.systemFont(ofSize: 10)
        title3.textColor = UIColor.darkGray
        title3.textAlignment = NSTextAlignment.center
        title3.layer.position = CGPoint(x: self.view.bounds.width/2+self.view.bounds.width/8,y: self.view.bounds.height/9)
        self.view.addSubview(title3)
        
        let title4: LTMorphingLabel = LTMorphingLabel()
        title4.frame = CGRect(x: 0,y: 0,width: self.view.bounds.width-30,height: 50)
        title4.morphingEffect = .evaporate
        title4.text = "わたしに勇気を与えてくれる"
        title4.font = UIFont.systemFont(ofSize: CGFloat(22))
        title4.textColor = UIColor.darkGray
        title4.textAlignment = NSTextAlignment.center
        title4.layer.position = CGPoint(x: self.view.bounds.width/2+self.view.bounds.width/10,y: self.view.bounds.height/6)
        title4.morphingCharacterDelay = 0.3
        self.view.addSubview(title4)
        
        //width = 375 height = 667
        let fromLbl : UILabel = UILabel()
        fromLbl.frame = CGRect(x: 0,y: 0,width: self.view.bounds.width/7,height: 25)
        fromLbl.text = "1から"
        fromLbl.textColor = UIColor.black
        fromLbl.textAlignment = NSTextAlignment.left
        fromLbl.layer.position = CGPoint(x: self.view.bounds.width/8,y: self.view.bounds.height/4)
        self.view.addSubview(fromLbl)
        
        //素数入力フィールドの設定
        primeTxtField = HoshiTextField(frame:CGRect(x: 0,y: 0,width: self.view.bounds.width/3,height: 50))
        primeTxtField.textColor = UIColor.black
        primeTxtField.font = UIFont.systemFont(ofSize: CGFloat(22))
        primeTxtField.borderActiveColor = UIColor(red:0.00, green:0.00, blue:0.50, alpha:1.0)
        primeTxtField.borderInactiveColor = UIColor.gray
        primeTxtField.textAlignment = NSTextAlignment.center
        primeTxtField.layer.position = CGPoint(x: self.view.bounds.width/3,y: self.view.bounds.height/4-15)
        self.view.addSubview(primeTxtField)

        //"までの素数を調べる"ラベル
        let shiraberuLbl : UILabel = UILabel()
        shiraberuLbl.frame = CGRect(x: 0,y: 0,width: self.view.bounds.width/2,height: 25)
        shiraberuLbl.text = "までの素数を調べる"
        shiraberuLbl.textColor = UIColor.black
        shiraberuLbl.textAlignment = NSTextAlignment.left
        shiraberuLbl.layer.position = CGPoint(x: self.view.bounds.width/2+self.view.bounds.width/4,y: self.view.bounds.height/4)
        self.view.addSubview(shiraberuLbl)
        
        //"心を落ち着かせる"ボタン（素数計算ボタン）
        let doBtn: ZFRippleButton = ZFRippleButton()
        let btnImage:UIImage = UIImage(named: "Sparkler.png")!;
        doBtn.setBackgroundImage(btnImage, for: UIControlState());
        doBtn.setTitle("心を落ち着かせる", for: UIControlState())
        doBtn.setTitleColor(UIColor.darkGray, for: UIControlState())
        doBtn.titleLabel!.font = UIFont(name: "Helvetica-Bold",size: CGFloat(16))
        doBtn.frame = CGRect(x: 0,y: 0,width: self.view.bounds.width/2,height: 50)
        doBtn.layer.position = CGPoint(x: self.view.frame.width/2, y:self.view.bounds.height/2 - self.view.bounds.height/6)
        doBtn.shadowRippleEnable = false
        // イベントを追加する.
        doBtn.addTarget(self, action:#selector(ViewController.doBtnAction(sender:)), for: .touchUpInside)
        doBtn.rippleOverBounds = true
        // ボタンをViewに追加する.
        self.view.addSubview(doBtn)
        
        //”最大の素数”ラベル
        let maxLbl : UILabel = UILabel()
        maxLbl.frame = CGRect(x: 0,y: 0,width: self.view.bounds.width,height: 40)
        maxLbl.text = "最大の素数"
        maxLbl.font = UIFont.systemFont(ofSize: 20)
        maxLbl.textAlignment = NSTextAlignment.center
        maxLbl.layer.position = CGPoint(x: self.view.bounds.width/2,y: self.view.bounds.height/2-self.view.bounds.height/9)
        self.view.addSubview(maxLbl)
        
        //素数の最大値を表示するラベル
        max_primelbl = LTMorphingLabel()
        max_primelbl.frame = CGRect(x: 0,y: 0,width: self.view.bounds.width,height: 50)
        max_primelbl.text = ""
        max_primelbl.font = UIFont.systemFont(ofSize: CGFloat(50))
        max_primelbl.morphingEffect = .evaporate
        max_primelbl.textColor = UIColor.black
        max_primelbl.textAlignment = NSTextAlignment.center
        max_primelbl.layer.position = CGPoint(x: self.view.bounds.width/2,y: self.view.bounds.height/2)
        self.view.addSubview(max_primelbl)
        
        //”素数の総数”ラベル
        let sumLbl : UILabel = UILabel()
        sumLbl.frame = CGRect(x: 0,y: 0,width: self.view.bounds.width,height: 40)
        sumLbl.text = "素数の総数"
        sumLbl.font = UIFont.systemFont(ofSize: 20)
        sumLbl.textAlignment = NSTextAlignment.center
        sumLbl.layer.position = CGPoint(x: self.view.bounds.width/2,y: self.view.bounds.height/2+self.view.bounds.height/9)
        self.view.addSubview(sumLbl)
        
        //素数の総数を表示するラベル
        sum_primelbl = LTMorphingLabel()
        sum_primelbl.frame = CGRect(x: 0,y: 0,width: self.view.bounds.width,height: 50)
        sum_primelbl.text = ""
        sum_primelbl.font = UIFont.systemFont(ofSize: CGFloat(50))
        sum_primelbl.morphingEffect = .evaporate
        sum_primelbl.textColor = UIColor.black
        sum_primelbl.textAlignment = NSTextAlignment.center
        sum_primelbl.layer.position = CGPoint(x: self.view.bounds.width/2,y: self.view.bounds.height/2+self.view.bounds.height/4)
        self.view.addSubview(sum_primelbl)

        
        let showBtn: ZFRippleButton = ZFRippleButton()
        let buttonImage:UIImage = UIImage(named: "Fragmentr.png")!;
        showBtn.setBackgroundImage(buttonImage, for: UIControlState());
        showBtn.frame = CGRect(x: 0,y: 0,width: self.view.bounds.width/2,height: 50)
        // ボタンの位置を指定する.
        showBtn.layer.position = CGPoint(x: self.view.frame.width/2, y:self.view.bounds.height-40)
        // イベントを追加する.
        showBtn.addTarget(self, action:#selector(ViewController.showBtnAction(_:)), for: .touchUpInside)
        showBtn.rippleOverBounds = true
        // ボタンをViewに追加する.
        self.view.addSubview(showBtn)
        
        
        let myLabel : UILabel = UILabel()
        myLabel.frame = CGRect(x: 0,y: 0,width: self.view.bounds.width,height: 50)
        myLabel.text = "一覧ひょうじ"
        myLabel.font = UIFont(name:"sweet heavy calligraphy",size: 30)
        myLabel.textColor = UIColor.black
        myLabel.textAlignment = NSTextAlignment.center
        myLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: self.view.bounds.height-40)
        self.view.addSubview(myLabel)
        

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    internal func doBtnAction(sender:UIButton){
        self.view.endEditing(true)
        var MAX:Int
        if(primeTxtField.text == ""){
            MAX = 120
            primeTxtField.text = "120"
        }else{
            MAX = Int(primeTxtField.text!)!
        }
        /**「1からMAXまでの素数」でxが3以下だとエラーが出るのでエラー処理必要**/
        
        let sqrt_max = Int(sqrt(Double(MAX)))
        var search = Array(2...MAX)
        
        let ud = UserDefaults.standard
        ud.set(String(MAX), forKey: "max")
        
        
        /**とても賢いVer.(そして早い)**/
        for i in 2...sqrt_max {
            
            let index = i - 2
            var j = index+i
            if search[index] != 0 {
          
                while(j<search.count){

                    search[j] = 0//一旦素数ではないものを0で埋める
                    j += i
                }
            }
        }
        let prime = search.filter { x in x != 0 }//fillterで0以外のものを素数リストとする
        
        ud.set(prime, forKey: "primeArray")
        
        
        
        //素直にやったVersion。100万以上だとものすごい遅い
       /*  let prime: NSMutableArray = []
         let search: NSMutableArray = []
         let sqrt_max = sqrt(Double(MAX))
         var tmp: [Int] = []
         var flag:Bool = true
        for i in 2...MAX{
            search.addObject(i)
        }
        while(flag){
            let first = search[0]
            
            prime.addObject(Int(first as! NSNumber))
            if(Double(first as! NSNumber) >= sqrt_max){
                flag = false
            }
            
            for i in 0..<search.count{
                if(Int(search[i] as! NSNumber)%Int(first as! NSNumber) == 0){
                    tmp.append(Int(search[i] as! NSNumber))
                    
                }
            }
            search.removeObjectsInArray(tmp)
            
        }
 
        
        prime.addObjectsFromArray(search as [AnyObject])*/
 
        max_primelbl.morphingEffect = .anvil
        sum_primelbl.morphingEffect = .pixelate
        max_primelbl.text=String(describing: prime.max() as! NSNumber)
        sum_primelbl.text=String(prime.count)
        //max_primelbl.text=String((prime[prime.count-1] as! NSNumber))
        //sum_primelbl.text=String(prime.count)
 
    }
    
    
    func showBtnAction(_ sender: UIButton) {
        let showViewController = self.storyboard?.instantiateViewController(withIdentifier: "ShowView") as! ShowAllViewController
        // NavigationControllerのrootViewに遷移先のViewを設定
        //let navi = UINavigationController(rootViewController: showViewController)
       
        // Viewの移動する.
       // self.navigationController?.pushViewController(showViewController, animated: true)
        self.present(showViewController, animated: true, completion: nil)
    }

    @IBAction func tapScreen(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
        print("dere")
    }
    
}
