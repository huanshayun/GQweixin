//
//  GQContactDetailViewController.m
//  GQweixin
//
//  Created by Li Guoqing on 2021/2/25.
//
//  “联系人详细信息”页面的视图控制器

#import "GQContactDetailViewController.h"
#import "GQContactManage.h"
#import "Masonry.h"

#import "GQContactDetailBaseInfoCell.h"
#import "GQContactDetailTagsCell.h"
#import "GQContactDetailNormalTitleCell.h"
#import "GQContactDetailPhoneNumberCell.h"
#import "GQContactDetailAlbumCell.h"
#import "GQContactDetailButtonCell.h"

@interface GQContactDetailViewController ()

//联系人微信id
@property (nonatomic, strong) NSString *userID;
//联系人数据模型
@property (nonatomic, strong) GQContact *contactModel;
//页面数据模型
@property (nonatomic, strong) NSMutableArray *sectionData;

@end

@implementation GQContactDetailViewController

//使用联系人id初始化
- (instancetype)initWithUserID:(NSString *)userID{
    if(self = [super init]){
        _userID = userID;
    }
    return self;
}

//使用联系人数据模型初始化
- (instancetype)initWithUserModel:(GQContact *)contactModel{
    if(self = [super init]){
        _userID = contactModel.userID;
        _contactModel = contactModel;
    }
    return self;
}

- (void)loadView{
    [super loadView];
    [self setTitle:@"详细信息"];
    [self.tableView setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:0.95]];
    //[self.tableView setBackgroundColor:[UIColor colorWithRed:(239/255) green:(239/255) blue:(244/255) alpha:1]];
    /*
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view).with.insets(UIEdgeInsetsMake(15, 0, 0, 0));
    }];
    */
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDataWithUserID:self.userID];  //加载联系人数据模型
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)loadDataWithUserID:(NSString *)userID{
    _contactModel = [[GQContactManage contactManage] getContactInfo:userID];
}

#pragma mark - Table view data source

//section数量（共有4个section）
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 4;
}

//每个section的item数目
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    if(section == 0){//基本信息，仅有1个item
        return 1;
    }
    else if(section == 1){//标签和权限section
        if(self.contactModel.userDetail.phoneNumber.length > 0){//联系人有“手机号码”信息
            return 3;
        }
        else{
            return 2;
        }
    }
    else if(section == 2){//相册
        return 2;
    }
    else{//聊天功能
        return 2;
    }
}

//设置tableviewcell的显示
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Configure the cell...
    NSUInteger section = indexPath.section;
    NSUInteger row = indexPath.row;
    
    //基本信息section
    if(section == 0){
        NSString *baseInfoCellID = @"baseInfo";
        GQContactDetailBaseInfoCell *baseInfoCell = [tableView dequeueReusableCellWithIdentifier:baseInfoCellID];
        if(!baseInfoCell){
            baseInfoCell = [[GQContactDetailBaseInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:baseInfoCellID];
        }
        [baseInfoCell setContactModel:_contactModel];
        return baseInfoCell;
    }
    //权限和标签section
    else if(section == 1){
        //备注和标签
        if(row == 0){
            //若此联系人有设置备注和标签信息，则显示这些标签
            if(self.contactModel.userDetail.tags.count > 0){
                NSString *tagsCellID = @"tags";
                GQContactDetailTagsCell *tagsCell = [tableView dequeueReusableCellWithIdentifier:tagsCellID];
                if(!tagsCell){
                    tagsCell = [[GQContactDetailTagsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tagsCellID];
                }
                [tagsCell setTitleText:@"标签" tags:self.contactModel.userDetail.tags];
                return tagsCell;
            }
            //否则仅显示“设置备注和标签”
            else{
                NSString *setTagCellID = @"normalTitle";
                GQContactDetailNormalTitleCell *setTagCell = [tableView dequeueReusableCellWithIdentifier:setTagCellID];
                if(!setTagCell){
                    setTagCell = [[GQContactDetailNormalTitleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:setTagCellID];
                }
                [setTagCell setTitleText:@"设置备注和标签"];
                return setTagCell;
            }
        }
        //显示”联系人权限“
        if(row == 1){
            NSString *permissionCellID = @"normalTitle";
            GQContactDetailNormalTitleCell *permissionCell = [tableView dequeueReusableCellWithIdentifier:permissionCellID];
            if(!permissionCell){
                permissionCell = [[GQContactDetailNormalTitleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:permissionCellID];
            }
            [permissionCell setTitleText:@"朋友权限"];
            return permissionCell;
        }
        //若联系人有”电话号码“信息，则显示
        if(row == 2){
            NSString *phoneCellID = @"phoneNumber";
            GQContactDetailPhoneNumberCell *phoneCell = [tableView dequeueReusableCellWithIdentifier:phoneCellID];
            if(!phoneCell){
                phoneCell = [[GQContactDetailPhoneNumberCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:phoneCellID];
            }
            [phoneCell setTitleText:@"电话号码" phoneNumber:self.contactModel.userDetail.phoneNumber];
            return phoneCell;
        }
    }
    //相册section
    else if(section == 2){
        //相册（朋友圈）
        if(row == 0){
            NSString *albumCellID = @"album";
            GQContactDetailAlbumCell *albumCell = [tableView dequeueReusableCellWithIdentifier:albumCellID];
            if(!albumCell){
                albumCell = [[GQContactDetailAlbumCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:albumCellID];
            }
            [albumCell setTitleText:@"朋友圈" album:self.contactModel.userDetail.albums];
            return albumCell;
        }
        //更多信息
        else{
            NSString *moreInfoCellID = @"normalTitle";
            GQContactDetailNormalTitleCell *moreInfoCell = [tableView dequeueReusableCellWithIdentifier:moreInfoCellID];
            if(!moreInfoCell){
                moreInfoCell = [[GQContactDetailNormalTitleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:moreInfoCellID];
            }
            [moreInfoCell setTitleText:@"更多信息"];
            return moreInfoCell;
        }
    }
    //功能section
    else{
        //“发消息”功能
        if(row == 0){
            NSString *chatButtonCellID = @"button";
            GQContactDetailButtonCell *chatButtonCell = [tableView dequeueReusableCellWithIdentifier:chatButtonCellID];
            if(!chatButtonCell){
                chatButtonCell = [[GQContactDetailButtonCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:chatButtonCellID];
            }
            [chatButtonCell setTitleText:@"发消息"];
            return chatButtonCell;
        }
        //“音视频通话”功能
        else{
            NSString *AVchatButtonCellID = @"button";
            GQContactDetailButtonCell *AVchatButtonCell = [tableView dequeueReusableCellWithIdentifier:AVchatButtonCellID];
            if(!AVchatButtonCell){
                AVchatButtonCell = [[GQContactDetailButtonCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:AVchatButtonCellID];
            }
            [AVchatButtonCell setTitleText:@"音视频通话"];
            return AVchatButtonCell;
        }
    }
    // Configure the cell
    return nil;
}

//设置各个section的cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSUInteger section = indexPath.section;
    NSUInteger row = indexPath.row;
    
    //基础信息
    if(section == 0){
        CGFloat cellHeight = [GQContactDetailBaseInfoCell viewCellHeight];
        return cellHeight;
    }
    //权限和标签
    else if(section == 1){
        CGFloat cellHeight = [GQContactDetailNormalTitleCell viewCellHeight];
        return cellHeight;
    }
    //相册
    else if(section == 2){
        if(row == 0){
            CGFloat cellHeight = [GQContactDetailAlbumCell viewCellHeight];
            return cellHeight;
        }
        else{
            CGFloat cellHeight = [GQContactDetailNormalTitleCell viewCellHeight];
            return cellHeight;
        }
    }
    //功能
    else{
        CGFloat cellHeight = [GQContactDetailButtonCell viewCellHeight];
        return cellHeight;
    }
    return 48.0f;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 15.0f;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *fotterView = [[UIView alloc] init];
    [fotterView setBackgroundColor:[UIColor clearColor]];
    return fotterView;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
