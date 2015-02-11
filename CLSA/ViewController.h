//
//  ViewController.h
//  CLSA
//
//  Created by Joseph Hilland on 1/1/15.
//  Copyright (c) 2015 Effect. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
//@property (nonatomic) IBOutlet UIButton *sidebarButton;
@property (strong, nonatomic) IBOutlet UIImageView *theImageView;
@property (strong, nonatomic) UIImage *theImage;
@property (strong, nonatomic) NSString *latitudeCoordinate;
@property (strong, nonatomic) NSString *longitudeCoordinate;
@property (strong, nonatomic) NSString *nameCoordinate;
@property (strong, nonatomic) NSString *buildingNumber;
@property (nonatomic) BOOL coordinatesPassed;

@end

