//
//  ProductGenerator.m
//  ObjectiveCFactoryMethod
//
//  Created by Aleksandr Sychev on 03/07/2019.
//  Copyright © 2019 Aleksandr Sychev. All rights reserved.
//

#import "ProductGenerator.h"

#import "Snickers.h"
#import "Mars.h"

@implementation ProductGenerator

#pragma mark - <ProductGeneratorProtocol>

- (id<ProductProtocol>)create
{
	BOOL random = [self yesOrNo];
	if (random)
	{
		return [[Snickers alloc] initWithPrice:50u];
	}
	else
	{
		return [[Mars alloc] initWithPrice:49u];
	}

}

- (BOOL)yesOrNo
{
	uint32_t result = arc4random_uniform(100);
	return result % 2;
}

@end
