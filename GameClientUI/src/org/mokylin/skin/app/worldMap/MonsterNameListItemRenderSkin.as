package org.mokylin.skin.app.worldMap
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
	public class MonsterNameListItemRenderSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var itemBg:feathers.controls.UIAsset;

		public var itemSelected:feathers.controls.UIAsset;

		public var levelTxt:feathers.controls.Label;

		public var nameTxt:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MonsterNameListItemRenderSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 26;
			this.width = 210;
			this.elementsContent = [itemBg_i(),nameTxt_i(),levelTxt_i(),itemSelected_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function itemBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			itemBg = temp;
			temp.name = "itemBg";
			temp.height = 26;
			temp.styleName = "ui/common/liebiao/lie_biao-_di.png";
			temp.width = 210;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function itemSelected_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			itemSelected = temp;
			temp.name = "itemSelected";
			temp.height = 26;
			temp.styleName = "ui/common/liebiao/select.png";
			temp.width = 210;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function levelTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			levelTxt = temp;
			temp.name = "levelTxt";
			temp.height = 24;
			temp.text = "（190级）";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 70;
			temp.x = 136;
			temp.y = 5;
			return temp;
		}

		private function nameTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			nameTxt = temp;
			temp.name = "nameTxt";
			temp.height = 24;
			temp.text = "我是怪物";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 130;
			temp.x = 6;
			temp.y = 5;
			return temp;
		}

	}
}