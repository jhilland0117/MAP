//
//  UICollectionViewController+r.h
//  CLSA
//
//  Created by Joseph Hilland on 1/9/15.
//  Copyright (c) 2015 Effect. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionViewControllerMe : UICollectionViewController <UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) NSArray *images;

@end
