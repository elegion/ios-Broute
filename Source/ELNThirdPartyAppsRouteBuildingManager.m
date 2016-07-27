//
//  ELNThirdPartyAppsRouteBuildingManager.m
//  Broute
//
//  Created by Георгий Касапиди on 26.07.16.
//  Copyright © 2016 ELN. All rights reserved.
//

#import "ELNThirdPartyAppsRouteBuildingManager.h"

@interface ELNThirdPartyAppsRouteBuildingManager ()

@property (strong, nonatomic) NSMutableDictionary<NSString *, id<ELNRouteBuilderBase>> *routeBuilders;

@end

@implementation ELNThirdPartyAppsRouteBuildingManager

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.routeBuilders = [NSMutableDictionary dictionary];
    }
    
    return self;
}

- (void)registerRouteBuilder:(id<ELNRouteBuilderBase>)routeBuilder appNameLocKey:(NSString *)appNameLocKey {
    NSParameterAssert(routeBuilder != nil);
    
    [self.routeBuilders setObject:routeBuilder forKey:appNameLocKey];
}

- (NSArray<ELNThirdPartyAppRouteBuildingModel *> *)routeBuildingModelsForCoordinate:(CLLocationCoordinate2D)coordinate {
    NSMutableArray *result = [NSMutableArray array];
    
    [self.routeBuilders enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, id<ELNRouteBuilderBase>  _Nonnull obj, BOOL * _Nonnull stop) {
        ELNThirdPartyAppRouteBuildingModel *routeBuildingModel = [ELNThirdPartyAppRouteBuildingModel modelWithBuildingURL:[obj urlForCoordinate:coordinate] appName:NSLocalizedString(key, nil) appStoreID:[obj respondsToSelector:@selector(appStoreID)] ? [obj appStoreID] : nil];
        
        [result addObject:routeBuildingModel];
    }];
    
    return [result copy];
}

@end
