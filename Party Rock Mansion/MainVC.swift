//
//  ViewController.swift
//  Party Rock Mansion
//
//  Created by Macbook on 2/17/17.
//  Copyright © 2017 ahorro libre. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var partyRocks = [PartyRock]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let p1 = PartyRock(imageURL: "https://upload.wikimedia.org/wikipedia/en/thumb/b/b7/Redfoo-Let's-Get-Ridiculous.jpg/220px-Redfoo-Let's-Get-Ridiculous.jpg", videoURL: "<div style=\"position:relative;height:0;padding-bottom:56.25%\"><iframe src=\"https://www.youtube.com/embed/CdLhdrNgGu4?ecver=2\" width=\"640\" height=\"360\" frameborder=\"0\" style=\"position:absolute;width:100%;height:100%;left:0\" allowfullscreen></iframe></div>", videoTitle: "let's Ridiculous")
        let p2 = PartyRock(imageURL: "http://orig00.deviantart.net/58fa/f/2011/329/1/1/lmfao_sorry_for_party_rocking_by_hiyorilove-d4h90qn.jpg", videoURL: "<div style=\"position:relative;height:0;padding-bottom:56.25%\"><iframe src=\"https://www.youtube.com/embed/SkTt9k4Y-a8?ecver=2\" width=\"640\" height=\"360\" frameborder=\"0\" style=\"position:absolute;width:100%;height:100%;left:0\" allowfullscreen></iframe></div>", videoTitle: "Sorry For Party Rocking")
        let p3 = PartyRock(imageURL: "http://flowhot.me/wp-content/uploads/2015/02/Redfoo-Juicy-Wiggle-iTunes-300x300.jpg", videoURL: "<div style=\"position:relative;height:0;padding-bottom:56.25%\"><iframe src=\"https://www.youtube.com/embed/tWyuglGCKgE?ecver=2\" width=\"640\" height=\"360\" frameborder=\"0\" style=\"position:absolute;width:100%;height:100%;left:0\" allowfullscreen></iframe></div>", videoTitle: "Juicy Wiggle")
        let p4 = PartyRock(imageURL: "http://www.josepvinaixa.com/blog/wp-content/uploads/2015/07/Redfoo-Where-the-Sun-Goes-2015-1200x1200-Single.png", videoURL: "<div style=\"position:relative;height:0;padding-bottom:56.25%\"><iframe src=\"https://www.youtube.com/embed/TrVLu9p65a0?ecver=2\" width=\"640\" height=\"360\" frameborder=\"0\" style=\"position:absolute;width:100%;height:100%;left:0\" allowfullscreen></iframe></div>", videoTitle: "Where the Sun Goes")
        let p5 = PartyRock(imageURL: "https://pbs.twimg.com/profile_images/694863889851232256/lYJafKNo.jpg", videoURL: "<div style=\"position:relative;height:0;padding-bottom:56.25%\"><iframe src=\"https://www.youtube.com/embed/KQ6zr6kCPj8?ecver=2\" width=\"640\" height=\"360\" frameborder=\"0\" style=\"position:absolute;width:100%;height:100%;left:0\" allowfullscreen></iframe></div>", videoTitle: "Party Rock")
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        partyRocks.append(p5)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell{
            let partyRock = partyRocks[indexPath.row]
            cell.setNeedsLayout()
            cell.updateUI(partyRock: partyRock)
            return cell
        }else{
            return UITableViewCell()
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRocks[indexPath.row]
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoVC{
            if let party = sender as? PartyRock{
                destination.partyRock = party
            }
        }
    }
}

