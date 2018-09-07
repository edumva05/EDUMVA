//
//  TabBarController.swift
//  EDUMVA
//
//  Created by EDUMVA5 on 05/09/18.
//

import UIKit

class TabBarController: UIViewController, UIGestureRecognizerDelegate  {
    @IBOutlet weak var tabView: UIView!
    
    var viewControllers: [UIViewController]!
    
    var FeedsViewController: UIViewController!
    var ExamViewController: UIViewController!
    var HomeViewController: UIViewController!
    var FtpViewController: UIViewController!
    var ProflieViewController: UIViewController!
    
    var selectedIndex: Int = 2
    
    @IBOutlet var buttons: [UIButton]!
    
    @IBOutlet weak var viewDisplay: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      /*  tabView.layer.applySketchShadow(
            color: .black,
            alpha: 0.7,
            x: 0,
            y: 0,
            blur: 16,
            spread: 0)
 */
        
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
        
    
   
        
        //Keeps track of the previous button
        let previousIndex = selectedIndex
        //Set the selectedIndex to the tag value of which ever button was tapped.
             print(selectedIndex)
        selectedIndex = sender.tag
             print(selectedIndex)
        //Set previous selected button to non-selected state
        buttons[previousIndex].isSelected = false
        
        //Use the previousIndex to access the previous ViewController from the viewControllers array.
        let previousVC = viewControllers[previousIndex]
       
        //Remove the previous ViewController
        previousVC.willMove(toParentViewController: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        
        //Access the selected button and set it to the selected state.
        sender.isSelected = true
        
        //Use the selectedIndex to access the current ViewController from the viewControllers array.
        let vc = viewControllers[selectedIndex]
        //Add the new ViewController to display view
        addChildViewController(vc)
        
        //Adjusts the size of the ViewController view add it as a subView of the contentView.
        vc.view.frame = viewDisplay.bounds
        viewDisplay.addSubview(vc.view)
        //Call the viewDidAppear method of the coming ViewController
        vc.didMove(toParentViewController: self)
        
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
