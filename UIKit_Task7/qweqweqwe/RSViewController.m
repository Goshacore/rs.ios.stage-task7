//
//  RSViewController.m
//  qweqweqwe
//
//  Created by Heorhi on 2021-07-03.
//

#import "RSViewController.h"
#import "UIColor+Hexadecimal.h"
#import "AlertController.h"

@interface RSViewController ()

@property (weak, nonatomic) IBOutlet UITextField *loginTF;

@property (weak, nonatomic) IBOutlet UITextField *passwodTF;

@property (weak, nonatomic) IBOutlet UIButton *authorize;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *numbersButton;


- (IBAction)numberButtonTapped:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *label;

@property (weak, nonatomic) IBOutlet UIView *viewOutlet;




@property (nonatomic, retain) NSMutableString * mutableString;

@end

@implementation RSViewController

   

- (IBAction)numberButtonTapped:(id)sender {
    
    
    [self.mutableString appendString : [NSString stringWithFormat: @"%ld",(long)[sender tag]]];
    self.label.text =   self.mutableString;
    
    if (self.mutableString.length == 1) {
        
        self.viewOutlet.layer.borderColor = [UIColor colorWithHexString:@"#FFFFFF"].CGColor;
        
        
        
        
        
    }
 if (self.mutableString.length == 3 && [self.mutableString isEqual:@"132"] ) {
        
        
        self.viewOutlet.layer.borderWidth = 2.0;
        self.viewOutlet.layer.cornerRadius = 10.0;
        self.viewOutlet.layer.borderColor = [UIColor colorWithHexString:@"#91C7B1"].CGColor;
      
     UIAlertController * alert = [UIAlertController alertControllerWithTitle : @"Welcome"
                                                                     message : @"You are successfuly authorized!"
                                                              preferredStyle :UIAlertControllerStyleAlert];

     UIAlertAction * ok = [UIAlertAction
                           actionWithTitle:@"Refresh"
                           style: UIAlertActionStyleDestructive
                           
                           handler:^(UIAlertAction * action)
                           {
         
         self.viewOutlet.hidden = YES;
         self.viewOutlet.layer.borderColor = [UIColor colorWithHexString:@"#FFFFFF"].CGColor;
         
         
         [self performSelector:@selector(timeFunction)
                    withObject:self
                    afterDelay:0];
         
         
         self.loginTF.layer.borderColor =  [UIColor colorWithHexString:@"#4C5C68"].CGColor;
         self.passwodTF.layer.borderColor =  [UIColor colorWithHexString:@"#4C5C68"].CGColor;
         
         self.loginTF.userInteractionEnabled = YES;
         self.loginTF.alpha = 1;
         self.loginTF.text = @"";
         self.passwodTF.text = @"";
         self.passwodTF.alpha = 1;
         self.authorize.alpha = 1;
         self.authorize.userInteractionEnabled = YES;
         self.passwodTF.userInteractionEnabled = YES;
         
         
         
         
     }];

     [alert addAction:ok];
     
     dispatch_async(dispatch_get_main_queue(), ^{
         [self presentViewController:alert animated:YES completion:nil];
     });
     
     
    }  if (self.mutableString.length == 3 && ![self.mutableString isEqual:@"132"] ) {
        
        
        self.viewOutlet.layer.borderWidth = 2.0;
        self.viewOutlet.layer.cornerRadius = 10.0;
        self.viewOutlet.layer.borderColor = [UIColor colorWithHexString:@"#C20114"].CGColor;
        
        [self performSelector:@selector(timeFunction)
                   withObject:self
                   afterDelay:0.1];
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];

    [self.view addGestureRecognizer:tap];
    
    
    
    [self.loginTF setDelegate:self];
    [self.passwodTF setDelegate:self];
    
    
    NSMutableAttributedString* attrStr = [[NSMutableAttributedString alloc]initWithString: @"_"];
    [attrStr addAttribute:NSKernAttributeName value:@(4.0) range:NSMakeRange(0, attrStr.length)];

    self.label.attributedText = attrStr;
    
    
    self.viewOutlet.hidden = true;
    
    self.mutableString = [[NSMutableString alloc]init];
    
    
    self.loginTF.layer.borderWidth = 1.5;
    self.loginTF.layer.cornerRadius = 5.0;
    self.loginTF.layer.borderColor =  [UIColor colorWithHexString:@"#4C5C68"].CGColor;
    self.loginTF.keyboardType = UIKeyboardTypeAlphabet;
    

    
    self.passwodTF.layer.borderWidth = 1.5;
    self.passwodTF.layer.cornerRadius = 5.0;
    self.passwodTF.layer.borderColor =  [UIColor colorWithHexString:@"#4C5C68"].CGColor;
    
    
    self.authorize.layer.borderWidth = 2.0;
    self.authorize.layer.cornerRadius = 10.0;
    [self.authorize setTitleColor:[UIColor colorWithHexString:@"#80A4ED"] forState:UIControlStateNormal];
    self.authorize.layer.borderColor =  [UIColor colorWithHexString:@"#80A4ED"].CGColor;
     
 
    
    for (UIButton * buton in self.numbersButton) {
        buton.layer.borderWidth = 2.0;
        buton.layer.cornerRadius = 25;
        buton.layer.borderColor =  [UIColor colorWithHexString:@"#80A4ED"].CGColor;
        [buton setTitleColor:[UIColor colorWithHexString:@"#80A4ED"] forState:UIControlStateNormal];
    }
    
    
    
    UIImage * image = [[UIImage imageNamed:@"user2x.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    UIImage * image2 = [[UIImage imageNamed:@"user-filled2x.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    
    
   
     [self.authorize setImage: image  forState:UIControlStateNormal ];
    
    [self.authorize setImage: image2 forState:UIControlStateHighlighted ];
    self.authorize.tintColor = [UIColor   colorWithHexString:@"#80A4ED"];
    
    
   [ self.authorize addTarget:self
                       action:@selector(buttonTapped:)
             forControlEvents:UIControlEventTouchUpInside];
    
   [ self.authorize addTarget:self
                        action:@selector(buttonTapped2:)
             forControlEvents:UIControlEventTouchDown ];
    
    
    
    for (UIButton * buton in self.numbersButton) {
       
        [ buton addTarget:self
                   action:@selector(buttonNumbers2:)
                  forControlEvents:UIControlEventTouchDown ];
        
        [ buton addTarget:self
                   action:@selector(buttonNumbers3:)
                  forControlEvents:UIControlEventTouchUpInside ];
        
    }
    
    [self.loginTF addTarget: self
                     action:@selector(textFieldDidChange:)
           forControlEvents:UIControlEventEditingChanged];
    
    
    [self.passwodTF addTarget: self
                     action:@selector(passwordDidChange:)
           forControlEvents:UIControlEventEditingChanged];
  
    
    
    
}


- (void) buttonTapped: (UIButton *) sender {
    
    if ([self.loginTF.text  isEqual: @"username"] && [self.passwodTF.text isEqual:@"password"]){
        self.loginTF.layer.borderColor =  [UIColor colorWithHexString:@"#91C7B1"].CGColor;
        self.passwodTF.layer.borderColor =  [UIColor colorWithHexString:@"#91C7B1"].CGColor;
        self.loginTF.userInteractionEnabled = NO;
        self.loginTF.alpha = 0.5;
        self.passwodTF.alpha = 0.5;
        self.authorize.alpha = 0.5;
        self.authorize.userInteractionEnabled = NO;
        self.passwodTF.userInteractionEnabled = NO;
        self.viewOutlet.hidden = NO;
        
        sender.backgroundColor = [UIColor   colorWithHexString:@"#FFFFFF"];
        sender.titleLabel.alpha = 1;
        sender.alpha = 0.5;
        
    } else  if (![self.loginTF.text  isEqual: @"username"] && [self.passwodTF.text isEqual:@"password"]){
            
        self.loginTF.layer.borderColor =  [UIColor colorWithHexString:@"#C20114"].CGColor;
       self.passwodTF.layer.borderColor =  [UIColor colorWithHexString:@"#91C7B1"].CGColor;
        sender.backgroundColor = [UIColor   colorWithHexString:@"#FFFFFF"];
       
        sender.titleLabel.alpha = 1;
       
        sender.alpha = 1;
        
        
        
    } else  if (![self.passwodTF.text isEqual:@"password"] && [self.loginTF.text  isEqual: @"username"]){
        self.passwodTF.layer.borderColor =  [UIColor colorWithHexString:@"#C20114"].CGColor;
       self.loginTF.layer.borderColor =  [UIColor colorWithHexString:@"#91C7B1"].CGColor;
        
        sender.backgroundColor = [UIColor   colorWithHexString:@"#FFFFFF"];
       
        sender.titleLabel.alpha = 1;
       
        sender.alpha = 1;
        
    } else {
        self.loginTF.layer.borderColor =  [UIColor colorWithHexString:@"#C20114"].CGColor;
        self.passwodTF.layer.borderColor =  [UIColor colorWithHexString:@"#C20114"].CGColor;
        
        sender.backgroundColor = [UIColor   colorWithHexString:@"#FFFFFF"];
       
        sender.titleLabel.alpha = 1;
       
        sender.alpha = 1;
        
        
        }
}


- (void) textFieldDidChange: (UITextField *) textfield {
    
    self.loginTF.layer.borderColor =  [UIColor colorWithHexString:@"#4C5C68"].CGColor;
    
}

- (void) passwordDidChange: (UITextField *) textfield {
    
    self.passwodTF.layer.borderColor =  [UIColor colorWithHexString:@"#4C5C68"].CGColor;
    
}



- (void) timeFunction {
    self.mutableString.string = @"";
    self.label.text = @"_";
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

    -(void)dismissKeyboard
    {
        [self.loginTF resignFirstResponder];
        [self.passwodTF resignFirstResponder];
        
    }
    
    
    - (void) buttonTapped2: (UIButton *) sender {
        sender.titleLabel.alpha = 0.4;
         sender.backgroundColor = [UIColor   colorWithHexString2:@"#80A4ED"] ;
        sender.imageView.alpha = 1;
    }


- (void) buttonNumbers2: (UIButton *) sender {
  
     sender.backgroundColor = [UIColor   colorWithHexString2:@"#80A4ED"] ;
    
 
   
    
}

- (void) buttonNumbers3: (UIButton *) sender {
  
     sender.backgroundColor = [UIColor   colorWithHexString2:@"#FFFFFF"] ;
 
}


- (BOOL) textField:(UITextField*)textField
         shouldChangeCharactersInRange:(NSRange)range
 replacementString:(NSString*)textEntered {
    if (textField == self.loginTF){
        NSCharacterSet * myCharSet = NSCharacterSet.letterCharacterSet;
    for (int i = 0; i < [textEntered length]; i++) {
        unichar c = [textEntered characterAtIndex:i];
        if (![myCharSet characterIsMember:c]) {
           return NO;
        }
    }}
    return YES;
    }

@end
