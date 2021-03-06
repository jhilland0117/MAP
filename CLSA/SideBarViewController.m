//
//  UIViewController+SideBarViewController.m
//  CLSA
//
//  Created by Joseph Hilland on 1/9/15.
//  Copyright (c) 2015 Effect. All rights reserved.
//

#import "SideBarViewController.h"
#import "SWRevealViewController.h"
#import "ViewController.h"

@interface SideBarViewController() {
    NSInteger _presentedRow;
}
@end

@implementation SideBarViewController

@synthesize rearTableView = _rearTableView;

-(void) viewDidLoad {
    [super viewDidLoad];
    
    SWRevealViewController *parentRevealController = self.revealViewController;
    SWRevealViewController *grandParentRevealController = parentRevealController.revealViewController;
    
    UIBarButtonItem *revealButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"reveal-icon.png"] style:UIBarButtonItemStyleBordered target:grandParentRevealController action:@selector(revealToggle:)];
    
    /*
    if(grandParentRevealController) {
        NSInteger level = 0;
        UIViewController *controller = grandParentRevealController;
        while (nil != (controller = [controller revealViewController]) )
            level++;
        
        NSString *title = [NSString stringWithFormat:@"Detail Level %d", level];
        [self.navigationController.navigationBar addGestureRecognizer:grandParentRevealController.panGestureRecognizer];
        self.navigationItem.leftBarButtonItem = revealButtonItem;
        self.navigationItem.title = title;
    }
    else {*/
        self.navigationItem.title = @"Master";
    //}
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    SWRevealViewController *grandParentRevealController = self.revealViewController.revealViewController;
    grandParentRevealController.bounceBackOnOverdraw = NO;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    SWRevealViewController *grandParentRevealController = self.revealViewController.revealViewController;
    grandParentRevealController.bounceBackOnOverdraw = YES;
}

#pragma marl - UITableView Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    NSInteger row = indexPath.row;
    
    if (nil == cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    
    NSString *text = nil;
    if (row == 0)
    {
        text = @"Front View Controller";
    }
    else if (row == 1)
    {
        text = @"Map View Controller";
    }
    else if (row == 2)
    {
        text = @"Enter Presentation Mode";
    }
    else if (row == 3)
    {
        text = @"Resign Presentation Mode";
    }
    else if (row == 4)
    {
        text = @"A RevealViewController !!";
    }
    
    cell.textLabel.text = NSLocalizedString( text, nil );
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Grab a handle to the reveal controller, as if you'd do with a navigtion controller via self.navigationController.
    SWRevealViewController *revealController = self.revealViewController;
    
    // selecting row
    NSInteger row = indexPath.row;
    
    // if we are trying to push the same row or perform an operation that does not imply frontViewController replacement
    // we'll just set position and return
    /*
    if ( row == _presentedRow )
    {
        [revealController setFrontViewPosition:FrontViewPositionLeft animated:YES];
        return;
    }
    else if (row == 2)
    {
        [revealController setFrontViewPosition:FrontViewPositionRightMost animated:YES];
        return;
    }
    else if (row == 3)
    {
        [revealController setFrontViewPosition:FrontViewPositionRight animated:YES];
        return;
    }
    
    // otherwise we'll create a new frontViewController and push it with animation
    
    UIViewController *newFrontController = nil;
    
    if (row == 0)
    {
        FrontViewController *frontViewController = [[FrontViewController alloc] init];
        newFrontController = [[UINavigationController alloc] initWithRootViewController:frontViewController];
    }
    
    else if (row == 1)
    {
        MapViewController *mapViewController = [[MapViewController alloc] init];
        newFrontController = [[UINavigationController alloc] initWithRootViewController:mapViewController];
    }
    
    else if ( row == 4 )
    {
        FrontViewController *frontViewController = [[FrontViewController alloc] init];
        UINavigationController *frontNavigationController = [[UINavigationController alloc] initWithRootViewController:frontViewController];
        
        RearViewController *rearViewController = [[RearViewController alloc] init];
        UINavigationController *rearNavigationController = [[UINavigationController alloc] initWithRootViewController:rearViewController];
        
        SWRevealViewController *childRevealController = [[SWRevealViewController alloc]
                                                         initWithRearViewController:rearNavigationController frontViewController:frontNavigationController];
        
        childRevealController.rearViewRevealDisplacement = 0.0f;
        [childRevealController setFrontViewPosition:FrontViewPositionRight animated:NO];
        
        newFrontController = childRevealController;
    }
    
    [revealController pushFrontViewController:newFrontController animated:YES];
    
    _presentedRow = row;  // <- store the presented row
     */
}

@end
