//
//  TKSideDrawerTableView.h
//  TelerikUI
//
//  Copyright (c) 2015 Telerik. All rights reserved.
//

@class TKSideDrawerItem;
@class TKSideDrawerSection;
@class TKSideDrawer;

/**
 @discussion This class represents a table view that is used for the TKSideDrawer's content.
 */
@interface TKSideDrawerTableView : UIView <UITableViewDataSource, UITableViewDelegate>

/**
 The TKSideDrawer that displays the TKSideDrawerTableView.
 */
@property (nonatomic, weak) TKSideDrawer *sideDrawer;

/**
 TKSideDrawerTableView's table view.
 */
@property (nonatomic, strong, readonly) UITableView *tableView;

/**
 Initilizes the TKSideDrawerTableView with a TKSideDrawer instance.
 @param sideDrawer The TKSideDrawer that will contain this view.
 @return The new TKSideDrawerTableView instance.
 */
- (id)initWithSideDrawer:(TKSideDrawer *)sideDrawer;

@end

