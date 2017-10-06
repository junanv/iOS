//
//  ViewController.swift
//  ImageView
//
//  Created by 장준환 on 2017. 10. 6..
//  Copyright © 2017년 장준환. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var isZoom = false;
    var imgOn = UIImage(named: "lamp_on.png"); //켜진 전구
    var imgOff = UIImage(named: "lamp_off.png"); // 꺼진 전구
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var btnResize: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imgView.image = imgOn; //최초는 켜진 전구로
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnResizeImage(_ sender: UIButton) {
        let scale : CGFloat = 2.0 // scale 상수를 float으로 선언하고, 2.0으로 셋팅, CGFloat이나 Float이나 같다고 보면 됨.
        var newWidth:CGFloat, newHeight : CGFloat
        
        if(isZoom) {
            newWidth = imgView.frame.width / scale;
            newHeight = imgView.frame.height / scale;
            imgView.frame.size = CGSize(width: newWidth, height: newHeight);
            btnResize.setTitle("확대", for: .normal);
        } else {
            newWidth = imgView.frame.width * scale;
            newHeight = imgView.frame.height * scale;
            imgView.frame.size = CGSize(width: newWidth, height: newHeight);
            btnResize.setTitle("축소", for: .normal);
        }
        
        isZoom = !isZoom
    }

    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        if(sender.isOn){
            imgView.image = imgOn;
        } else {
            imgView.image = imgOff;
        }
    }
}

