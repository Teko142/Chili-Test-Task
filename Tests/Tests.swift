//
//  Tests.swift
//  Tests
//
//  Created by Артур Олехно on 26/04/2023.
//

// Unit testing is new to me. At the moment I don't understand how and what blocks of code should be tested.
// At the moment, my second test is not successful.

import XCTest
import SwiftUI
final class Tests: XCTestCase {
    
    func testStartFakeNetworkCall() {
        let sut = UICollectionView()
        sut.startFakeNetworkCall()
        // Checking if isLoading became false after 3 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.1) {
            XCTAssertFalse(sut.isLoading)
        }
    }
    
    func testGifDataAppending() {
        let view = UICollectionView()
        
        // Initial gifData count
        XCTAssertEqual(view.gifData.count, 0)
        
        // Append a URL to gifData
        let url = "https://example.com/gif1.gif"
        view.gifData.append(url)
        
        // Verify the updated gifData count and the appended URL
        XCTAssertEqual(view.gifData.count, 1)
    }
    
}

