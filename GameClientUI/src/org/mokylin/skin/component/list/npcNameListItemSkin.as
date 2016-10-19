package org.mokylin.skin.component.list
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class npcNameListItemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var itemSelectedSkin:feathers.controls.UIAsset;

		public var nameTxt:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function npcNameListItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 24;
			this.width = 178;
			this.elementsContent = [nameTxt_i(),itemSelectedSkin_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function itemSelectedSkin_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			itemSelectedSkin = temp;
			temp.name = "itemSelectedSkin";
			temp.height = 25;
			temp.width = 153;
			temp.x = 49;
			temp.y = -57;
			return temp;
		}

		private function nameTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			nameTxt = temp;
			temp.name = "nameTxt";
			temp.height = 23;
			temp.text = "npcnpcnpc";
			temp.color = 0xD4C996;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 171;
			temp.x = 3;
			temp.y = 71;
			return temp;
		}

	}
}