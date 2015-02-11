//
//  UICollectionViewController+r.m
//  CLSA
//
//  Created by Joseph Hilland on 1/9/15.
//  Copyright (c) 2015 Effect. All rights reserved.
//

#import "UICollectionViewControllerMe.h"
#import "Cell.h"
#import "ViewController.h"

@implementation UICollectionViewControllerMe {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.images = @[@"map-icon.png"];

}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.images.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MY_CELL" forIndexPath:indexPath];
    
    CGRect finalCellFrame = cell.frame;
    CGPoint translation = [collectionView.panGestureRecognizer translationInView:collectionView.superview];
    
    if (translation.x > 0) {
        cell.frame = CGRectMake(finalCellFrame.origin.x - 1000, 500.0f, 0, 0);
    }
    else {
        cell.frame = CGRectMake(finalCellFrame.origin.x + 1000, 500.0f, 0, 0);
    }
    
    [UIView animateWithDuration:0.5f animations:^(void) {
        cell.frame = finalCellFrame;
    }];
    
    UIImage *image = [[UIImage alloc] init];
    image = [UIImage imageNamed:[self.images objectAtIndex:indexPath.row]];
    cell.imageView.image = image;
    return cell;
    
}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.collectionView.collectionViewLayout invalidateLayout];
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    CGRect finalCellFrame = cell.frame;
    CGPoint translation = [collectionView.panGestureRecognizer translationInView:collectionView.superview];
    
    
    if (translation.x > 0) {
        cell.frame = CGRectMake(finalCellFrame.origin.x - 1000, - 500.0f, 0, 0);
    }
    else {
        cell.frame = CGRectMake(finalCellFrame.origin.x - 1000, -500.0f, 0, 0);
    }
    
    [UIView animateWithDuration:0.5f animations:^(void) {
        cell.frame = finalCellFrame;
    }];
    
    
}




@end
