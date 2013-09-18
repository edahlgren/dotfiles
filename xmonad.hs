import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do
     xmonad $ defaultConfig {
     	    modMask = mod4Mask --alt to the window
	    } `additionalKeys` 
	    [ ((mod4Mask, xK_b), spawn "chromium-browser") ] 