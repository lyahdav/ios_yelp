#import "SwitchCell.h"

@interface SwitchCell ()

@end

@implementation SwitchCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)switchValueChanged:(id)sender {
    self.switchValueChangedBlock(self.onOffSwitch.on);
}

@end
