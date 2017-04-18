module Main where

import Prelude (Unit, discard)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import DOM (DOM())
import HelloWorld (helloMain)

main :: forall e. Eff (console :: CONSOLE, dom :: DOM | e) Unit
main = do
  log "nova"
  helloMain
