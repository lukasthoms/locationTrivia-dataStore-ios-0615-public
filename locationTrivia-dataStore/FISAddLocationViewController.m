//
//  FISAddLocationViewController.m
//  locationTrivia-dataStore
//
//  Created by Lukas Thoms on 6/18/15.
//  Copyright (c) 2015 Joe Burgess. All rights reserved.
//

#import "FISAddLocationViewController.h"
#import "FISLocationsDataManager.h"
#import "FISLocation.h"

@interface FISAddLocationViewController ()
@property (weak, nonatomic) IBOutlet UITextField *locationNameField;
@property (weak, nonatomic) IBOutlet UITextField *locationLattitudeField;
@property (weak, nonatomic) IBOutlet UITextField *locationLongitudeField;
@property (strong, nonatomic) FISLocationsDataManager *locationsDataManager;

- (IBAction)saveButtonTapped:(id)sender;

@end

@implementation FISAddLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.locationsDataManager = [FISLocationsDataManager sharedLocationsDataManager];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saveButtonTapped:(id)sender {
    FISLocation *newLocation = [[FISLocation alloc]
                                initWithName:self.locationNameField.text
                                latitude:@([self.locationLattitudeField.text floatValue])
                                longitude:@([self.locationLongitudeField.text floatValue])];
    [self.locationsDataManager.locations addObject:newLocation];
    [self.navigationController popViewControllerAnimated:YES];
                                
}
@end
