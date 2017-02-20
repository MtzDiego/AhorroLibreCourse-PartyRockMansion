//
//  PartyCell.swift
//  Party Rock Mansion
//
//  Created by Macbook on 2/17/17.
//  Copyright © 2017 ahorro libre. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {
    
    @IBOutlet weak var videPreviewImage: UIImageView!
    @IBOutlet weak var videoTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func updateUI(partyRock: PartyRock){
        videoTitle.text = partyRock.videoTitlte
        let url = URL(string: partyRock.imageURL)!
        DispatchQueue.global().async {
            do{
                let data = try Data(contentsOf: url)
                DispatchQueue.global().sync {
                    self.videPreviewImage.image = UIImage(data: data)
                }
            }catch {
                //handle the error
            }
            
        }
    }
    
}


