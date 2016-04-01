//
//  SinglePostTableViewCell.h
//  0225TestApp
//
//  Created by Boris on 01.04.16.
//  Copyright © 2016 Drive App. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SinglePostTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *story;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *postID;

@end
