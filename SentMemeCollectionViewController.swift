//
//  SentMemeCollectionViewController.swift
//  Meme1.0
//
//  Created by Abdul Kamaldheen on 04.11.21.
//

import Foundation
import UIKit

class SentMemeCollectionViewController: UICollectionViewController {

	@IBOutlet weak var flowLayout: UICollectionViewFlowLayout!

	var memes: [Meme]! {
		let object = UIApplication.shared.delegate
		let appDelegate = object as! AppDelegate
		return appDelegate.memes
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(add))
		self.navigationItem.title = "Sent Memes"
		self.collectionView.backgroundColor = UIColor.white
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(true)

		let space: CGFloat = -1.0

		let height = view.frame.size.height
		let width = view.frame.size.width

		let dimension: CGFloat

		if height > width {
			dimension = (view.frame.size.height - view.frame.size.width) / 2.0
		} else {
			dimension = (view.frame.size.width - (view.frame.size.height)) / 2.0
		}

		flowLayout.minimumInteritemSpacing = space
		flowLayout.minimumLineSpacing = space
		flowLayout.itemSize = CGSize(width: dimension, height: dimension)
		collectionView.setCollectionViewLayout(flowLayout, animated: true)

		collectionView.reloadData()
	}

	// MARK: Collection View Data Source

	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return self.memes.count
	}

	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
		let meme = self.memes[(indexPath as NSIndexPath).row]

		// Set the name and image
		cell.nameLabel.text = meme.combinedText
		cell.nameLabel.textColor = UIColor.black
		cell.memeImageView?.image = meme.memedImage

		return cell
	}

	@objc func add() {
		performSegue(withIdentifier: "addMeme", sender: self)
	}
}
