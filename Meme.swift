//
//  Meme.swift
//  Meme1.0
//
//  Created by Abdul Kamaldheen on 03.11.21.
//

import Foundation
import UIKit

struct Meme {

	var topText: String
	var bottomText: String
	var originalImage: UIImage
	var memedImage: UIImage
	var combinedText: String

	init(_ topText: String, _ bottomText: String, _ originalImage: UIImage, _ memedImage: UIImage) {
		self.topText = topText
		self.bottomText = bottomText
		self.originalImage = originalImage
		self.memedImage = memedImage
		self.combinedText = topText + bottomText
	}
	
}
