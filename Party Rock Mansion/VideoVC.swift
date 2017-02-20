//
//  VideoVC.swift
//  Party Rock Mansion
//
//  Created by Macbook on 2/17/17.
//  Copyright © 2017 ahorro libre. All rights reserved.
//

import UIKit

class VideoVC: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var navbar: UINavigationBar!
    @IBOutlet weak var Titlenav: UINavigationItem!
    @IBOutlet weak var backbtn: UIBarButtonItem!
    private var _partyRock: PartyRock!
    var partyRock: PartyRock{
        get{
            return _partyRock
        } set {
            _partyRock = newValue
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //lblTitle.text = partyRock.videoTitlte
        webView.loadHTMLString(partyRock.videoURL, baseURL: nil)
        Titlenav.title = partyRock.videoTitlte
    }
    @IBAction func goBack(_ sender: Any) {
        performSegue(withIdentifier: "Back", sender: AnyObject.self)
    }
    
}
