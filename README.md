# flutter_app


# 项目规划
- 记录学习的demo
- 尽量搭建一个完整的项目，各demo间可以路由跳转
- 保证demo代码质量

# 踩坑记录

1. hotreload
在模拟器中有可能无法热更新，解决方法
2. Waiting for another flutter command to release the startup lock...

```
rm ./flutter/bin/cache/lockfile
```
3. pod install 
```
Errno::EACCES - Permission denied @ dir_s_rmdir -
    /Users/jinxin/Library/Caches/CocoaPods/Pods
```
解决方法
```
sudo chown -R jinxin /Users/jinxin/Library/Caches/CocoaPods
```