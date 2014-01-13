//
//  ViewController.m
//  CameraTest
//
//  Created by 이 해용 on 2014. 1. 14..
//  Copyright (c) 2014년 iamdreamer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController


- (IBAction)takePicture:(id)sender {
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        //에러 처리
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"오류" message:@"카메라가 지원되지 않는 기종입니다." delegate:nil cancelButtonTitle:@"확인" otherButtonTitles:nil];
        [alert show];
    }
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
    imagePicker.delegate = self;
    imagePicker.allowsEditing = YES;
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentModalViewController:imagePicker animated:YES];
    
}


- (IBAction)getImage:(id)sender {
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
    
    imagePicker.delegate = self;
    
    imagePicker.allowsEditing = YES;
    
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentModalViewController:imagePicker animated:YES];
    
    
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    UIImage *editImage = [info objectForKey:UIImagePickerControllerEditedImage];
    
    UIImage *originalImage = [info objectForKey:UIImagePickerControllerEditedImage];
    
    UIImage *usingImage = (nil == editImage)?originalImage:editImage;
    
    self.imageView.image = usingImage;
    
    [picker dismissModalViewControllerAnimated:YES];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
