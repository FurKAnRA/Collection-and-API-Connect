//
//  CartCollectionViewCell.swift
//  Appcent201Egitim
//
//  Created by Furkan Kara on 24.11.2021.
//

import UIKit

protocol CartCollectionViewCellDelegate : AnyObject{
    func actionDeleteButton( product : Product)
}
class CartCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var delegate : CartCollectionViewCellDelegate?
    private var product : Product?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        priceLabel.text = nil
        imageView.image = nil
    }
    func configure(with product : Product){
        self.product = product
        imageView.setImage(urlString: product.productImage )
        nameLabel.text = product.productName
        priceLabel.text = product.newPrice?.DoubleToString
    }
   
    @IBAction func deleteButton(_ sender: Any) {
        guard let product = product else {
            return
        }
            
        delegate?.actionDeleteButton(product: product )
       
    }
    
   
    
}
