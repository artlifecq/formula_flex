package feathers.controls
{
	import starling.display.DisplayObject;

	/**
	 * Group组件，匹配于编辑器的显示对象容器Group,支持布局管理器
	 *@author wewell
	 */	
	public class Group  extends LayoutGroup
	{
		public function Group()
		{
		}
		
		public function set elementsContent(elements:Array):void
		{
			var d:DisplayObject;
			for each(d in elements){
				this.addChild(d);
			}
		}
	}
}