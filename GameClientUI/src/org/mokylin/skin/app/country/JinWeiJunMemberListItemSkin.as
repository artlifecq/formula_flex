package org.mokylin.skin.app.country
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
	public class JinWeiJunMemberListItemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var familyName:feathers.controls.Label;

		public var fighting:feathers.controls.Label;

		public var itemBg:feathers.controls.UIAsset;

		public var level:feathers.controls.Label;

		public var onlineState:feathers.controls.Label;

		public var playerName:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function JinWeiJunMemberListItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 32;
			this.width = 650;
			this.elementsContent = [itemBg_i(),playerName_i(),familyName_i(),level_i(),fighting_i(),onlineState_i(),__JinWeiJunMemberListItemSkin_UIAsset1_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __JinWeiJunMemberListItemSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/crown/tubiao/jin_wei_jun.png";
			temp.x = 12;
			temp.y = 9;
			return temp;
		}

		private function familyName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			familyName = temp;
			temp.name = "familyName";
			temp.bold = false;
			temp.height = 22;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "寒门子弟";
			temp.textAlign = "center";
			temp.color = 0x6E3117;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 100;
			temp.x = 206;
			temp.y = 6;
			return temp;
		}

		private function fighting_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			fighting = temp;
			temp.name = "fighting";
			temp.bold = false;
			temp.height = 22;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "235456";
			temp.textAlign = "center";
			temp.color = 0x6E3117;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 100;
			temp.x = 406;
			temp.y = 6;
			return temp;
		}

		private function itemBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			itemBg = temp;
			temp.name = "itemBg";
			temp.height = 32;
			temp.styleName = "ui/app/country/niupizhi/lieditiao_xiao.png";
			temp.width = 650;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function level_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			level = temp;
			temp.name = "level";
			temp.bold = false;
			temp.height = 20;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "110";
			temp.textAlign = "center";
			temp.color = 0x6E3117;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 60;
			temp.x = 336;
			temp.y = 6;
			return temp;
		}

		private function onlineState_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			onlineState = temp;
			temp.name = "onlineState";
			temp.bold = false;
			temp.height = 22;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "在线";
			temp.textAlign = "center";
			temp.color = 0x6E3117;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 100;
			temp.x = 533;
			temp.y = 6;
			return temp;
		}

		private function playerName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			playerName = temp;
			temp.name = "playerName";
			temp.bold = false;
			temp.height = 22;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "一哥";
			temp.textAlign = "center";
			temp.color = 0x6E3117;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 200;
			temp.x = 0;
			temp.y = 6;
			return temp;
		}

	}
}