//
//  GQContactViewController.m
//  GQweixin
//
//  Created by Li Guoqing on 2021/2/5.
//
//  “联系人”页面的视图控制器

#import "GQContactViewController.h"
#import "GQContact.h"
#import "GQContactGroup.h"
#import "GQContactManage.h"
#import "GQContactHeaderView.h"
#import "GQContactTableViewCell.h"
#import "GQContactDetailViewController.h"
#import "Masonry.h"

@interface GQContactViewController ()

//功能区
@property (nonatomic, strong) NSMutableArray *functionSection;
//联系人数据
@property (nonatomic, strong) NSMutableArray *contactsData;
//联系人索引
@property (nonatomic, strong) NSMutableArray *contactsIndex;

//section数据
@property (nonatomic, strong) NSMutableArray *sectionData;
//section索引
@property (nonatomic, strong) NSMutableArray *sectionIndex;
//尾标题
@property (nonatomic, strong) UILabel *fotterLabel;

@end

@implementation GQContactViewController

- (void)loadView {
    [super loadView];
    //self.fotterLabel = [UILabel new];
    [self.tableView setTableFooterView:self.fotterLabel];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    //行高及颜色
    self.tableView.rowHeight = [GQContactTableViewCell viewCellHeight];
    self.tableView.sectionIndexColor = [UIColor lightGrayColor];
    self.tableView.sectionIndexBackgroundColor = [UIColor clearColor];
    
    //初始化数据和索引
    self.sectionData = [NSMutableArray new];
    self.sectionIndex = [NSMutableArray new];
    
    //声明功能区
    self.functionSection = [NSMutableArray new];
    GQContact *newFriend = [GQContact initWithName:@"新的朋友" wxid:@"func_newFriend" image:@"newFriendFunction"];
    GQContact *groupChat = [GQContact initWithName:@"群聊" wxid:@"func_groupChat" image:@"groupChatFunction"];
    GQContact *friendTag = [GQContact initWithName:@"标签" wxid:@"func_friendTag" image:@"friendTagFunction"];
    GQContact *publicAccount = [GQContact initWithName:@"公众号" wxid:@"func_publicAccount" image:@"publicAccountFunction"];
    [self.functionSection addObject:newFriend];
    [self.functionSection addObject:groupChat];
    [self.functionSection addObject:friendTag];
    [self.functionSection addObject:publicAccount];
    
    //将功能区数据及索引加入tableview
    [self.sectionData addObject:self.functionSection];
    [self.sectionIndex addObject:@"*"];
    
    //声明联系人部分
    GQContactManage *contactManage = [GQContactManage contactManage];
    NSArray *contactData = contactManage.contactsData;
    NSArray *contactIndex = contactManage.contactsIndex;
    for(GQContactGroup *contactGroup in contactData){ //获取并遍历联系人分组
        NSInteger index = contactGroup.indexTag;
        NSMutableArray *curGroupData = [[NSMutableArray alloc] initWithCapacity:contactGroup.membersCount];
        for(GQContact *contact in contactGroup.groupMembers){ //遍历组内联系人
            [curGroupData addObject:contact];
        }
        //将联系人数据及索引加入tableview
        [self.sectionData addObject:curGroupData];
        [self.sectionIndex addObject:[NSString stringWithFormat:@"%@",contactGroup.groupName]];
    }
    
    //设置尾注文字
    [self.fotterLabel setText:[NSString stringWithFormat:@"%ld%@",(long)contactManage.contactsCount, @"位联系人"]];
    //刷新tableview
    [self.tableView reloadData];
}

#pragma mark - Table view data source

//获取tableview的section数目
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return self.sectionIndex.count;
}

//获取每个section的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return [self.sectionData[section] count];
}

//
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return self.sectionIndex;
}

//设置tableviewcell的显示方法
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellID = @"GQContact";
    GQContactTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(!cell){
        cell = [[GQContactTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    NSUInteger section = indexPath.section;
    NSUInteger row = indexPath.row;
    GQContact *contact = self.sectionData[section][row];
    
    //cell.contactModel = contact;
    [cell setContactModel:contact];
    return cell;
}

/*
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [self.sectionIndex objectAtIndex:section];
}
*/
//自定义section的header显示
- (UIView *)tableView:(UITableView *)_tableView viewForHeaderInSection:(NSInteger)section{
    GQContactHeaderView *headerView = [GQContactHeaderView new];
    NSString *headerTitle = self.sectionIndex[section];
    [headerView setViewTitle:headerTitle];
    return headerView;
}
//获取header高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return [GQContactHeaderView viewHeaderHeight];
}

//尾注
- (UILabel *)fotterLabel{
    if(_fotterLabel == nil){
        CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
        _fotterLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 50.0f)];
        [_fotterLabel setTextAlignment:NSTextAlignmentCenter];
        [_fotterLabel setFont:[UIFont systemFontOfSize:17.0f]];
        [_fotterLabel setTextColor:[UIColor grayColor]];
    }
    return _fotterLabel;
}

//点击事件：当点击功能cell时，跳转至对应的功能页面（暂未实现）；当点击联系人cell时，跳转到该联系人的“详细信息”页面
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSUInteger section = indexPath.section;
    NSUInteger row = indexPath.row;
    //点击联系人跳转
    if(section > 0){
        GQContact *selectedContact = self.sectionData[section][row];
        GQContactDetailViewController *contactDetailVC = [[GQContactDetailViewController alloc] initWithUserModel:selectedContact];
        [self.navigationController pushViewController:contactDetailVC animated:NO];
    }
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
