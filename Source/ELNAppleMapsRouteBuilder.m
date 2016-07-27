//
//  ELNAppleMapsRouteBuilder.m
//  Broute
//
//  Created by Георгий Касапиди on 26.07.16.
//  Copyright © 2016 ELN. All rights reserved.
//

#import "ELNAppleMapsRouteBuilder.h"

@implementation ELNAppleMapsRouteBuilder

- (NSURL *)urlForCoordinate:(CLLocationCoordinate2D)coordinate {
    return [NSURL URLWithString:[NSString stringWithFormat:@"http://maps.apple.com/?daddr=%@,%@", @(coordinate.latitude), @(coordinate.longitude)]];
}

@end
