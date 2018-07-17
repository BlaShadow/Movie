//
//  WebServiceClient.m
//  Movie
//
//  Created by Blashadow on 7/16/18.
//  Copyright © 2018 Blashadow. All rights reserved.
//

#import "WebServiceClient.h"
#import "WebServiceResponse.h"

@implementation WebServiceClient

+ (id)sharedWebServiceClient {
    static dispatch_once_t token = 0;
    static id _sharedInstance = nil;
    
    dispatch_once(&token, ^{
        _sharedInstance = [[WebServiceClient alloc] init];
    });
    
    return _sharedInstance;
}

#pragma mark -
#pragma mark Request

- (NSURLSessionTask *)executeWithRequest:(NSMutableURLRequest *)request andCompletion:(void (^)(WebServiceResponse *))completion{
    
    NSLog(@"Performing Request to: %@", request.URL.absoluteString);
    
    //Request Response handler (Generic)
    void (^requestHandler)(NSData *data, NSURLResponse *response, NSError *error) = ^(NSData *data, NSURLResponse *response, NSError *error) {
        //Http data
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
        NSInteger statusCode = [httpResponse statusCode];
        NSDictionary *content = nil;
        
        //Parse response object
        if(data != nil){
            content = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        }
        
        //Create service response
        WebServiceResponse *serviceResponse = [[WebServiceResponse alloc]  initWithStatusCode:statusCode andContent:content];
        
        //Respond back
        completion(serviceResponse);
    };
    
    //Create session data task
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:requestHandler];
    
    //Perform request
    [task resume];
    
    return task;
}

#pragma mark -
#pragma mark Movies Api Client Protocol

- (NSURLSessionTask *)retrieveListOfMoviesForPage:(NSInteger)page andCompletionHandler:(void (^)(WebServiceResponse *))completion{
    NSString *url = [self urlWithPath:@"discover/movie"];
    
    //Perform request
    return [self executeWithRequest:[self mutableGETRequestWithUrl:url] andCompletion:completion];
}

#pragma mark -
#pragma mark Misc

- (NSString *)urlWithPath:(NSString *)path{
    NSString *apiKey = @"1f54bd990f1cdfb230adb312546d765d";
    
    return [NSString stringWithFormat:@"https://api.themoviedb.org/3/%@?api_key=%@&language=en-US", path, apiKey];
}

- (NSMutableURLRequest *)mutableGETRequestWithUrl:(NSString *)url{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    
    //Set http verb
    [request setHTTPMethod:@"GET"];
    
    //some http headers
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    return request;
}

@end
