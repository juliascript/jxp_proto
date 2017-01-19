//
//  ViewController.swift
//  juxtaposed_prototype
//
//  Created by Julia on 1/17/17.
//  Copyright © 2017 Julia Geist. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var stanceInfo: [String] = []

    @IBOutlet weak var politicianImageView: UIImageView!
    @IBOutlet weak var issueTextLabel: UITextView!
    @IBOutlet weak var tableView: UITableView!
    
    let abortionStanceArray: [String] = [    "Don't go back to criminalizing women and doctors. (Sep 2010)", "Baby is born at birth, not at partial-birth. (Apr 2006)", "Condemns restrictions on embryonic stem cell research. (Aug 2004)", "Voted NO on restricting UN funding for population control policies. (Mar 2009)", "Voted NO on defining unborn child as eligible for SCHIP. (Mar 2008)", "Voted NO on prohibiting minors crossing state lines for abortion. (Mar 2008)", "Voted NO on barring HHS grants to organizations that perform abortions. (Oct 2007)", "Voted YES on expanding research to more embryonic stem cell lines. (Apr 2007)", "Voted NO on notifying parents of minors who get out-of-state abortions. (Jul 2006)", "Voted YES on $100M to reduce teen pregnancy by education & contraceptives. (Mar 2005)", "Voted NO on criminal penalty for harming unborn fetus during other crime. (Mar 2004)", "Voted NO on banning partial birth abortions except for maternal life. (Mar 2003)", "Voted NO on maintaining ban on Military Base Abortions. (Jun 2000)", "Voted NO on banning human cloning. (Feb 1998)", "Endorsed Recommended by EMILY's List of pro-choice women. (Apr 2001)", "Rated 100% by NARAL, indicating a pro-choice voting record. (Dec 2003)", "Expand embryonic stem cell research. (Jun 2004)", "Sponsored bill providing contraceptives for low-income women. (May 2006)", "Sponsored bill for emergency contraception for rape victims. (Sep 2006)", "Rated 0% by the NRLC, indicating a pro-choice stance. (Dec 2006)", "Provide emergency contraception at military facilities. (Apr 2007)", "Opposes prohibiting human embryonic stem cell research. (Aug 2010)", "Let military perform abortions in cases of rape or incest. (Jun 2011)", "Require pharmacies to fulfill contraceptive prescriptions. (Jul 2011)", "Ban anti-abortion limitations on abortion services. (Nov 2013)", "Access safe, legal abortion without restrictions. (Jan 2015)", "Protect the reproductive rights of women. (Jan 1993)", "Ensure access to and funding for contraception. (Feb 2007)", "Focus on preventing pregnancy, plus emergency contraception. (Jan 2009)", "Emergency contraception at all military health facilities. (Dec 2009)" ]
    
    let budgetAndEconArray: [String] = ["test"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        UserDefaults.standard.setValue(Issue.Abortion.rawValue, forKey: "issue")
        if let issue = UserDefaults.standard.value(forKey: "issue") as! String!{
            issueTextLabel.text = issue
            loadTheCorrectIssueData(issue: Issue(rawValue: issue)!)
        } else {
            issueTextLabel.text = "Abortion"
            loadTheCorrectIssueData(issue: Issue(rawValue: "Abortion")!)
        }
        
        politicianImageView.clipsToBounds = true
        politicianImageView.layer.cornerRadius = 50
    }
    
    
    func loadTheCorrectIssueData(issue: Issue) {
        
        switch issue{
        case .Abortion:
            stanceInfo = abortionStanceArray
            break
        case .BudgetAndEconomy:
            stanceInfo = budgetAndEconArray
            break
        case .CivilRights:
            break
        case .Corporations:
            break
        case .Crime:
            break
        case .Drugs:
            break
        case .Education:
            break
        case .EnergyAndOil:
            break
        case .Environment:
            break
        case .FamiliesAndChildren:
            break
        case .ForiegnPolicy:
            break
        case .FreeTrade:
            break
        case .GovernmentReform:
            break
        case .GunControl:
            break
        case .HealthCare:
            break
        case .HomelandSecurity:
            break
        case .Immigration:
            break
        case .Jobs:
            break
        case .PrinciplesAndValues:
            break
        case .SocialSecurity:
            break
        case .TaxReform:
            break
        case .Technology:
            break
        case .WarAndPeace:
            break
        case .WelfareAndPoverty:
            break
        }
        tableView.reloadData()
    }
    
    @IBAction func changeIssueButtonTapped(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "showIssueTableView", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stanceInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = stanceInfo[indexPath.row]
        cell.textLabel?.lineBreakMode = .byWordWrapping
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}

