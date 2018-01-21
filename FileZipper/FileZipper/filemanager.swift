//
//  filemanager.swift
//  FileZipper
//
//  Created by Uchenna  Aguocha on 1/20/18.
//  Copyright © 2018 Uchenna  Aguocha. All rights reserved.
//

import Foundation
import UIKit
import Zip

let filePath = Bundle.main.url(forResource: "file", withExtension: "zip")!
let documentDirectory = FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask)


