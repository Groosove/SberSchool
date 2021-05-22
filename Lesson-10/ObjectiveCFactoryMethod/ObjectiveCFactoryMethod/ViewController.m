//
//  ViewController.m
//  ObjectiveCFactoryMethod
//
//  Created by Aleksandr Sychev on 03/07/2019.
//  Copyright © 2019 Aleksandr Sychev. All rights reserved.
//

#import "ViewController.h"

#import "ProductGenerator.h"
#import "ProductProtocol.h"

@interface ViewController ()

@property (nonatomic, strong) id<ProductGeneratorProtocol> generator;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];

	self.generator = [ProductGenerator new];
	for (NSUInteger i = 0u; i < 15u; ++i)
	{
		[[self.generator create] buy];
	}
}


@end
