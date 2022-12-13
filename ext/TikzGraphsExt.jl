module TikzGraphsExt

import CausalInference

CausalInference.EXTENSIONS_SUPPORTED ? (using TikzGraphs) : (using ..TikzGraphs)

function CausalInference.plot_pc_graph_tikz(g, node_labels::AbstractVector{<:AbstractString}=String[])
    objs = CausalInference.prepare_pc_graph(g, node_labels)
    TikzGraphs.plot(objs.plot_g, objs.node_labels, edge_styles=objs.edge_styles,
        node_style=objs.node_style, options=objs.options)
end

function CausalInference.plot_fci_graph_tikz(g, node_labels::AbstractVector{<:AbstractString}=String[])
    objs = CausalInference.prepare_fci_graph(g, node_labels)
    TikzGraphs.plot(objs.plot_g, objs.node_labels, edge_styles=objs.edge_styles,
        node_style=objs.node_style, options=objs.options)
end

# for backward compatibility, default to TikzGraphs when available
CausalInference.plot_pc_graph = CausalInference.plot_pc_graph_tikz
CausalInference.plot_fci_graph = CausalInference.plot_fci_graph_tikz
end # end of module