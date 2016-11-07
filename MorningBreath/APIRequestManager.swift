//
//  APIRequestManager.swift
//  MorningBreath
//
//  Created by Karen Fuentes, Thinley Dorjee, Victor Zhong on 11/7/16.
//  Copyright © 2016 Karen Fuentes, Thinley Dorjee, Victor Zhong. All rights reserved.
//


import Foundation

class APIRequestManager {
	
	static let manager = APIRequestManager()
	private init() {}
	
	func getData(endPoint: String, callback: @escaping (Data?) -> Void) {
		guard let myURL = URL(string: endPoint) else { return }
		let session = URLSession(configuration: URLSessionConfiguration.default)
		session.dataTask(with: myURL) { (data: Data?, response: URLResponse?, error: Error?) in
			if error != nil {
				print("Error durring session: \(error)")
			}
			guard let validData = data else { return }
			callback(validData)
			}.resume()
	}
}