#import "ViewController.h"

@interface TileSelectionViewController : UITableViewController

typedef void (^TileSelectionCompletionBlock)(int selectedIndex);

@property (strong, nonatomic) NSArray *availableSources;
@property (copy, nonatomic) TileSelectionCompletionBlock complete;

@end
