package org.mokylin.skin.app.country.guild
{
	import feathers.themes.GuiThemeStyle;
	import feathers.data.ListCollection;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.app.country.guild.GuildDesPanelSkin;
	import org.mokylin.skin.app.country.guild.GuildEventPanelSkin;
	import org.mokylin.skin.app.country.guild.GuildInfoPanelSkin;
	import org.mokylin.skin.app.country.guild.GuildListPanelSkin;
	import org.mokylin.skin.component.tabbar.TabBarXiaofenye;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class GuildTabItemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var guildDesPanel:feathers.controls.SkinnableContainer;

		public var guildEventPanel:feathers.controls.SkinnableContainer;

		public var guildInfoPanel:feathers.controls.SkinnableContainer;

		public var guildListPanel:feathers.controls.SkinnableContainer;

		public var tabBar:feathers.controls.TabBar;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function GuildTabItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [tabBar_i(),guildDesPanel_i(),guildListPanel_i(),guildInfoPanel_i(),guildEventPanel_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __GuildTabItemSkin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['帮派信息','加入帮派'];
			return temp;
		}

		private function __GuildTabItemSkin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 0;
			return temp;
		}

		private function guildDesPanel_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			guildDesPanel = temp;
			temp.name = "guildDesPanel";
			temp.height = 496;
			var skin:StateSkin = new org.mokylin.skin.app.country.guild.GuildDesPanelSkin()
			temp.skin = skin
			temp.width = 883;
			temp.x = 1;
			temp.y = 29;
			return temp;
		}

		private function guildEventPanel_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			guildEventPanel = temp;
			temp.name = "guildEventPanel";
			temp.height = 496;
			var skin:StateSkin = new org.mokylin.skin.app.country.guild.GuildEventPanelSkin()
			temp.skin = skin
			temp.width = 883;
			temp.x = 1;
			temp.y = 29;
			return temp;
		}

		private function guildInfoPanel_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			guildInfoPanel = temp;
			temp.name = "guildInfoPanel";
			temp.height = 496;
			var skin:StateSkin = new org.mokylin.skin.app.country.guild.GuildInfoPanelSkin()
			temp.skin = skin
			temp.width = 883;
			temp.x = 1;
			temp.y = 29;
			return temp;
		}

		private function guildListPanel_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			guildListPanel = temp;
			temp.name = "guildListPanel";
			temp.height = 496;
			var skin:StateSkin = new org.mokylin.skin.app.country.guild.GuildListPanelSkin()
			temp.skin = skin
			temp.width = 883;
			temp.x = 1;
			temp.y = 29;
			return temp;
		}

		private function tabBar_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tabBar = temp;
			temp.name = "tabBar";
			temp.btnWidth = 85;
			temp.height = 34;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.tabbar.TabBarXiaofenye);
			temp.width = 268;
			temp.x = 24;
			temp.y = 0;
			temp.layout = __GuildTabItemSkin_HorizontalLayout1_i();
			temp.dataProvider = __GuildTabItemSkin_ArrayCollection1_i();
			return temp;
		}

	}
}