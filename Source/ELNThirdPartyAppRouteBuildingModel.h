//
//  ELNThirdPartyAppRouteBuildingModel.h
//  Broute
//
//  Created by Георгий Касапиди on 27.07.16.
//  Copyright © 2016 ELN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ELNThirdPartyAppRouteBuildingModel : NSObject

@property (strong, nonatomic, nonnull, readonly) NSURL *buildingURL;
@property (copy, nonatomic, nonnull, readonly) NSString *appName;
@property (copy, nonatomic, nullable, readonly) NSString *appStoreID;

+ (nonnull instancetype)modelWithBuildingURL:(nonnull NSURL *)buildingURL
                                     appName:(nonnull NSString *)appName
                                  appStoreID:(nullable NSString *)appStoreID;

- (nullable NSURL *)appStoreURL;
- (BOOL)canOpenBuildingURL;
- (void)openBuildingURL;

@end
