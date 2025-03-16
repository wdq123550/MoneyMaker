//
//  MMSandBox.swift
//  MoneyMaker
//
//  Created by 小君夜麻吕 on 2025/3/16.
//

import Foundation

// 获取 Documents 目录
let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first

// 获取 Preferences 目录
let preferencesDirectory = FileManager.default.urls(for: .preferencePanesDirectory, in: .userDomainMask).first

// 获取 Caches 目录
let cachesDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first

// 获取 Temporary 目录
let tempDirectory = FileManager.default.temporaryDirectory
