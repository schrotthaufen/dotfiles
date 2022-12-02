import XMonad
import qualified XMonad.StackSet as W -- to shift and float windows
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Layout.NoBorders
import XMonad.Layout.IM
import XMonad.Layout.PerWorkspace
import XMonad.Layout.Reflect
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.WindowProperties (getProp32s)
import XMonad.Util.Run
import Data.Ratio ((%))
import Data.Monoid
import Control.Monad
import XMonad.Util.EZConfig -- for additional keybindings

main = xmonad $ ewmhFullscreen $ ewmh def
  { layoutHook = smartBorders $ layoutHook def
    , modMask = mod4Mask -- use the Windows button as mod
    , terminal = "alacritty"
    , startupHook = myStartupHook
    , manageHook = myManageHook
  } `additionalKeys`
    [ ((mod4Mask .|. shiftMask, xK_l), safeSpawn "i3lock" ["-c", "54626F"])
    , ((mod4Mask .|. shiftMask, xK_s), safeSpawnProg "pwsafe")
    , ((mod4Mask .|. shiftMask, xK_m), safeSpawnProg "claws-mail")
    , ((mod4Mask .|. shiftMask, xK_i), safeSpawn "alacritty"  ["-e", "weechat"])
    , ((mod4Mask .|. shiftMask, xK_g), safeSpawn "chromium" ["--incognito"])
    , ((mod4Mask .|. shiftMask, xK_b), safeSpawnProg "firefox")
    , ((mod4Mask, xK_p), safeSpawn "rofi" ["-show", "run"])
    , ((0, 0x1008ff13), safeSpawn "amixer" ["-D", "pulse", "sset", "Master", "3%+"])
    , ((0, 0x1008ff11), safeSpawn "amixer" ["-D", "pulse", "sset", "Master", "3%-"])
    , ((0, 0x1008ff12), safeSpawn "amixer" ["-D", "pulse", "set", "Master", "1+", "toggle"])
    ]
  where
    myManageHook = composeAll . concat $
      [ [ isFullscreen --> doFullFloat ]
      , [ className   =? c --> doFloat           | c <- myFloats ]
      , [ className   =? c --> doF (W.shift "2") | c <- browser ]
      , [ className   =? c --> doF (W.shift "3") | c <- chat ]
      , [ className   =? c --> doF (W.shift "4") | c <- mail ]
      , [ className   =? c --> doF (W.shift "5") | c <- multimedia ]
      , [ className   =? c --> doF (W.shift "6") | c <- downloads ]
      , [ className   =? c --> doF (W.shift "7") | c <- games ]
      , [ className   =? c --> doF (W.shift "8") | c <- rdesktop ]
      , [ className   =? c --> doF (W.shift "9") | c <- vmcontrol ]
      ]
    myFloats      = ["Wine", "Super Hexagon", "mpv", "TIS-100", "Tor Browser"] -- i'm floating
    browser       = ["Chromium", "chromium", "Firefox", "Tor Browser", "Google-chrome"] -- open on desktop 2
    chat          = ["Skype"] -- open on desktop 3
    mail          = ["Claws-mail"] -- open on desktop 4
    multimedia    = ["MComix", "mpv", "Clementine", "Sonata", "Spotify"]  -- open on desktop 5
    downloads     = ["Deluge", "Seafile Client"]
    games         = ["Steam", "Desura"]
    rdesktop      = ["rdesktop"] -- open on desktop 8
    vmcontrol     = ["Virt-manager"]

    myStartupHook = do
      setWMName "LG3D" -- fool java

    -- from http://funktionaali.com/posts/2014-07-01-How%20to%20get%20XMonad%20play%20well%20with%20fullscreen%20mpv.html
    -- | Remove borders from every mpv window as soon as possible in an event
    -- hook, because otherwise dimensions are messed and the fullscreen mpv is
    -- stretched by a couple pixels.
    --
    -- Basically the effect is the same as with
    -- "XMonad.Layout.NoBorders.lessBorders OnlyFloat", except that OnlyFloat
    -- messes up the dimensions when used together with fullscreenEventHook
    -- (e.g. NET_WM_STATE). Well at least in mplayer/mpv.
    --
    -- I have no idea how often/where the border is re-applied, but resetting
    -- it to 0 whenever possible just works :)
    removeBordersEventHook :: Event -> X All
    removeBordersEventHook ev = do
      whenX (className =? "mpv" `runQuery` w) $ withDisplay $ \d -> do
        cw <- io $ wa_border_width <$> getWindowAttributes d w
        unless (cw == 0) $ do
          io $ setWindowBorderWidth d w 0
          refresh
      return (All True)
      where
        w = ev_window ev
