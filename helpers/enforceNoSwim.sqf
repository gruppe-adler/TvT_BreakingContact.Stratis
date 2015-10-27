_SwimAnims = ["aswmpercmwlksnonwnondf", "aswmpercmsprsnonwnondf", "aswmpercmrunsnonwnondf", "aswmpercmstpsnonwnondnon", "aswmpercmrunsnonwnondf_aswmpercmstpsnonwnondnon", "aswmpercmstpsnonwnondnon_aswmpercmrunsnonwnondf", "aswmpercmstpdnon", "aswmpercmstpdnon_aswmpercmstpdf", "aswmpercmstpdf_aswmpercmstpdnon", "aswmpercmstpsnonwnondf"];
if ((animationState player) in _SwimAnims) then {
	player switchmove "AmovPercMstpSnonWnonDnon";
};