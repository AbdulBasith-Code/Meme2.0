//
//  SentMemeTableViewController.swift
//  Meme1.0
//
//  Created by Abdul Kamaldheen on 03.11.21.
//

import Foundation
import UIKit

class SentMemeTableViewController: UITableViewController {

	var memes: [Meme]! {
		let object = UIApplication.shared.delegate
		let appDelegate = object as! AppDelegate
		return appDelegate.memes
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(add))
		self.navigationItem.title = "Sent Memes"
		self.tableView.backgroundColor = UIColor.white
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(true)
		self.tableView.reloadData()
	}

	override func numberOfSections(in tableView: UITableView) -> Int {
		return self.memes.count
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}

	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 60
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell")!

		let meme = self.memes[(indexPath as NSIndexPath).section]

		// Set the name and image
		cell.textLabel?.text = meme.combinedText
		cell.imageView?.image = meme.memedImage

		cell.backgroundColor = UIColor.clear
		return cell
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let detailController = self.storyboard?.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
		detailController.image = self.memes[(indexPath as NSIndexPath).section].memedImage
		self.navigationController!.pushViewController(detailController, animated: true)
	}

	@objc func add() {
		performSegue(withIdentifier: "addMeme", sender: self)
	}

}
