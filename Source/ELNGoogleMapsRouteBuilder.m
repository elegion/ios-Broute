//
//  ELNGoogleMapsRouteBuilder.m
//  Broute
//
//  Created by Георгий Касапиди on 26.07.16.
//  Copyright © 2016 ELN. All rights reserved.
//

#import "ELNGoogleMapsRouteBuilder.h"

@implementation ELNGoogleMapsRouteBuilder

- (NSURL *)urlForCoordinate:(CLLocationCoordinate2D)coordinate {
    return [NSURL URLWithString:[NSString stringWithFormat:@"comgooglemaps://?daddr=%@,%@", @(coordinate.latitude), @(coordinate.longitude)]];
}

- (NSString *)appStoreID {
    return @"585027354";
}

@end
