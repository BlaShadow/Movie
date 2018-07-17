//
//  WebServiceClient.h
//  Movie
//
//  Created by Blashadow on 7/16/18.
//  Copyright © 2018 Blashadow. All rights reserved.
//

#import "MoviesApiClientProtocol.h"

@interface WebServiceClient : NSObject<MoviesApiClientProtocol>

/*
 *  Singleton instance
 *
 * **/
+ (id)sharedWebServiceClient;

@end
