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
	public class FamilyWarDungeonKillRankItemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var family:feathers.controls.Label;

		public var itemBg:feathers.controls.UIAsset;

		public var kill:feathers.controls.Label;

		public var name:feathers.controls.Label;

		public var rank:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FamilyWarDungeonKillRankItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 24;
			this.width = 376;
			this.elementsContent = [itemBg_i(),rank_i(),name_i(),family_i(),kill_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function family_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			family = temp;
			temp.name = "family";
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "名字最多七个字";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 125;
			temp.x = 183;
			temp.y = 0;
			return temp;
		}

		private function itemBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			itemBg = temp;
			temp.name = "itemBg";
			temp.height = 24;
			temp.styleName = "ui/common/liebiao/liebiaotiao.png";
			temp.width = 375;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function kill_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			kill = temp;
			temp.name = "kill";
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "1";
			temp.textAlign = "center";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 65;
			temp.x = 301;
			temp.y = 0;
			return temp;
		}

		private function name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			name = temp;
			temp.name = "name";
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "名字最多七个字";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 116;
			temp.x = 73;
			temp.y = 0;
			return temp;
		}

		private function rank_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			rank = temp;
			temp.name = "rank";
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "1";
			temp.textAlign = "center";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 58;
			temp.x = 11;
			temp.y = 0;
			return temp;
		}

	}
}