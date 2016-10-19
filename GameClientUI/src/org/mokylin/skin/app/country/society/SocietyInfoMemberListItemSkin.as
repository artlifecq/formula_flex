package org.mokylin.skin.app.country.society
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UIMovieClip;
	import org.mokylin.skin.app.country.bangpai.mc.UIMovieClipIcon_country_pos;
	import org.mokylin.skin.app.country.bangpai.mc.UIMovieClipIcon_society_pos;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class SocietyInfoMemberListItemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var combatCount:feathers.controls.Label;

		public var contributeCount:feathers.controls.Label;

		public var country_pos:feathers.controls.UIMovieClip;

		public var itemBg:feathers.controls.UIAsset;

		public var itemSelected:feathers.controls.UIAsset;

		public var level:feathers.controls.Label;

		public var memberName:feathers.controls.Label;

		public var officeName:feathers.controls.UIMovieClip;

		public var placeName:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function SocietyInfoMemberListItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 32;
			this.width = 606;
			this.elementsContent = [itemBg_i(),itemSelected_i(),placeName_i(),level_i(),combatCount_i(),contributeCount_i(),memberName_i(),country_pos_i(),officeName_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function combatCount_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			combatCount = temp;
			temp.name = "combatCount";
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
			temp.x = 235;
			temp.y = 7;
			return temp;
		}

		private function contributeCount_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			contributeCount = temp;
			temp.name = "contributeCount";
			temp.bold = false;
			temp.height = 22;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "1";
			temp.textAlign = "center";
			temp.color = 0x6E3117;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 100;
			temp.x = 322;
			temp.y = 7;
			return temp;
		}

		private function country_pos_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			country_pos = temp;
			temp.name = "country_pos";
			temp.height = 20;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.country.bangpai.mc.UIMovieClipIcon_country_pos);
			temp.width = 20;
			temp.x = 5;
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
			temp.width = 606;
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
			temp.width = 606;
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
			temp.height = 22;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "1";
			temp.textAlign = "center";
			temp.color = 0x6E3117;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 52;
			temp.x = 175;
			temp.y = 7;
			return temp;
		}

		private function memberName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			memberName = temp;
			temp.name = "memberName";
			temp.bold = false;
			temp.height = 22;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "一哥";
			temp.textAlign = "center";
			temp.color = 0x6E3117;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 160;
			temp.x = 10;
			temp.y = 7;
			return temp;
		}

		private function officeName_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			officeName = temp;
			temp.name = "officeName";
			temp.height = 23;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.country.bangpai.mc.UIMovieClipIcon_society_pos);
			temp.width = 85;
			temp.x = 518;
			temp.y = 4;
			return temp;
		}

		private function placeName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			placeName = temp;
			temp.name = "placeName";
			temp.bold = false;
			temp.height = 22;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "洛阳";
			temp.textAlign = "center";
			temp.color = 0x6E3117;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 110;
			temp.x = 420;
			temp.y = 7;
			return temp;
		}

	}
}