package org.mokylin.skin.app.team.item
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
	public class TeamNearbyPlayerItemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var itemBg:feathers.controls.UIAsset;

		public var itemSelected:feathers.controls.UIAsset;

		public var labFihting:feathers.controls.Label;

		public var labJob:feathers.controls.Label;

		public var labPlayerLevel:feathers.controls.Label;

		public var labPlayerName:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TeamNearbyPlayerItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 28;
			this.width = 835;
			this.elementsContent = [itemBg_i(),itemSelected_i(),labPlayerName_i(),labPlayerLevel_i(),labJob_i(),labFihting_i()];
			
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
			temp.height = 28;
			temp.styleName = "ui/app/country/niupizhi/lieditiao_xiao.png";
			temp.width = 815;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function itemSelected_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			itemSelected = temp;
			temp.name = "itemSelected";
			temp.height = 28;
			temp.styleName = "ui/common/liebiao/select.png";
			temp.width = 815;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function labFihting_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labFihting = temp;
			temp.name = "labFihting";
			temp.bold = false;
			temp.fontSize = 14;
			temp.text = "99999999";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 189;
			temp.x = 627;
			temp.y = 6;
			return temp;
		}

		private function labJob_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labJob = temp;
			temp.name = "labJob";
			temp.bold = false;
			temp.fontSize = 14;
			temp.text = "战士";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 209;
			temp.x = 209;
			temp.y = 6;
			return temp;
		}

		private function labPlayerLevel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labPlayerLevel = temp;
			temp.name = "labPlayerLevel";
			temp.bold = false;
			temp.fontSize = 14;
			temp.text = "12";
			temp.textAlign = "center";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 209;
			temp.x = 418;
			temp.y = 6;
			return temp;
		}

		private function labPlayerName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labPlayerName = temp;
			temp.name = "labPlayerName";
			temp.bold = false;
			temp.fontSize = 14;
			temp.text = "玩家名称七个字";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.underline = true;
			temp.width = 209;
			temp.x = 0;
			temp.y = 5;
			return temp;
		}

	}
}