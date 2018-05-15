//
//  LSWRankViewController.m
//  videoPlay
//
//  Created by 梁世伟 on 2018/4/9.
//  Copyright © 2018年 梁世伟. All rights reserved.
//

#import "LSWRankViewController.h"
#import "TZImagePickerController.h"
#import "AFNetworking.h"
#import "cbsNetWork.h"

@interface LSWRankViewController ()<TZImagePickerControllerDelegate>
@property (nonatomic, copy) NSString *videoUrl;

@end

@implementation LSWRankViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:NSLocalizedString(@"上传视频", nil) forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
}

- (void) click {
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:9 delegate:self];
    imagePickerVc.allowPickingVideo = YES;
    //不展示图片
    imagePickerVc.allowPickingImage = YES;
    //不显示原图选项
    imagePickerVc.allowPickingOriginalPhoto = NO;
    //按时间排序
    imagePickerVc.sortAscendingByModificationDate = YES;
    
    // You can get the photos by block, the same as by delegate.
    // 你可以通过block或者代理，来得到用户选择的照片.
    [imagePickerVc setDidFinishPickingVideoHandle:^(UIImage *coverImage,id asset){
        
        //iOS8以后返回PHAsset
        PHAsset *phAsset = asset;
        
        if (phAsset.mediaType == PHAssetMediaTypeVideo) {
            //从PHAsset获取相册中视频的url
            PHVideoRequestOptions *options = [[PHVideoRequestOptions alloc] init];
            options.version = PHImageRequestOptionsVersionCurrent;
            options.deliveryMode = PHVideoRequestOptionsDeliveryModeAutomatic;
            PHImageManager *manager = [PHImageManager defaultManager];
            [manager requestAVAssetForVideo:phAsset options:options resultHandler:^(AVAsset * _Nullable asset, AVAudioMix * _Nullable audioMix, NSDictionary * _Nullable info) {
                AVURLAsset *urlAsset = (AVURLAsset *)asset;
                
                NSURL *url = urlAsset.URL;
                self.videoUrl = url;
                NSLog(@"%@",url);
            }];
        }
    }];
    
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        [self uploadPhotoAndController:self WithSize:CGSizeZero Image:photos.firstObject AndFinish:^(NSDictionary * dic, NSError *error) {
        }];
    }];
    [self presentViewController:imagePickerVc animated:YES completion:nil];
    
}

-(void)uploadPhotoAndController:(UIViewController *)controller WithSize:(CGSize)size Image:(UIImage*)image AndFinish:(void (^)(NSDictionary *, NSError *))finish
{
    //1. 存放图片的服务器地址，这里我用的宏定义
    NSString * url = @"http://localhost:7100/tb/video/@upload";
    
    //2. 利用时间戳当做图片名字
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyyMMddHHmmss";
    NSString *imageName = [formatter stringFromDate:[NSDate date]];
    NSString *fileName = [NSString stringWithFormat:@"%@.jpg",imageName];
    
    //3. 图片二进制文件
    NSData *imageData = UIImageJPEGRepresentation(image, 0.7f);
    NSLog(@"upload image size: %ld k", (long)(imageData.length / 1024));
    
    //4. 发起网络请求
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
//    manager.responseSerializer = [AFJSONResponseSerializer serializer];
//    [manager POST:url parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//        // 上传图片，以文件流的格式，这里注意：name是指服务器端的文件夹名字
//        [formData appendPartWithFileData:imageData name:@"file" fileName:fileName mimeType:@"image/jpeg"];
//    } success:^(AFHTTPSessionManager *operation, id responseObject) {
//        //上传成功时的回调
//
//    } failure:^(AFHTTPSessionManager *operation, NSError *error) {
//        //失败时的回调
//
//    }];
//    [manager POST:url parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//        [formData appendPartWithFileData:imageData name:@"file" fileName:fileName mimeType:@"image/jpeg"];
//    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"成功");
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"失败");
//    }];
    NSDictionary *parameters = @{@"userId": @"1", @"title": @"1",@"introduce":@"asd"};
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//        [formData appendPartWithFileURL:[NSURL fileURLWithPath:@"file://path/to/image.jpg"] name:@"file" fileName:@"filename.jpg" mimeType:@"image/jpeg" error:nil];
        [formData appendPartWithFileData:imageData name:@"video" fileName:fileName mimeType:@"image/png"];
          [formData appendPartWithFileData:imageData name:@"image" fileName:fileName mimeType:@"image/png"];
    } error:nil];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    
    
    NSURLSessionUploadTask *uploadTask;
    
    
    
    uploadTask = [manager
                  uploadTaskWithStreamedRequest:request
                  progress:^(NSProgress * _Nonnull uploadProgress) {
                  }
                  completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                      if (error) {
                          NSLog(@"Error: %@", error);
                      } else {
                          NSLog(@"%@ %@", response, responseObject);
                      }
                  }];
    [uploadTask resume];
}




@end
