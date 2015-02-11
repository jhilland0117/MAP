//
//  UIViewController+SideBarViewController.h
//  CLSA
//
//  Created by Joseph Hilland on 1/9/15.
//  Copyright (c) 2015 Effect. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SideBarViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, retain) IBOutlet UITableView *rearTableView;

@end
