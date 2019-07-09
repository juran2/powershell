#操作路径
$packageDir='C:\Users\admin\Desktop'
$gameDir='D:\APP模板及项目\APP项目'

$optgame=''
$optpackage=''


#检验项目是否存在
$flag1=$false
$games=Get-ChildItem $gameDir
foreach($game in $games){
    if($game.Name -eq $args[0]){      
        $flag1=$true
        $optgame=$game
    }
}
if($flag1 -eq $false){
    Write-Host -ForegroundColor Red $args[0]':游戏没有找到!'
    return
}
else{
     Write-Host -ForegroundColor Green $optgame.Name':找到游戏'
}

#检验打包机是否存在
$flag2=$false
$packages=Get-ChildItem $packageDir
foreach($package in $packages){
    if(('.\'+$package.Name  -eq $args[1]) -or ($package.Name -eq $args[1])){      
        $flag2=$true
        $optpackage=$package
    }
}
if($flag2 -eq $false){
    Write-Host -ForegroundColor Red $args[1]':打包机没有找到!'
    return
}
else{
     Write-Host -ForegroundColor Green $optpackage.Name':找到打包机'
}

#确定包名
$appid=''
$v=Get-ChildItem $packageDir\$optpackage\app\src\main\assets\apps

foreach($a in $v){
   
    if(-not ($a.Name -eq '.DS_Store'))
    {
        $appid=$a
    }
}
Write-Host -ForegroundColor Green 'appid:'$appid
Write-Host -ForegroundColor Yellow '正在更新...'

#项目更新
Copy-Item -Recurse -Force $gameDir\$optgame\*  -Destination  $packageDir\$optpackage\app\src\main\assets\apps\$appid\www
Write-Host -ForegroundColor Green $optpackage.Name'更新成功!'
