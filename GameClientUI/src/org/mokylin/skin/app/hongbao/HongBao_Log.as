package org.mokylin.skin.app.hongbao
{
	import feathers.controls.List;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.list.ListSkin1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class HongBao_Log extends feathers.controls.StateSkin
	{
		public var ListItem:feathers.controls.List;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function HongBao_Log()
		{
			super();
			
			this.currentState = "normal";
			this.height = 473;
			this.width = 642;
			this.elementsContent = [ListItem_i()];
			
			states = {
			};
			skinNames={};
		}


		private function ListItem_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			ListItem = temp;
			temp.name = "ListItem";
			temp.height = 429;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 636;
			temp.x = 3;
			temp.y = 3;
			return temp;
		}

	}
}