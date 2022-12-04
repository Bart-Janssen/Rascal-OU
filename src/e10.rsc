module e10

import IO;
import List;
import Map;
import Relation;
import Set;
import vis::Figure;
import vis::Render;
import vis::KeySym;

public void example10A()
{
	list[Figure] boxes = [];
	for (i <- [0..10])
	{
		boxes+=box(size(40), fillColor("red"));
	}
	render(hcat(boxes, gap(10), resizable(false)));
}

bool showBox = true;
Figure square = box(size(40), fillColor("red"), onMouseDown(bool (int butnr, map[KeyModifier,bool] modifiers)
	{
		showBox = false;
		return true;
	}
));
Figure circle = ellipse(size(40), fillColor("green"), onMouseDown(bool (int butnr, map[KeyModifier,bool] modifiers)
	{
		showBox = true;
		return true;
	}
));

public void example10B()
{
	render(hcat([computeFigure(Figure() {return showBox ? square : circle;})], gap(10), resizable(false)));
}

public void example10C()
{
	map[str, int] jabberSizes =
		("AboutBox.java":28, "Accessor":30, "BitmapItem":67,
		"DemoPresentation":50, "JabberPoint":37, "KeyController":44,
		"MenuController":109, "Presentation":107, "Slide":85,
		"SlideItem": 38, "SlideViewerComponent":62,
		"SlideViewerFrame":36, "Style.java":57, "TextItem.java":108,
		"XMLAccessor":112);
	render(treemap([box(text(f), area(l), fillColor(rgb(l,l%50,l/2))) | <f,l> <- toRel(jabberSizes)]));
}