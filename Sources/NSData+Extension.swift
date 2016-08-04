//
//  NSData+Extension.swift
//  APIKit
//
//  Created by Keiji Suzuki on 2016/08/04.
//  Copyright © 2016年 Yosuke Ishikawa. All rights reserved.
//

import Foundation

extension NSData {
    func cleanUTF8() -> NSData? {
        let cd = iconv_open("UTF-8", "UTF-8")
        var one = 1
        iconvctl(cd, ICONV_SET_DISCARD_ILSEQ, &one)
        var inbytesleft = self.length
        var outbytesleft = self.length
        var inbuf = unsafeBitCast(self.bytes, UnsafeMutablePointer<Int8>.self)
        let outbuf = malloc(sizeof(Int8) * self.length)
        var outptr = unsafeBitCast(outbuf, UnsafeMutablePointer<Int8>.self)
        var result: NSData? = nil
        if (iconv(cd, &inbuf, &inbytesleft, &outptr, &outbytesleft) == -1) {
            print("this should not happen, seriously")
        } else {
            result = NSData.init(bytes: outbuf, length: self.length - outbytesleft)
        }
        iconv_close(cd)
        free(outbuf)
        return result
    }
}