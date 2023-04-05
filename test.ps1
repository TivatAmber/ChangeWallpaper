$imagePath=
$time=Get-Date -Format 'HH'
echo $time
# if ($time -le 7) {$imagePath=".\TranscodedWallpaper0"} elseif ($time -le 19) {$imagePath=".\TranscodedWallPaper1"} else {$imagePath=".\TranscodedWallpaper0"}
$dir=Get-location
$imagePath=-Join($dir,"\TranscodedWallpaper1.jpg")

$code = @'
using System.Runtime.InteropServices; 
namespace Win32{
    public class Wallpaper{ 
        [DllImport("user32.dll", CharSet=CharSet.Auto)] 
        static extern int SystemParametersInfo (int uAction , int uParam , string lpvParam , int fuWinIni) ; 
         
        public static void SetWallpaper(string thePath){ 
            SystemParametersInfo(20,0,thePath,3); 
        }
    }
}  
'@

add-type $code
[Win32.Wallpaper]::SetWallpaper($imagePath)
