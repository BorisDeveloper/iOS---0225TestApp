//
//  TimeLineViewController.m
//  0225TestApp
//
//  Created by Boris on 01.04.16.
//  Copyright © 2016 Drive App. All rights reserved.
//

#import "TimeLineViewController.h"
#import "SinglePostTableViewCell.h"

@interface TimeLineViewController () <UITableViewDelegate, UITableViewDataSource>

    @property (weak, nonatomic) IBOutlet UITableView *postsTableView;

@end

@implementation TimeLineViewController {
    
    NSArray * allPosts;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    allPosts = [self.userFeed objectForKey:@"data"];
    NSLog(@"allPosts >>> %@\n",allPosts);
    
}

-(void)viewDidAppear:(BOOL)animated {
    
    [self.postsTableView reloadData];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return allPosts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"SinglePostTableViewCell";
    
    SinglePostTableViewCell *cell = (SinglePostTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SinglePostCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }

    NSDictionary * singlePost = [allPosts objectAtIndex:indexPath.row];
    
    cell.story.text = [singlePost objectForKey: @"story"];
    cell.time.text  = [singlePost objectForKey: @"created_time"];
    cell.postID.text= [singlePost objectForKey: @"id"];
    
    return cell;
}

#pragma mark - UITableViewDelegate
#pragma mark -

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}



@end
