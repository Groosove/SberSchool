//
//  ProductProtocol.h
//  ObjectiveCFactoryMethod
//
//  Created by Aleksandr Sychev on 03/07/2019.
//  Copyright © 2019 Aleksandr Sychev. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ProductProtocol <NSObject>

@property (nonatomic, assign, readonly) NSUInteger price;
@property (nonatomic, copy, readonly) NSString *name;

- (void)buy;

@end

NS_ASSUME_NONNULL_END
