package org.mokylin.skin.app.country
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Radio;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.country.GuoJiaTabItemSkin;
	import org.mokylin.skin.app.country.JinWeiJunTabItemSkin;
	import org.mokylin.skin.app.country.TianXiaTabItemSkin;
	import org.mokylin.skin.app.country.button.ButtonMain_tabbar_bangpai;
	import org.mokylin.skin.app.country.button.ButtonMain_tabbar_guojia;
	import org.mokylin.skin.app.country.button.ButtonMain_tabbar_jiazu;
	import org.mokylin.skin.app.country.button.ButtonMain_tabbar_jinweijun;
	import org.mokylin.skin.app.country.button.ButtonMain_tabbar_tianxia;
	import org.mokylin.skin.app.country.guild.GuildTabItemSkin;
	import org.mokylin.skin.app.country.society.SocietyTabItemSkin;
	import org.mokylin.skin.component.button.ButtonSkin_close_4;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class CountryPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bangPaiItem:feathers.controls.SkinnableContainer;

		public var btnClose:feathers.controls.Button;

		public var guildItem:feathers.controls.SkinnableContainer;

		public var guoJiaItem:feathers.controls.SkinnableContainer;

		public var jinWeiJunItem:feathers.controls.SkinnableContainer;

		public var mainGuildBtn:feathers.controls.Radio;

		public var mainGuoJiaBtn:feathers.controls.Radio;

		public var mainJinWeiJunBtn:feathers.controls.Radio;

		public var mainSocietyBtn:feathers.controls.Radio;

		public var mainTianXiaBtn:feathers.controls.Radio;

		public var tianXiaItem:feathers.controls.SkinnableContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function CountryPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__CountryPanelSkin_UIAsset1_i(),btnClose_i(),__CountryPanelSkin_Group1_i(),tianXiaItem_i(),guoJiaItem_i(),bangPaiItem_i(),jinWeiJunItem_i(),guildItem_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __CountryPanelSkin_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 25;
			temp.y = 216;
			temp.elementsContent = [mainTianXiaBtn_i(),mainGuoJiaBtn_i(),mainSocietyBtn_i(),mainGuildBtn_i(),mainJinWeiJunBtn_i()];
			return temp;
		}

		private function __CountryPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 716;
			temp.styleName = "ui/app/country/bg.png";
			temp.width = 1121;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bangPaiItem_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bangPaiItem = temp;
			temp.name = "bangPaiItem";
			var skin:StateSkin = new org.mokylin.skin.app.country.society.SocietyTabItemSkin()
			temp.skin = skin
			temp.x = 118;
			temp.y = 157;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.height = 35;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_close_4);
			temp.width = 35;
			temp.x = 1004;
			temp.y = 134;
			return temp;
		}

		private function guildItem_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			guildItem = temp;
			temp.name = "guildItem";
			var skin:StateSkin = new org.mokylin.skin.app.country.guild.GuildTabItemSkin()
			temp.skin = skin
			temp.x = 118;
			temp.y = 157;
			return temp;
		}

		private function guoJiaItem_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			guoJiaItem = temp;
			temp.name = "guoJiaItem";
			var skin:StateSkin = new org.mokylin.skin.app.country.GuoJiaTabItemSkin()
			temp.skin = skin
			temp.x = 118;
			temp.y = 157;
			return temp;
		}

		private function jinWeiJunItem_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			jinWeiJunItem = temp;
			temp.name = "jinWeiJunItem";
			var skin:StateSkin = new org.mokylin.skin.app.country.JinWeiJunTabItemSkin()
			temp.skin = skin
			temp.x = 118;
			temp.y = 157;
			return temp;
		}

		private function mainGuildBtn_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			mainGuildBtn = temp;
			temp.name = "mainGuildBtn";
			temp.groupName = "CountryPanelMainTabBarRadioGroup";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.country.button.ButtonMain_tabbar_bangpai);
			temp.x = 0;
			temp.y = 108;
			return temp;
		}

		private function mainGuoJiaBtn_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			mainGuoJiaBtn = temp;
			temp.name = "mainGuoJiaBtn";
			temp.groupName = "CountryPanelMainTabBarRadioGroup";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.country.button.ButtonMain_tabbar_guojia);
			temp.x = 0;
			temp.y = 52;
			return temp;
		}

		private function mainJinWeiJunBtn_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			mainJinWeiJunBtn = temp;
			temp.name = "mainJinWeiJunBtn";
			temp.groupName = "CountryPanelMainTabBarRadioGroup";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.country.button.ButtonMain_tabbar_jinweijun);
			temp.x = 0;
			temp.y = 215;
			return temp;
		}

		private function mainSocietyBtn_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			mainSocietyBtn = temp;
			temp.name = "mainSocietyBtn";
			temp.groupName = "CountryPanelMainTabBarRadioGroup";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.country.button.ButtonMain_tabbar_jiazu);
			temp.x = 0;
			temp.y = 163;
			return temp;
		}

		private function mainTianXiaBtn_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			mainTianXiaBtn = temp;
			temp.name = "mainTianXiaBtn";
			temp.groupName = "CountryPanelMainTabBarRadioGroup";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.country.button.ButtonMain_tabbar_tianxia);
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function tianXiaItem_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			tianXiaItem = temp;
			temp.name = "tianXiaItem";
			var skin:StateSkin = new org.mokylin.skin.app.country.TianXiaTabItemSkin()
			temp.skin = skin
			temp.x = 118;
			temp.y = 157;
			return temp;
		}

	}
}