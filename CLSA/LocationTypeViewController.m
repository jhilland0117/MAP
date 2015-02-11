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
        return cell0;
    }
   
    else if (indexPath.row == 1) {
        UITableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"cellOne"];
        cell1.textLabel.text = @"Libraries";
        return cell1;
    }
    
    else {
        UITableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:@"cellTwo"];
        cell2.textLabel.text = @"Places of Interest";
        return cell2;
    }
    
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    //cell.textLabel.text = @"Buildings";
    //return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        [self performSegueWithIdentifier:@"RowTouch" sender:self];
    }
    
    else if (indexPath.row == 1) {
        [self performSegueWithIdentifier:@"libraries" sender:self];
    }
    
    else {
        [self performSegueWithIdentifier:@"placesOfInterest" sender:self];
    }
    
    
}

/*
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([segue.identifier isEqualToString:@"buildings"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        
        LocationViewController *controller = segue.destinationViewController;
        
    }
    
    else if ([segue.identifier isEqualToString:@"libraries"]) {
        LibrariesViewController *controller = segue.destinationViewController;
        
    }
    
    else if ([segue.identifier isEqualToString:@"placesOfInterest"]) {
        PlacesOfInterestViewController *controller = segue.destinationViewController;
        
    }
    
}*/


@end
