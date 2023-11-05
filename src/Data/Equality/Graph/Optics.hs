{-# OPTIONS_HADDOCK show-extensions #-}
{- | Hand-rolled lenses on e-graphs and e-classes which come in quite handy, are heavily used in
[Graph](https://hackage.haskell.org/package/hegg-0.4.0.0/docs/Data-Equality-Graph.html),
and are the only exported way of editing the structure of the e-graph. If you want to write some complex
@Analysis@ you'll probably need these. -}

module Data.Equality.Graph.Optics
  ( _class
  , _memo
  , _classes
  , _iclasses
  , _data
  , _parents
  , _nodes
  ) where

import Data.Set
  ( Set
  )

import Data.Equality.Graph
  ( EGraph
  )
import Data.Equality.Graph.Classes
  ( EClass
  )
import Data.Equality.Graph.Classes.Id
  ( ClassId
  )
import Data.Equality.Graph.Nodes
  ( NodeMap
  , ENode
  )
import Data.Equality.Utils.SizedList
  ( SList
  )
import Data.Equality.Graph.Lens qualified as L

import Optics.Lens
  ( Lens'
  , lensVL
  )
import Optics.Traversal
  ( Traversal
  , traversalVL
  )

{- | Lens for the e-class with the given id in an e-graph

Calls error when the e-class doesn't exist -}
_class ∷ ClassId → Lens' (EGraph a l) (EClass a l)
_class c = lensVL $ L._class c

{- | Lens for the memo of e-nodes in an e-graph, that is, a mapping from e-nodes to the e-class
they're represented in-}
_memo ∷ Lens' (EGraph a l) (NodeMap l ClassId)
_memo = lensVL L._memo

-- | Traversal for the existing classes in an e-graph
_classes ∷ Traversal (EGraph a l) (EGraph b l) (EClass a l) (EClass b l)
_classes = traversalVL L._classes

-- | Traversal for the existing classes in an e-graph
_iclasses ∷ Traversal (EGraph a l) (EGraph b l) (ClassId, EClass a l) (EClass b l)
_iclasses = traversalVL L._iclasses

-- | Lens for the @Domain@ of an e-class
_data ∷ Lens' (EClass b l) b
_data = lensVL L._data

-- | Lens for the parent e-classes of an e-class
_parents ∷ Lens' (EClass a l) (SList (ClassId, ENode l))
_parents = lensVL L._parents

-- | Lens for the e-nodes in an e-class
_nodes ∷ Lens' (EClass a l) (Set (ENode l))
_nodes = lensVL L._nodes
