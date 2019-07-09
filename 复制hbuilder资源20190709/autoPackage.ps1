#未完成

#定义一些路径
$used_path="C:\Users\user\Desktop\$args[0]"
$android_path="C:\Users\user\Desktop\$args[1]"
$hbuilder_path="D:\APP模板及项目\APP项目\$args[2]"

$old_id="com.ouryoo.app.game"
$new_id="net.bzgame.app.jinxing"

#把xx.xx.xx.xx替换为xx\xx\xx\xx
$told_id=$old_id.Replace('.','\')
$tnew_id=$new_id.Replace('.','\')

#列举出要操作的文件
$id_files="$android_path\app\build.gradle",
          "$android_path\app\src\main\AndroidManifest.xml",
          "$android_path\app\src\main\assets\data\dcloud_control.xml",
          "$android_path\app\src\main\java\*\*\*\*\wxapi\WXEntryActivity.java",
          "$android_path\app\src\main\java\*\*\*\*\wxapi\WXPayEntryActivity.java"
$name_files="$android_path\app\build.gradle",
            "$android_path\app\src\mian\res\values\strings.xml"

#替换文件中的appid
foreach($file in $id_files)
{
    (Get-Content -Encoding "UTF8" $file) | ForEach-Object{ $_ -replace $args[0],$args[1] } | Set-Content $file -Encoding "UTF8"
     Write-Host -ForegroundColor Black $file"已经完成替换"
}

$wxpath="$android_path\app\src\main\java"
#替换微信登陆目录结构
if(Test-Path $wxpath)
{
    #mkdir "$wxpath\net\bzgame\app\star\"
    Rename-Item -Recurse "$wxpath\*\*\*\*\" "$wxpath\net\bzgame\app\jinxing\"
    Write-Host -ForegroundColor Green "新建成功"
}

    


