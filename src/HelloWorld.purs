module HelloWorld where

import Prelude
import React.DOM as D
import Control.Monad.Eff (Eff)
import DOM (DOM())
import DOM.HTML (window)
import DOM.HTML.Types (htmlDocumentToDocument)
import DOM.HTML.Window (document)
import DOM.Node.NonElementParentNode (getElementById)
import DOM.Node.Types (Element, ElementId(..), documentToNonElementParentNode)
import React (createClass, spec, createFactory, ReactClass, ReactElement, createClassStateless)
import Partial.Unsafe (unsafePartial)
import Data.Maybe (fromJust, Maybe(..))
import Data.Nullable (toMaybe)
import ReactDOM (render)

helloWorld :: ReactClass Unit
helloWorld = createClassStateless helloText
  where
    helloText :: Unit -> ReactElement
    helloText _ = D.h1 [] [D.text "hello world"]

helloMain :: forall eff. Eff (dom :: DOM | eff) Unit
helloMain = do
  elem <- app
  void $ render ui elem

ui :: ReactElement
ui = D.div' [ createFactory helloWorld unit ]

appId :: forall eff. Eff (dom :: DOM | eff) (Maybe Element)
appId = do
  win <- window
  doc <- document win
  getElementById (ElementId "app") (documentToNonElementParentNode (htmlDocumentToDocument doc))

app :: forall eff. Eff (dom :: DOM | eff) Element
app = do
  appId' <- appId
  pure $ unsafePartial fromJust appId'

