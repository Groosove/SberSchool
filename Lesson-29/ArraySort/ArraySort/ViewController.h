//
//  ViewController.h
//  ArraySort
//
//  Created by Fenix Lavon on 7/5/21.
//  Copyright © 2021 Fenix Lavon. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ViewControllerDelegate <NSObject>

- (void)sortArray:(NSArray *)arr;

@end

@interface ViewController : UIViewController



@end

