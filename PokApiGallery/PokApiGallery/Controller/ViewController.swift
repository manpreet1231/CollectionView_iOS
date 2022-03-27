
import Foundation
import UIKit

class pokeViewController: UIViewController {

    @IBOutlet weak var ContainerView: UIView!
    var arrya : [UIImage] = []
    @IBOutlet var collectionGallery: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionGallery.dataSource = self
        collectionGallery.delegate = self
       
        PokeAPIHelper.fetchAllImages { [self] images in
            self.arrya = images
            collectionGallery.reloadData()
        }
    }

}
extension pokeViewController : UICollectionViewDataSource , UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return arrya.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionGallery.dequeueReusableCell(withReuseIdentifier: "cells", for: indexPath) as! PokeGalleryCell
        cell.subjimage.image = arrya[indexPath.row]
        return cell
    }
    
    
}
extension pokeViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screensize = collectionGallery.frame.size
        return CGSize(width: screensize.width/2.5, height: screensize.height/4)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 15, bottom: 0, right: 25)
    }
}
