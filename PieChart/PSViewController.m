//
//  PSViewController.m
//  PieChart
//
//  Created by Pavan Podila on 2/26/12.
//  Copyright (c) 2012 Pixel-in-Gene. All rights reserved.
//

#import "PSViewController.h"

@implementation PSViewController
@synthesize pieView;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}
- (IBAction)animatePieSlices:(id)sender {
	NSMutableArray *randomNumbers = [NSMutableArray array];
	int count = 1 + rand() % 10;
	for (int i = 0; i < count; i++) {
		[randomNumbers addObject:[NSNumber numberWithInt:rand() % 100]];
	}
	
	pieView.sliceValues = randomNumbers;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
	[self setPieView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

@end
