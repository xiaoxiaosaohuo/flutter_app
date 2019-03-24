# flutter_app

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



