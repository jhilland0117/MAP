//
//  UIViewController+LocationTypeViewController.m
//  CLSA
//
//  Created by Joseph Hilland on 1/1/15.
//  Copyright (c) 2015 Effect. All rights reserved.
//

#import "LocationTypeViewController.h"
#import "LocationViewController.h"
#import "LibrariesViewController.h"
#import "PlacesOfInterestViewController.h"

@interface LocationTypeViewController()
//@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation LocationTypeViewController


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        UITableViewCell *cell0 = [tableView dequeueReusableCellWithIdentifier:@"cellZero"];
        cell0.textLabel.text = @"Buildings";
         //NSLog(@"%ld", (long)indexPath.row);
        return cell0;
    }
   
    else if (indexPath.row == 1) {
        UITableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"cellZero"];
        cell1.textLabel.text = @"Libraries";
         //NSLog(@"%ld", (long)indexPath.row);
        return cell1;
    }
    
    else {
        UITableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:@"cellZero"];
        cell2.textLabel.text = @"Places of Interest";
         //NSLog(@"%ld", (long)indexPath.row);
        return cell2;
    }
    
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    //cell.textLabel.text = @"Buildings";
    //return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
   // NSLog(@"Are we there at all?");
    
    if (indexPath.row == 0) {
        //NSLog(@"%ld", (long)indexPath.row);
        [self performSegueWithIdentifier:@"buildings" sender:self];
    }
    
    else if (indexPath.row == 1) {
        //NSLog(@"%ld", (long)indexPath.row);
        [self performSegueWithIdentifier:@"libraries" sender:self];
    }
    
    else {
        //NSLog(@"%ld", (long)indexPath.row);
        [self performSegueWithIdentifier:@"placesOfInterest" sender:self];
    }
    
    
}


@end
