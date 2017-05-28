//
//  TabController.swift
//  HealthCare
//
//  Created by KALSI on 4/13/17.
//  Copyright © 2017 KALSI. All rights reserved.
//

import UIKit

class TabController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var Container : UIView!
    @IBOutlet weak var sideMenu: UIScrollView!
    
    @IBOutlet weak var _containerView: UIView!
    
    @IBOutlet weak var menuHomeIV: UIImageView!
    @IBOutlet weak var menuAccIV: UIImageView!
    @IBOutlet weak var menuFAQiv: UIImageView!
    
    @IBOutlet weak var menuHomeView: UIView!
    @IBOutlet weak var menuAccView: UIView!
    @IBOutlet weak var menuFAQView: UIView!
    
    weak var currentViewController : UIViewController?
    var storyboardId = String()
    
    let ColorSelection = UIColor(red: 212.0/255.0, green: 234.0/255.0, blue: 232.0/255.0, alpha: 1)
    var sideMenuArray = NSArray()
    var toolsMenuArray = NSArray()
    var sideImages = NSArray()
    var toolsImages = NSArray()
    
    //MARK:-
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.view.bringSubview(toFront: self._containerView)
        sideMenu.setContentOffset(CGPoint(x: self.view.frame.size.width, y: -20), animated: false)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sideMenuArray = ["Home", "Profile", "Appointments", "Notifications", "Gallery", "Videos", "Reports", "Campaign", "New & Updates", "FAQ", "History/Records"]
        toolsMenuArray = [ "Settings", "Log Out"];
        
        sideImages = ["homeGray", "profileGray", "appmntsGray", "notificationGray", "galleryGray", "videoGray", "reportsGray", "campaignGray", "updatesGray", "faqGray", "historyGray"]
        toolsImages = [ "settingGray", "logoutGray"];
        
        loadFirstControllerInContainer()
        NotificationCenter.default.addObserver(self, selector: #selector(self.toggleMenu(_:)), name: Notification.Name("toggleMenu"), object: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewDidLayoutSubviews() {
        sideMenu.contentSize = CGSize(width: self.view.frame.size.width*2, height: 0)
    }
    //MARK:-
    //MARK:- Container View Funcitons -
    func loadFirstControllerInContainer() {
        storyboardId = "Home"
        self.currentViewController = self.storyboard?.instantiateViewController(withIdentifier: storyboardId)
        self.currentViewController!.view.translatesAutoresizingMaskIntoConstraints = false
        self.addChildViewController(self.currentViewController!)
        self.addSubview(subView: self.currentViewController!.view, toView: Container)
    }
    func loadViewController_withIdentifier(identifier : String) {
        let newViewController = self.storyboard?.instantiateViewController(withIdentifier: identifier)
        newViewController!.view.translatesAutoresizingMaskIntoConstraints = false
        self.cycleFromViewController(oldViewController: self.currentViewController!, toViewController: newViewController!)
        self.currentViewController = newViewController
    }
    func addSubview(subView:UIView, toView parentView:UIView) {
        parentView.addSubview(subView)
        var viewBindingsDict = [String: AnyObject]()
        viewBindingsDict["subView"] = subView
        parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[subView]|",
                                                                 options: [], metrics: nil, views: viewBindingsDict))
        parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[subView]|",
                                                                 options: [], metrics: nil, views: viewBindingsDict))
    }
    func cycleFromViewController(oldViewController: UIViewController, toViewController newViewController: UIViewController) {
        oldViewController.willMove(toParentViewController: nil)
        self.addChildViewController(newViewController)
        if !(Container.subviews).contains(newViewController.view){
            self.addSubview(subView: newViewController.view, toView:Container)
        }
        newViewController.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.5, animations: {
            newViewController.view.layoutIfNeeded()
        },
                       completion: { finished in
                        oldViewController.view.removeFromSuperview()
                        oldViewController.removeFromParentViewController()
                        newViewController.didMove(toParentViewController: self)
        })
    }
    //MARK: End
    func resetBottomMenu() {
        menuHomeIV.image = UIImage(named: "homeGray")
        menuHomeView.backgroundColor = UIColor.white
        menuAccIV.image = UIImage(named: "usernameGray")
        menuAccView.backgroundColor = UIColor.white
        menuFAQiv.image = UIImage(named: "infoGray")
        menuFAQView.backgroundColor = UIColor.white
    }
    
    //MARK:- IBActions -
    @IBAction func SwitchTabs(_ sender: UIButton) {
        resetBottomMenu()
        switch sender.tag {
        case 0:
            menuHomeIV.image = UIImage(named: "homeGreen")
            menuHomeView.backgroundColor = ColorSelection
            break
        case 1:
            menuAccIV.image = UIImage(named: "usernameGreen")
            menuAccView.backgroundColor = ColorSelection
            break
        case 2:
            menuFAQiv.image = UIImage(named: "infoGreen")
            menuFAQView.backgroundColor = ColorSelection
            break
        default:
            break
        }
    }
    func toggleNow() {
        if sideMenu.contentOffset.x == 0{
            sideMenu.setContentOffset(CGPoint(x: self.view.frame.size.width, y: -20), animated: true)
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (Timer) in
                self.view.bringSubview(toFront: self._containerView)
            })
        }else{
            sideMenu.setContentOffset(CGPoint(x: 0, y: -20), animated: true)
            self.view.bringSubview(toFront: sideMenu)
        }
    }
    @IBAction func toggleMenu(_ sender: UIButton) {
        toggleNow()
    }
    
    //MARK:- UITableView -
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return sideMenuArray.count
        }else{
            return toolsMenuArray.count
        }
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "TabCell", for: indexPath) as? TabCell
        if cell == nil{
            cell = TabCell(style: .default, reuseIdentifier: "TabCell")
        }
        if indexPath.section == 0{
            cell?.menuText.text = sideMenuArray.object(at: indexPath.row)  as? String
            cell?.menuImage.image = UIImage(named: sideImages.object(at: indexPath.row)  as! String)
        }else{
            cell?.menuText?.text = toolsMenuArray.object(at: indexPath.row)  as? String
            cell?.menuImage.image = UIImage(named: toolsImages.object(at: indexPath.row)  as! String)
        }
        return cell!
    }
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        toggleNow()
    }
    //Header
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1{
            return "Tools"
        }else{
            return ""
        }
    }
}
