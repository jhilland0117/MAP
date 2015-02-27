//
//  UIViewController+LocationViewController.m
//  CLSA
//
//  Created by Joseph Hilland on 1/1/15.
//  Copyright (c) 2015 Effect. All rights reserved.
//

#import "LocationViewController.h"

@interface LocationViewController()
@property (strong, nonatomic) NSMutableArray *names;
@property (strong, nonatomic) NSArray *lines;
@property (strong, nonatomic) NSMutableArray *nums;
@property (strong, nonatomic) NSMutableArray *lati;
@property (strong, nonatomic) NSMutableArray *longit;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation LocationViewController
//@synthesize filteredArray;
//@synthesize locationSearchBar;

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // only one section in tableview
    
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 100;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //NSLog(@"%lu", (unsigned long)[_names count]);
    return [_names count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:  (NSIndexPath *)indexPath
{
    // create cell
    //UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    
    // fill cell with name of building
    cell.textLabel.text = _names[indexPath.row];
    
    // fill cell detail with building num
    
    cell.detailTextLabel.text = _nums[indexPath.row];
    //cell.detailTextLabel.text = _longit[indexPath.row];
    //cell.detailTextLabel.text = _lati[indexPath.row];
    //cell.detailTextLabel.numberOfLines = 3;
    return cell;
    
}

-(CGFloat) tableView:(UITableView *)aTableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.0;
    
}

-(void) parseAbqBuildings {
    // open file and read data in as string to be parsed
    NSString *file = [[NSBundle mainBundle] pathForResource:@"abqbuildings" ofType:@"txt"];
    NSString *str = [NSString stringWithContentsOfFile:file encoding: NSUTF8StringEncoding error:NULL];
    
    // make sure there is data being read in
    if (str == NULL) {
        NSLog(@"There is no data in the file.\n");
    }
    
    // parse the data based off of "," character
    _lines = [str componentsSeparatedByString:@","];
    
    /* //this will be used if we have \n in file
    for (NSString *line in lines) {
        buildings = [line componentsSeparatedByString:@","];
        //bNumbers = [line componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@","]];

    }
    NSLog(@"%@", buildings); */
    //NSLog(@"%@", lines);
    
    // allocate space for these individ arrays
    _names = [[NSMutableArray alloc] init];
    _nums = [[NSMutableArray alloc] init];
    _longit = [[NSMutableArray alloc] init];
    _lati = [[NSMutableArray alloc] init];
    
    //NSUInteger *elements = [lines count]; // size is 1213
    //NSLog(@"%lu", elements);
    int j = 0, k = 0, l = 0, m = 0;
    for (int i = 0; i < 1210; i += 4) {
            _names[j++] = _lines[i];
            _nums[k++] = _lines[i + 1];
            _longit[l++] = _lines[i + 2];
            _lati[m++] = _lines[i + 3];
    }
    //NSLog(@"%@", names);
    //NSLog(@"%@", nums);
    //NSLog(@"%@", longit);
    //NSLog(@"%@", lati);

}

-(void) viewDidLoad {
    [super viewDidLoad];
    [self parseAbqBuildings];
    
    // initialize filteredArray for searches
    //self.filteredArray = [NSMutableArray arrayWithCapacity:[_lines count]];
    
}

-(void) didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // dispose of any resources that can be recreated
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([segue.identifier isEqualToString:@"coordinates"]) {
        
        // our problem is that the navigation controller allows us to segue back to list
        // do we want this functionality? is it going to affect performance?
        
        NSIndexPath *selectedRowIndex = [self.tableView indexPathForSelectedRow];
        ViewController *svc = [segue destinationViewController];
        svc.latitudeCoordinate = _lati[selectedRowIndex.row];
        svc.longitudeCoordinate = _longit[selectedRowIndex.row];
        svc.nameCoordinate = _names[selectedRowIndex.row];
        svc.buildingNumber = _nums[selectedRowIndex.row];
        svc.coordinatesPassed = TRUE;
        
    }
}

/*
#pragma mark Content Filtering
-(void)filterContentForSearchText:(NSString *)SearchText scope:(NSString *)scope {
    [self.filteredArray removeAllObjects];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF._names contains[c] %@", SearchText];
    filteredArray = [NSMutableArray arrayWithArray:[_lines filteredArrayUsingPredicate:predicate]];
}*/


@end
