//
//  GQContactViewController.m
//  GQweixin
//
//  Created by Li Guoqing on 2021/2/5.
//

#import "GQContactViewController.h"
#import "GQContact.h"
#import "GQContactGroup.h"
#import "GQContactManage.h"
#import "GQContactHeaderView.h"
#import "GQContactTableViewCell.h"

@interface GQContactViewController ()

@property (nonatomic, strong) NSMutableArray *functionSection;
@property (nonatomic, strong) NSMutableArray *contactsData;
@property (nonatomic, strong) NSMutableArray *contactsIndex;

@property (nonatomic, strong) NSMutableArray *sectionData;
@property (nonatomic, strong) NSMutableArray *sectionIndex;
@property (nonatomic, strong) UILabel *fotterLabel;

@end

@implementation GQContactViewController

- (void)loadView {
    [super loadView];
    
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.sectionData = [NSMutableArray new];
    self.sectionIndex = [NSMutableArray new];
    
    self.functionSection = [NSMutableArray new];
    GQContact *newFriend = [GQContact initWithName:@"新的朋友" wxid:@"func_newFriend" image:@"newFriendFunction"];
    GQContact *groupChat = [GQContact initWithName:@"群聊" wxid:@"func_groupChat" image:@"groupChatFunction"];
    GQContact *friendTag = [GQContact initWithName:@"标签" wxid:@"func_friendTag" image:@"friendTagFunction"];
    GQContact *publicAccount = [GQContact initWithName:@"公众号" wxid:@"func_publicAccount" image:@"publicAccountFunction"];
    [self.functionSection addObject:newFriend];
    [self.functionSection addObject:groupChat];
    [self.functionSection addObject:friendTag];
    [self.functionSection addObject:publicAccount];
    
    [self.sectionData addObject:self.functionSection];
    [self.sectionIndex addObject:@""];
    
    //GQContactManage *contactMange = [GQContactManage contactManage];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return self.sectionIndex.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return [self.sectionData[section] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellID = @"GQContact";
    GQContactTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(!cell){
        cell = [[GQContactTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    NSUInteger section = indexPath.section;
    NSUInteger row = indexPath.row;
    GQContact *contact = self.contactsData[section][row];
    
    cell.contactModel = contact;
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [self.sectionIndex objectAtIndex:section];
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
