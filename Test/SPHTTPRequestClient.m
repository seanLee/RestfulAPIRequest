//
//  SPHTTPRequestShared.m
//  Test
//
//  Created by Sean on 16/5/25.
//  Copyright © 2016年 sean. All rights reserved.
//

#import "SPHTTPRequestClient.h"

@implementation SPHTTPRequestClient
static SPHTTPRequestClient *_sharedClient = nil;
static dispatch_once_t onceToken;

+ (SPHTTPRequestClient *)sharedJsonClient {
    dispatch_once(&onceToken, ^{
        _sharedClient = [[SPHTTPRequestClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://test.leisu.com/app"] sessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    });
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url sessionConfiguration:(NSURLSessionConfiguration *)configuration {
    self = [super initWithBaseURL:url sessionConfiguration:configuration];
    if (self) {
        //request
        AFHTTPRequestSerializer *requestSerializer = [AFHTTPRequestSerializer serializer];
        //Authorization
        [requestSerializer setValue:@"Basic dGlhbnRpYW50dnR2QGdtYWlsLmNvbToxMDB3YW51di4h" forHTTPHeaderField:@"Authorization"];
        self.requestSerializer = requestSerializer;
        
        //response
        AFHTTPResponseSerializer *responseSerializer = [AFJSONResponseSerializer serializer];
        responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript",@"multipart/form-data", nil];
        self.responseSerializer = responseSerializer;
    }
    return self;
}

#pragma mark - Request
- (void)requestJsonDataWithPath:(NSString *)aPath withParams:(NSDictionary *)params withMethodType:(NetworkMethod)method andBlock:(void (^)(id, NSError *))block {
    [self requestJsonDataWithPath:aPath withParams:params withMethodType:method autoShowError:YES andBlock:block];
}

- (void)requestJsonDataWithPath:(NSString *)aPath withParams:(NSDictionary *)params withMethodType:(NetworkMethod)method autoShowError:(BOOL)autoShowError andBlock:(void (^)(id, NSError *))block {
    //check the path
    if (!aPath || aPath.length == 0) {
        return;
    }
    
    aPath = [aPath stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLPathAllowedCharacterSet]];
    switch (method) {
        case Get: {
            [self GET:aPath parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
            }];
        }
            break;
        case Post: {
            [self POST:aPath parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSLog(@"%@",responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
            }];
        }
            break;
        case Put: {
            [self PUT:aPath parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
            }];
        }
            break;
        case Delete: {
            [self DELETE:aPath parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
            }];
        }
            break;
    }
}

@end
