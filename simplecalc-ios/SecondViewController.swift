//
//  SecondViewController.swift
//  simplecalc-ios
//
//  Created by Isaac Chen on 1/30/18.
//  Copyright © 2018 Isaac Chen. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var scroller: UIScrollView!
    
    var scrollHistory:[String] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if scrollHistory.count != 0 {
            for index in 0...scrollHistory.count-1 {
                let label = UILabel(frame:CGRect(x: 50, y: index*25+50, width: 300, height: 40))
                label.text = scrollHistory[index]
                scroller.addSubview(label)
            }
        }
        scroller.contentSize = CGSize(width:400, height:scrollHistory.count*25 + 70)

        // Do any additional setup after loading the view.
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! ViewController
        controller.history = scrollHistory
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
