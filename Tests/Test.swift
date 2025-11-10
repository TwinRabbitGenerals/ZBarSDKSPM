//
//  Test 2.swift
//  ZBarSDKSPM
//
//  Created by SangWoo So on 11/7/25.
//

import Testing

import ZBarSDK

struct Test {

    @Test func test() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        let img = ZBarImage()
        print(img.description)
    }

}
