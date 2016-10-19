package org.mokylin.skin.app.country.society
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
	public class HasSocietyListItemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var itemBg:feathers.controls.UIAsset;

		public var leaderName:feathers.controls.Label;

		public var level:feathers.controls.Label;

		public var onlineCount:feathers.controls.Label;

		public var peopleCount:feathers.controls.Label;

		public var societyName:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function HasSocietyListItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 32;
			this.width = 862;
			this.elementsContent = [itemBg_i(),leaderName_i(),level_i(),onlineCount_i(),peopleCount_i(),societyName_i()];
			
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
			temp.height = 32;
			temp.styleName = "ui/app/country/niupizhi/lieditiao_xiao.png";
			temp.width = 862;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function leaderName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			leaderName = temp;
			temp.name = "leaderName";
			temp.bold = false;
			temp.height = 22;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "一哥";
			temp.textAlign = "center";
			temp.color = 0x6E3117;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 180;
			temp.x = 226;
			temp.y = 7;
			return temp;
		}

		private function level_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			level = temp;
			temp.name = "level";
			temp.bold = false;
			temp.height = 22;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "1";
			temp.textAlign = "center";
			temp.color = 0x6E3117;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 60;
			temp.x = 427;
			temp.y = 7;
			return temp;
		}

		private function onlineCount_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			onlineCount = temp;
			temp.name = "onlineCount";
			temp.bold = false;
			temp.height = 22;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "1";
			temp.textAlign = "center";
			temp.color = 0x6E3117;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 60;
			temp.x = 533;
			temp.y = 7;
			return temp;
		}

		private function peopleCount_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			peopleCount = temp;
			temp.name = "peopleCount";
			temp.bold = false;
			temp.height = 22;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "1";
			temp.textAlign = "center";
			temp.color = 0x6E3117;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 80;
			temp.x = 635;
			temp.y = 7;
			return temp;
		}

		private function societyName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			societyName = temp;
			temp.name = "societyName";
			temp.bold = false;
			temp.height = 22;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "第一个家族";
			temp.textAlign = "center";
			temp.color = 0x6E3117;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 180;
			temp.x = 23;
			temp.y = 7;
			return temp;
		}

	}
}