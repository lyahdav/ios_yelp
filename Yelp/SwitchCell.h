#import <UIKit/UIKit.h>

typedef void (^switchValueChangedBlockType) (BOOL value);

@interface SwitchCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UISwitch *onOffSwitch;
@property (nonatomic, strong) switchValueChangedBlockType switchValueChangedBlock;

@end
