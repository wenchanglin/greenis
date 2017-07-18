
#import "ShareSheetCell.h"

@implementation ShareSheetCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        leftView = [[UIImageView alloc]init];
        InfoLabel = [[UILabel alloc]init];
        InfoLabel.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:leftView];
        [self.contentView addSubview:InfoLabel];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    leftView.frame = CGRectMake(20, (self.frame.size.height-20)/2, 30, 30);
    InfoLabel.frame = CGRectMake(leftView.frame.size.width+leftView.frame.origin.x+15, (self.frame.size.height-20)/2, 140, 30);
}

-(void)setData:(ShareSheetModel *)dicdata{
    cellData = dicdata;
    if ([dicdata.icon isEqualToString:@""]) {
        leftView.image = nil;
    }
    else {
        leftView.image = [UIImage imageNamed:dicdata.icon];
    }
    
    InfoLabel.text = dicdata.title;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    if(selected){
        self.backgroundColor = RGBCOLOR(12, 102, 188);
        
        if ([cellData.icon_on isEqualToString:@""]) {
            leftView.image = nil;
        }
        else {
            leftView.image = [UIImage imageNamed:cellData.icon_on];
        }
        
        InfoLabel.textColor = [UIColor whiteColor];
    }else{
        self.backgroundColor = [UIColor whiteColor];
        
        if ([cellData.icon isEqualToString:@""]) {
            leftView.image = nil;
        }
        else {
            leftView.image = [UIImage imageNamed:cellData.icon];
        }
        
        InfoLabel.textColor = [UIColor blackColor];
    }
    // Configure the view for the selected state
}

@end

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com 