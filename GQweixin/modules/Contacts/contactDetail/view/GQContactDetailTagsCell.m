//
//  GQContactDetailTagsCell.m
//  GQweixin
//
//  Created by Li Guoqing on 2021/2/25.
//
//  显示联系人的标签和备注信息

#import "GQContactDetailTagsCell.h"
#import "Masonry.h"

@interface GQContactDetailTagsCell ()

//标题文字
@property (nonatomic, strong) UILabel *titleLabel;
//标签内容
@property (nonatomic, strong) UILabel *tagsLabel;
//标签内容（数组形式）
@property (nonatomic, strong) NSMutableArray *tags;
//右箭头标志
@property (nonatomic, strong) UIImageView *rightArrow;

@end

@implementation GQContactDetailTagsCell

//行高
+(CGFloat)viewCellHeight{
    return 48.0f;
}

//初始化
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self setBackgroundColor:[UIColor whiteColor]];
        [self initUI];
    }
    return self;
}

//视图初始化
-(void)initUI{
    //标题文字显示
    self.titleLabel = [UILabel new];
    [self.titleLabel setTextColor:[UIColor darkGrayColor]];
    [self.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(15);
        //make.width.mas_equalTo(80);
    }];
    
    self.rightArrow = [UIImageView new];
    [self.rightArrow setImage:[UIImage imageNamed:@"right_arrow"]];
    [self.contentView addSubview:self.rightArrow];
    [self.rightArrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(10, 15));
        make.right.mas_equalTo(-15);
    }];
    
    //标签内容显示
    self.tagsLabel = [UILabel new];
    [self.tagsLabel setTextColor:[UIColor grayColor]];
    [self.tagsLabel setFont:[UIFont systemFontOfSize:16]];
    [self.contentView addSubview:self.tagsLabel];
    [self.tagsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(self.titleLabel.mas_right).mas_offset(50);
        make.right.mas_lessThanOrEqualTo(-15);
    }];
}

//保存标题和标签信息
-(void)setTitleText:(NSString *)titleText tags:(NSArray *)tags{
    [self.titleLabel setText:titleText];
    NSInteger tagCount = tags.count;
    int index = 0;
    NSString *tagText = [NSString stringWithFormat:@"%@",[tags objectAtIndex:index]];//标签内容
    index++;
    while(index < tagCount){//当标签数量多于1个时
        tagText = [tagText stringByAppendingFormat:@", %@",[tags objectAtIndex:index]];
        index++;
    }
    [self.tagsLabel setText:tagText];
}
@end
