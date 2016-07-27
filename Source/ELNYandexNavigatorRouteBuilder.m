//
//  ELNYandexNavigatorRouteBuilder.m
//  Broute
//
//  Created by Георгий Касапиди on 26.07.16.
//  Copyright © 2016 ELN. All rights reserved.
//

#import "ELNYandexNavigatorRouteBuilder.h"

@implementation ELNYandexNavigatorRouteBuilder

- (NSURL *)urlForCoordinate:(CLLocationCoordinate2D)coordinate {
    return [NSURL URLWithString:[NSString stringWithFormat:@"yandexnavi://build_route_on_map?lat_to=%@&lon_to=%@", @(coordinate.latitude), @(coordinate.longitude)]];
}

- (NSString *)appStoreID {
    return @"474500851";
}

@end
