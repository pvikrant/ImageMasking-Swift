//
//  ViewController.swift
//  Image Masking
//
//  Created by AppEdify TechnoWorld on 27/02/2019.
//  Copyright © 2019 AppEdify TechnoWorld. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var btnOrignal: UIButton!
    
    @IBOutlet weak var btnBlue: UIButton!
    
    @IBOutlet weak var btnRed: UIButton!
    
    @IBOutlet weak var btnGreen: UIButton!
    
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func ipMaskedImageNamed(_ image: UIImage?, color: UIColor?) -> UIImage? {
        
        let rect = CGRect(x: 0, y: 0, width: image?.size.width ?? 0.0, height: image?.size.height ?? 0.0)
        
        UIGraphicsBeginImageContextWithOptions(rect.size, _: false, _: 0.0)
        
        let c = UIGraphicsGetCurrentContext()
        image?.draw(in: rect)
        c?.setAlpha(1.0)
        c?.setFillColor((color?.cgColor)!)
        c!.setBlendMode(.sourceAtop)
        c?.fill(rect)
        let result: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result
    }

    @IBAction func btnActionForOrignal(_ sender: Any)
    {
        imgView.image = ipMaskedImageNamed(UIImage(named: "christmas-256"), color: UIColor.black)
    }
    
    @IBAction func btnActionForBlue(_ sender: Any)
    {
        imgView.image = ipMaskedImageNamed(UIImage(named: "christmas-256"), color: UIColor.blue)
    }
    @IBAction func btnActionForRed(_ sender: Any)
    {
        imgView.image = ipMaskedImageNamed(UIImage(named: "christmas-256"), color: UIColor.red)
    }
    
    @IBAction func btnActionForGreen(_ sender: Any)
    {
        imgView.image = ipMaskedImageNamed(UIImage(named: "christmas-256"), color: UIColor.green)
    }
    
    
}

