package org.mokylin.skin.component.list
{
	import feathers.controls.StateSkin;
	import feathers.controls.ScrollContainer;
	import org.mokylin.skin.component.scrollbar.ScrollBarSkin_chat;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ListSkin2 extends feathers.controls.StateSkin
	{
		public var vBar:feathers.controls.ScrollContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ListSkin2()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [vBar_i()];
			
			states = {
			};
			skinNames={};
		}


		private function vBar_i():feathers.controls.ScrollContainer
		{
			var temp:feathers.controls.ScrollContainer = new feathers.controls.ScrollContainer();
			vBar = temp;
			temp.name = "vBar";
			temp.height = 193;
			temp.width=22;
			temp.styleClass = org.mokylin.skin.component.scrollbar.ScrollBarSkin_chat;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}