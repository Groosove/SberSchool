//
//  Snickers.m
//  ObjectiveCFactoryMethod
//
//  Created by Aleksandr Sychev on 03/07/2019.
//  Copyright © 2019 Aleksandr Sychev. All rights reserved.
//

#import "Snickers.h"

@implementation Snickers

- (instancetype)initWithPrice:(NSUInteger)price
{
	self = [super init];
	if (self)
	{
		_price = price;
		_name = @"Snickers";
	}

	return self;
}


#pragma mark - <ProductProtocol>

@synthesize price = _price;
@synthesize name = _name;

- (void)buy
{
	NSLog(@"Buying Snickers");
}

@end
