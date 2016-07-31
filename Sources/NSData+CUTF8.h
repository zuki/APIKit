//
//  NSData+CUTF8.h
//  APIKit
//
//  Created by Keiji Suzuki on 2016/07/31.
//  Copyright © 2016年 Yosuke Ishikawa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <iconv.h>

@interface NSData (CUTF8)
- (NSData *)cleanUTF8;
@end
