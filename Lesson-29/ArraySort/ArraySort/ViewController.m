//
//  ViewController.m
//  ArraySort
//
//  Created by Fenix Lavon on 7/5/21.
//  Copyright © 2021 Fenix Lavon. All rights reserved.
//

#import "ViewController.h"

@interface Array : NSObject
    @property (nonatomic, weak) id <ViewControllerDelegate> delegate;
    -(void) startSort;
@end

@implementation Array

-(void) startSort {
    NSArray * arr = @[
        @"Hello",
        @"My name is",
        @"Waaaa",
        @"Hoooo",
        @"Chika-chika",
        @"Slim Shady"
    ];
    
    [self.delegate sortArray:arr];
}

@end



@interface ViewController () <ViewControllerDelegate>

    @property (strong,nonatomic) Array* arr;
@end

@implementation ViewController
    
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.arr = [[Array alloc] init];
    self.arr.delegate = self;
    
    [self.arr startSort];
}


- (void)sortArray:(NSArray *)arr {
    NSArray *sortedArray = [arr sortedArrayUsingComparator: ^NSComparisonResult(id lhs, id rhs) {
        
        NSString *separatorCharacter = @"a";
        if ([[lhs componentsSeparatedByString:separatorCharacter] count] >[[rhs componentsSeparatedByString:separatorCharacter] count])
            return NSOrderedAscending;
        else if ([[lhs componentsSeparatedByString:separatorCharacter] count] < [[rhs componentsSeparatedByString:separatorCharacter] count])
            return  NSOrderedDescending;
        return NSOrderedSame;
    }];
    
    NSLog(@"%@", sortedArray);
}

@end

