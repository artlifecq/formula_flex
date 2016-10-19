package org.mokylin.skin.app.familyWar
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
	public class FamilyWarDungeonEndListItemRenderSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var familyName:feathers.controls.Label;

		public var itemBg:feathers.controls.UIAsset;

		public var itemSelected:feathers.controls.UIAsset;

		public var kill:feathers.controls.Label;

		public var lianxuKill:feathers.controls.Label;

		public var playerName:feathers.controls.Label;

		public var shuijin:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FamilyWarDungeonEndListItemRenderSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 32;
			this.width = 575;
			this.elementsContent = [itemBg_i(),itemSelected_i(),playerName_i(),familyName_i(),kill_i(),lianxuKill_i(),shuijin_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function familyName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			familyName = temp;
			temp.name = "familyName";
			temp.fontSize = 14;
			temp.text = "名字最多七个字";
			temp.textAlign = "center";
			temp.color = 0xEAA849;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 122;
			temp.x = 138;
			temp.y = 5;
			return temp;
		}

		private function itemBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			itemBg = temp;
			temp.name = "itemBg";
			temp.height = 32;
			temp.styleName = "ui/app/crown/lieditiao_xiao.png";
			temp.width = 575;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function itemSelected_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			itemSelected = temp;
			temp.name = "itemSelected";
			temp.height = 32;
			temp.styleName = "ui/common/liebiao/select.png";
			temp.width = 575;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function kill_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			kill = temp;
			temp.name = "kill";
			temp.fontSize = 14;
			temp.text = "00";
			temp.textAlign = "center";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 69;
			temp.x = 263;
			temp.y = 5;
			return temp;
		}

		private function lianxuKill_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lianxuKill = temp;
			temp.name = "lianxuKill";
			temp.fontSize = 14;
			temp.text = "00";
			temp.textAlign = "center";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 115;
			temp.x = 333;
			temp.y = 5;
			return temp;
		}

		private function playerName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			playerName = temp;
			temp.name = "playerName";
			temp.fontSize = 14;
			temp.text = "名字最多七个字";
			temp.textAlign = "center";
			temp.color = 0xDFC8AF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 122;
			temp.x = 13;
			temp.y = 5;
			return temp;
		}

		private function shuijin_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			shuijin = temp;
			temp.name = "shuijin";
			temp.fontSize = 14;
			temp.text = "00";
			temp.textAlign = "center";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 115;
			temp.x = 443;
			temp.y = 5;
			return temp;
		}

	}
}