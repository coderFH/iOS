//
//  ViewController.m
//  NSURLSession
//
//  Created by wangfh on 2019/11/5.
//  Copyright © 2019 wangfh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <NSURLSessionDelegate>

@property(nonatomic, strong) NSMutableData *fileData;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)get {
    //1.确定URL
    NSURL *url = [NSURL URLWithString:@"http://localhost:1688/api/homecasual"];
    
    //2.创建请求对象
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    //3.创建回话对象
    NSURLSession *session = [NSURLSession sharedSession];
    
    //4.创建Task
    NSURLSessionTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        //6.解析数据
        NSLog(@"%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    }];
    
    //5.执行task
    [dataTask resume];
}

- (IBAction)get2 {
    //1.确定URL
    NSURL *url = [NSURL URLWithString:@"http://localhost:1688/api/homecasual"];

    //2.创建请求对象(这种方式request方式可以省略)
    //NSURLRequest *request =[NSURLRequest requestWithURL:url];

    //2.创建会话对象
    NSURLSession *session = [NSURLSession sharedSession];

    //3.创建Task
    //注意:dataTaskWithURL 内部会自动的将请求路径作为参数创建一个请求对象(GET)
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {

         //4.解析数据
         NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
    }];

    //5.执行Task
    [dataTask resume];
}

- (IBAction)post {
    //1.确定URL
    NSURL *url = [NSURL URLWithString:@"http://localhost:1688/api/login_code"];

    //2.创建请求对象
    NSMutableURLRequest *request =[NSMutableURLRequest requestWithURL:url];

    //2.1 设置请求方法为post
    request.HTTPMethod = @"POST";

    //2.2 设置请求体
    request.HTTPBody = [@"phone=13011111111&code=1112" dataUsingEncoding:NSUTF8StringEncoding];

    //3.创建会话对象
    NSURLSession *session = [NSURLSession sharedSession];

    //4.创建Task
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
     
        NSLog(@"%@",[NSThread currentThread]);
        //6.解析数据
        NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
    }];

    //5.执行Task
    [dataTask resume];
}

#pragma mark ----- NSURLSession相关代理方法 -----
- (NSMutableData *)fileData {
    if (!_fileData) {
        _fileData = [NSMutableData data];
    }
    return _fileData;
}

- (IBAction)NSURLSessionDelegateTest {
    //1.url
    NSURL *url = [NSURL URLWithString:@"http://localhost:1688/api/homecasual"];

    //2.创建请求对象
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    //3.创建会话对象,设置代理
    /*
    第一个参数:配置信息 [NSURLSessionConfiguration defaultSessionConfiguration]
    第二个参数:代理
    第三个参数:设置代理方法在哪个线程中调用
    */
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];

    //4.创建Task
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request];

    //5.执行Task
    [dataTask resume];
}

/**
 *  1.接收到服务器的响应 它默认会取消该请求
 *
 *  @param session           会话对象
 *  @param dataTask          请求任务
 *  @param response          响应头信息
 *  @param completionHandler 回调 传给系统
 */
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler {
    NSLog(@"%s",__func__);
    /*
     NSURLSessionResponseCancel = 0,取消 默认
     NSURLSessionResponseAllow = 1, 接收
     NSURLSessionResponseBecomeDownload = 2, 变成下载任务
     NSURLSessionResponseBecomeStream        变成流
     */
    completionHandler(NSURLSessionResponseAllow);
}
/**
 *  接收到服务器返回的数据 调用多次
 *
 *  @param session           会话对象
 *  @param dataTask          请求任务
 *  @param data              本次下载的数据
 */
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data {
     NSLog(@"%s",__func__);
    //拼接数据
    [self.fileData appendData:data];
}
/**
 *  请求结束或者是失败的时候调用
 *
 *  @param session           会话对象
 *  @param task          请求任务
 *  @param error             错误信息
 */
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
     NSLog(@"%s",__func__);
   
    //解析数据
    NSLog(@"%@",[[NSString alloc]initWithData:self.fileData encoding:NSUTF8StringEncoding]);
}

#pragma mark ----- NSURLSessionDownloadTask大文件下载（block）(无法监听进度) ------
//优点:不需要担心内存
//缺点:无法监听文件下载进度
- (IBAction)downLoad {
    //1.url
    NSURL *url = [NSURL URLWithString:@"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1438224463,3631948864&fm=26&gp=0.jpg"];
    
    //2.创建请求对象
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    //3.创建session
    NSURLSession *session = [NSURLSession sharedSession];
    
    //4.创建Task
    NSURLSessionDownloadTask *downLoadTask = [session downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //6.处理数据
        NSLog(@"%@---%@",location,[NSThread currentThread]);
        
        //6.1 拼接文件全路径
        NSString *fullPahth = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:response.suggestedFilename];
        
        //6.2 剪切文件
        [[NSFileManager defaultManager] moveItemAtURL:location toURL:[NSURL fileURLWithPath:fullPahth] error:nil];
    }];
    
    //5.执行Task
    [downLoadTask resume];
}

#pragma mark ----- NSURLSessionDownloadTask大文件下载（delegate) ------
- (IBAction)downLoadDelegate {
    //1.url
    NSURL *url = [NSURL URLWithString:@"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1438224463,3631948864&fm=26&gp=0.jpg"];
    
    //2.创建请求对象
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    //3.创建session
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    //4.创建Task
    NSURLSessionDownloadTask *downLoadTask = [session downloadTaskWithRequest:request];
    
    //5.执行Task
    [downLoadTask resume];
}


/// 写数据
/// @param session 会话对象
/// @param downloadTask 下载任务
/// @param bytesWritten 本次写入的数据大小
/// @param totalBytesWritten 下载的数据总大小
/// @param totalBytesExpectedToWrite 文件的总大小
- (void)URLSession:(NSURLSession *)session downloadTask:(nonnull NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
    NSLog(@"%f",1.0 * totalBytesWritten / totalBytesExpectedToWrite);
}


/// 当恢复下载的时候调用该方法
/// @param session 会话对象
/// @param downloadTask 下载任务
/// @param fileOffset 从什么地方下载
/// @param expectedTotalBytes 文件的总大小
- (void)URLSession:(NSURLSession *)session downloadTask:(nonnull NSURLSessionDownloadTask *)downloadTask didResumeAtOffset:(int64_t)fileOffset expectedTotalBytes:(int64_t)expectedTotalBytes {
    NSLog(@"%s",__func__);
}

- (void)URLSession:(NSURLSession *)session downloadTask:(nonnull NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(nonnull NSURL *)location {
    //6.1 拼接文件全路径
    NSString *fullPahth = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:downloadTask.response.suggestedFilename];
    
    //6.2 剪切文件
    [[NSFileManager defaultManager] moveItemAtURL:location toURL:[NSURL fileURLWithPath:fullPahth] error:nil];
    
    NSLog(@"%@",fullPahth);
}

//上边已经有了该方法
//- (void)URLSession:(NSURLSession *)session task:(nonnull NSURLSessionTask *)task didCompleteWithError:(nullable NSError *)error {
//
//}



@end
