import XMonad
import XMonad.Config.Kde
import qualified XMonad.StackSet as W -- to shift and float windows
import XMonad.Hooks.ManageHelpers
--import XMonad.Hooks.SetWMName
import XMonad.Layout.NoBorders
import XMonad.Layout.IM
import XMonad.Layout.PerWorkspace
import XMonad.Layout.Reflect
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.WindowProperties (getProp32s)
import Data.Ratio ((%))
import XMonad.Util.EZConfig -- for additional keybindings

kdeOverride :: Query Bool
kdeOverride = ask >>= \w -> liftX $ do
  override <- getAtom "_KDE_NET_WM_WINDOW_TYPE_OVERRIDE"
  wt <- getProp32s "_NET_WM_WINDOW_TYPE" w
  return $ maybe False (elem $ fromIntegral override) wt

main = xmonad $ ewmh kde4Config 
 { modMask = mod4Mask -- use the Windows button as mod
 , terminal = "urxvtc"
-- , startupHook = setWMName "LG3D" -- fool java
 , layoutHook = myLayoutHook
 , manageHook = ((className =? "krunner") >>= return . not --> manageHook kde4Config)
                <+> myManageHook
                <+> (kdeOverride --> doFloat)
 }`additionalKeys`
   [ ((mod4Mask .|. shiftMask, xK_l), spawn "slock") ]
 where
   myManageHook = composeAll . concat $
     [ [ isFullscreen --> doFullFloat ]--(doF W.focusDown <+> doFullFloat) ]
     , [ className   =? c --> doFloat           | c <- myFloats ]
     , [ className   =? c --> doF (W.shift "2") | c <- browser ]
     , [ className   =? c --> doF (W.shift "3") | c <- chat ]
     , [ className   =? c --> doF (W.shift "4") | c <- mail ]
     , [ className   =? c --> doF (W.shift "5") | c <- multimedia ]
     , [ className   =? c --> doF (W.shift "6") | c <- downloads ]
     , [ className   =? c --> doF (W.shift "7") | c <- games ]
     , [ className   =? c --> doF (W.shift "8") | c <- rdesktop ]
     , [ className   =? c --> doF (W.shift "9") | c <- vmcontrol ]
     , [ className   =? c --> doIgnore          | c <- myIgnores ]
     ]
   myIgnores     = ["desktop_window", "kdesktop"] -- just don't care about those ;)
   myFloats      = ["Plasma", "MPlayer", "mplayer2", "Wine", "Super Hexagon", "pen and Paper"] -- i'm floating
   browser       = ["OperaNext", "Chromium", "Firefox"] -- open on desktop 2
   chat          = ["Xchat", "Choqok"] -- open on desktop 3
   mail          = ["Claws-mail"] -- open on desktop 4
   multimedia    = ["MPlayer", "mplayer2", "Mcomix", "Deadbeef"
                   ,"Clementine", "Sonata", "Last.fm"]  -- open on desktop 5
   downloads     = ["Ktorrent"]
   games         = ["Steam"]
   rdesktop      = ["rdesktop"] -- open on desktop 8
   vmcontrol     = ["Virt-manager"]

   myLayoutHook = smartBorders . onWorkspace "Gimp" gimp $ layoutHook kde4Config
   gimp = withIM (0.11) (Role "gimp-toolbox") $
          reflectHoriz $
          withIM (0.15) (Role "gimp-dock") Full
