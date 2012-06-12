import XMonad

import XMonad
import XMonad.Config.Gnome
import XMonad.Hooks.ManageDocks
import XMonad.Layout
import XMonad.Layout.Column
import XMonad.Layout.LayoutBuilder
import XMonad.Util.EZConfig
import XMonad.Util.Run(spawnPipe)

myLayout = augie2 ||| augie1 ||| Full
  where augie2 = ((layoutN 2 (relBox 0 0 1 0.75) (Just $ relBox 0 0 1 1) $ (Tall 1 0.03 0.75))
                 $ (layoutAll (relBox 0 0.75 1 1) $ (Mirror (Column 1))))
        augie1 = ((layoutN 1 (relBox 0 0 1 0.75) (Just $ relBox 0 0 1 1) $ (Tall 1 0.03 0.75))
                 $ (layoutAll (relBox 0 0.75 1 1) $ (Mirror (Column 1))))


myDmenuTitleBar =
    "exec `dmenu_path | dmenu\
        \ -p 'Run:'`"

main :: IO ()
main = do
     xmonad $ gnomeConfig
       { --terminal = "urxvt -sr -bg Black -fg White"
         terminal = "gnome-terminal"
       , modMask = mod4Mask
       , layoutHook = avoidStruts myLayout
       } `additionalKeys` [
         ((mod4Mask, xK_a), spawn "gnome-screensaver-command --lock")
       , ((mod4Mask, xK_p), spawn myDmenuTitleBar)
         ]
