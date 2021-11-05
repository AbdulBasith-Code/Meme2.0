//
//  MemeDetailView.swift
//  Meme2.0
//
//  Created by Abdul Kamaldheen on 05.11.21.
//

import Foundation
import UIKit

class MemeDetailViewController: UIViewController {

	var image: UIImage!

	@IBOutlet var memeImageView: UIImageView!

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)

		if let image = image {
			memeImageView.image = image
		}
	}
}
