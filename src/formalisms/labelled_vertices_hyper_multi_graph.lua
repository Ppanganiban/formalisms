local Layer             = require "layeredata"
local hyper_multi_graph = require "formalisms.hyper_multi_graph"
local layer             = Layer.new {
  name = "labelled vertices & hyper & multi graph", 
}
local _                 = Layer.reference "LVHMGT"
local root              = Layer.reference "root"

-- Formalism of a Hyper and Multi Graph with labels on vertices
-- ============================================================
--
-- For more information of Hyper and Multi Graph formalism, see [here](./hyper_multi_graph.html)
--
-- We only add in this formalism labels on vertices.

layer.__depends__ = {
  hyper_multi_graph,
}

layer.__meta__ = {
  labelled_vertices_hyper_multi_graph_type = {
    __label__ = "LVHMGT",
    
    __refines__ = {
      root.__meta__.hyper_multi_graph_type,
    },
    
    __meta__ = { 
      label_vertex_type = {
        __refines__ = {
          root.__meta__.object_type.record_type,
        },
      },
      
      vertex_type = {
        __meta__ = {
          __tags__ = {
            labels = _.__meta__.label_vertex_type,
          },
        },
      },
    },
  },
}

return layer
