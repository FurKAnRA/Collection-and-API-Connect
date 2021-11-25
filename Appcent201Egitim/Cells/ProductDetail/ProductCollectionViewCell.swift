//
//  ProductCollectionViewCell.swift
//  Appcent201Egitim
//
//  Created by Furkan Kara on 21.11.2021.
//

import UIKit
import Kingfisher
class ProductCollectionViewCell: UICollectionViewCell {
   
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var oldPriceLabel: UILabel!
    @IBOutlet weak var newPriceLabel: UILabel!
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        oldPriceLabel.text = nil
        newPriceLabel.text = nil
        typeLabel.text = nil
        imageView.image = nil
    }
    
    
    func configure(product : Product){
        
        nameLabel.text = product.productName
        oldPriceLabel.text = product.oldPrice?.DoubleToString
        newPriceLabel.text = product.newPrice?.DoubleToString
        typeLabel.text = product.type
        
        if let imageURL = product.productImage{
            imageView.setImage(urlString: imageURL)
        }
            
       
    }
}
