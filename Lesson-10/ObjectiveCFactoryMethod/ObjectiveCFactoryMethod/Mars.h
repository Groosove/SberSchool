//
//  Mars.h
//  ObjectiveCFactoryMethod
//
//  Created by Aleksandr Sychev on 03/07/2019.
//  Copyright © 2019 Aleksandr Sychev. All rights reserved.
//

#import "ProductProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface Mars : NSObject <ProductProtocol>

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

- (instancetype)initWithPrice:(NSUInteger)price NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
