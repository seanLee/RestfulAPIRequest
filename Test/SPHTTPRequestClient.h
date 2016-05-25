//
//  SPHTTPRequestShared.h
//  Test
//
//  Created by Sean on 16/5/25.
//  Copyright © 2016年 sean. All rights reserved.
//

typedef enum {
    Get = 0,
    Post,
    Put,
    Delete
} NetworkMethod;

#import <AFNetworking/AFNetworking.h>

@interface SPHTTPRequestClient : AFHTTPSessionManager
+ (id)sharedJsonClient;

- (void)requestJsonDataWithPath:(NSString *)aPath
                     withParams:(NSDictionary*)params
                 withMethodType:(NetworkMethod)method
                       andBlock:(void (^)(id data, NSError *error))block;

- (void)requestJsonDataWithPath:(NSString *)aPath
                     withParams:(NSDictionary*)params
                 withMethodType:(NetworkMethod)method
                  autoShowError:(BOOL)autoShowError
                       andBlock:(void (^)(id data, NSError *error))block;
@end
