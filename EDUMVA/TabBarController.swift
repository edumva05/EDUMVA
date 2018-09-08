//
//  TabBarController.swift
//  EDUMVA
//
//  Created by EDUMVA5 on 05/09/18.
//

import UIKit

class TabBarController: UIViewController, UIGestureRecognizerDelegate  {
    @IBOutlet weak var tabView: UIView!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    
    
    
    var viewControllers: [UIViewController]!
    
    var FeedsViewController: UIViewController!
    var ExamViewController: UIViewController!
    var HomeViewController: UIViewController!
    var FtpViewController: UIViewController!
    var ProflieViewController: UIViewController!
    
    var selectedIndex: Int = 0
    
    @IBOutlet var buttons: [UIButton]!
    
    @IBOutlet weak var viewDisplay: UIView!
    
    @IBOutlet weak var BlueMovingView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BlueMovingView.bounds.size.width = (tabView.bounds.size.width * (98/1366))
        BlueMovingView.bounds.size.height = (tabView.bounds.size.height * (8/79))
        

        
   
    /*    BlueMovingView.center.x = tabView.center.x
        BlueMovingView.center.y = tabView.center.y
       
       */
        tabView.layer.applySketchShadow(
            color: .black,
            alpha: 0.7,
            x: 0,
            y: 0,
            blur: 16,
            spread: 0)
 
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        //Initalize storyboards
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        FeedsViewController = storyboard.instantiateViewController(withIdentifier: "FeedsViewController")
        ExamViewController = storyboard.instantiateViewController(withIdentifier: "ExamViewController")
        HomeViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController")
        FtpViewController = storyboard.instantiateViewController(withIdentifier: "FtpViewController")
        ProflieViewController = storyboard.instantiateViewController(withIdentifier: "ProflieViewController")
        
        //Add stroyboards to array
        viewControllers = [ FeedsViewController, ExamViewController,HomeViewController, FtpViewController, ProflieViewController]
        
        //Initallly select a ViewController
        
        didPressTab(buttons[selectedIndex])

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func didPressTab(_ sender: UIButton) {
        
    
   
        
     
        let previousIndex = selectedIndex
  
             print(selectedIndex)
        selectedIndex = sender.tag
             print(selectedIndex)
      
        buttons[previousIndex].isSelected = false
        

        let previousVC = viewControllers[previousIndex]
       
       
        previousVC.willMove(toParentViewController: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        
       
        sender.isSelected = true
        
     
        let vc = viewControllers[selectedIndex]
        
        addChildViewController(vc)
        
        
        vc.view.frame = viewDisplay.bounds
        viewDisplay.addSubview(vc.view)
       
        vc.didMove(toParentViewController: self)
        
    }
    
    
    
    @IBAction func MovingBlueImageView(_ sender: UIButton)
    {
        btn1.setImage(#imageLiteral(resourceName: "FeedsGrey.png"), for: .normal)
        btn2.setImage(#imageLiteral(resourceName: "ResultGrey.png"), for: .normal)
        btn3.setImage(#imageLiteral(resourceName: "HomeGrey.png"), for: .normal)
        btn4.setImage(#imageLiteral(resourceName: "FTPGrey.png"), for: .normal)
        btn5.setImage(#imageLiteral(resourceName: "ProfileGrey.png"), for: .normal)
        
        if(sender.tag == 0)
        {
            
        }
        
        UIView.animate(withDuration: 0.30, delay: 0, options: [UIViewAnimationOptions.curveEaseInOut], animations: {
           
            () -> Void in
            
            self.BlueMovingView.center.x = sender.center.x
        }, completion: { (finished) -> Void in
         
        })
    
        
    }
    

    
    
    
    
    

}

extension CALayer {
    func applySketchShadow(
        color: UIColor = .black,
        alpha: Float = 0.5,
        x: CGFloat = 0,
        y: CGFloat = 2,
        blur: CGFloat = 4,
        spread: CGFloat = 0)
    {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        if spread == 0 {
            shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}
