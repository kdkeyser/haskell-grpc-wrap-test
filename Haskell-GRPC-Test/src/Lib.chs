module Lib
    ( someFunc,
      callback,
      waitAndDestroy,
      wrap
    ) where

import Foreign.C.String
import Foreign.C.Types
import Foreign.Ptr

#include <simple_callback.h>

foreign import ccall "wrapper"
  wrap :: IO () -> IO (FunPtr (IO ()))

-- import the foreign function as normal
foreign import ccall "simple_callback.h callback"
  callback :: FunPtr (IO ()) -> IO ( Ptr () )

{#fun wait_and_destroy as ^ {`Ptr ()'} -> `()'#}

someFunc :: IO ()
someFunc = putStrLn "someFunc"
