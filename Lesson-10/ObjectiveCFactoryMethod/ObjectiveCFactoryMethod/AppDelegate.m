//
//  AppDelegate.m
//  ObjectiveCFactoryMethod
//
//  Created by Aleksandr Sychev on 03/07/2019.
//  Copyright © 2019 Aleksandr Sychev. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options API_AVAILABLE(ios(13.0)) {
	if (@available(iOS 13.0, *)) {
		return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
	} else {
		return nil;
	}
}


@end
