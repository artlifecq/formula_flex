package starling.debug
{
	import flash.display.DisplayObjectContainer;
	import flash.events.MouseEvent;
	
	import away3d.debug.LogPanel;
	
	import starling.display.Mesh;

	public class StarlingLogPanel extends LogPanel
	{
		public function StarlingLogPanel(container:DisplayObjectContainer,autoShowOnError:Boolean = false)
		{
			super(container, autoShowOnError);
		}
		
		override protected function onPrintHeapInfoBtnClick(e:MouseEvent):void
		{
			CONFIG::Mesh2D_Trace
				{
					Mesh.reportMesh2dTraceMap();
				}

		}
	}
}