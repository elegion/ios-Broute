//
//  ELNThirdPartyAppRouteBuildingModel.m
//  Broute
//
//  Created by Георгий Касапиди on 27.07.16.
//  Copyright © 2016 ELN. All rights reserved.
//

#import <UIKit/UIApplication.h>

#import "ELNThirdPartyAppRouteBuildingModel.h"

@interface ELNThirdPartyAppRouteBuildingModel ()

@property (strong, nonatomic) NSURL *buildingURL;
@property (copy, nonatomic) NSString *appName;
@property (copy, nonatomic) NSString *appStoreID;

@end

@implementation ELNThirdPartyAppRouteBuildingModel

+ (instancetype)modelWithBuildingURL:(NSURL *)buildingURL appName:(NSString *)appName appStoreID:(NSString *)appStoreID {
    ELNThirdPartyAppRouteBuildingModel *model = [self new];
    
    model.buildingURL = buildingURL;
    model.appName = appName;
    model.appStoreID = appStoreID;
    
    return model;
}

- (nullable NSURL *)appStoreURL {
    return self.appStoreID.length > 0 ? [NSURL URLWithString:[NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/id%@", self.appStoreID]] : nil;
}

- (BOOL)canOpenBuildingURL {
    return [[UIApplication sharedApplication] canOpenURL:self.buildingURL];
}

- (void)openBuildingURL {
    [[UIApplication sharedApplication] openURL:self.buildingURL];
}

@end
