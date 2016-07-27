//
//  ELNThirdPartyAppsRouteBuildingManager.h
//  Broute
//
//  Created by Георгий Касапиди on 26.07.16.
//  Copyright © 2016 ELN. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ELNRouteBuilderBase.h"
#import "ELNThirdPartyAppRouteBuildingModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ELNThirdPartyAppsRouteBuildingManager : NSObject

- (void)registerRouteBuilder:(id<ELNRouteBuilderBase>)routeBuilder appNameLocKey:(NSString *)appNameLocKey;

- (NSArray<ELNThirdPartyAppRouteBuildingModel *> *)routeBuildingModelsForCoordinate:(CLLocationCoordinate2D)coordinate;

@end

NS_ASSUME_NONNULL_END
