//
//  ELNRouteBuilderBase.h
//  Broute
//
//  Created by Георгий Касапиди on 26.07.16.
//  Copyright © 2016 ELN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CLLocation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ELNRouteBuilderBase <NSObject>

- (NSURL *)urlForCoordinate:(CLLocationCoordinate2D)coordinate;

@optional

- (NSString *)appStoreID;

@end

NS_ASSUME_NONNULL_END
