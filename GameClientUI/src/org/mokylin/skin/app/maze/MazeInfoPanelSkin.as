package org.mokylin.skin.app.maze
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.data.ListCollection;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.UIAsset;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.component.button.ButtonTopRightArrow;
	import org.mokylin.skin.component.button.ButtonV3_e_erjianniu;
	import org.mokylin.skin.component.tabbar.TabBarSkin_normal;
	import org.mokylin.skin.mainui.chat.button.ButtonSkin_min;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MazeInfoPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var all:feathers.controls.Group;

		public var allEnd:feathers.controls.Label;

		public var btnClose:feathers.controls.Button;

		public var btnOpen:feathers.controls.Button;

		public var endTime:feathers.controls.Label;

		public var getout:feathers.controls.Button;

		public var lastRank:feathers.controls.Label;

		public var tabBar:feathers.controls.TabBar;

		public var title:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MazeInfoPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.width = 255;
			this.elementsContent = [all_i(),btnClose_i(),btnOpen_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __MazeInfoPanelSkin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['全服排名','本国排名','全国排名'];
			return temp;
		}

		private function __MazeInfoPanelSkin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 6;
			return temp;
		}

		private function __MazeInfoPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 481;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/common/version_3/T_tongyongxiaomianban/di_kuang.png";
			temp.width = 250;
			temp.x = 5;
			temp.y = 8;
			return temp;
		}

		private function __MazeInfoPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/T_tongyongxiaomianban/hua_wen.png";
			temp.x = 58;
			temp.y = 2;
			return temp;
		}

		private function __MazeInfoPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/T_tongyongxiaomianban/title.png";
			temp.width = 241;
			temp.x = 8;
			temp.y = 11;
			return temp;
		}

		private function allEnd_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			allEnd = temp;
			temp.name = "allEnd";
			temp.text = "全服共$位勇士到达终点";
			temp.color = 0xD4C996;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 214;
			temp.x = 16;
			temp.y = 66;
			return temp;
		}

		private function all_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			all = temp;
			temp.name = "all";
			temp.width = 255;
			temp.x = 2;
			temp.y = 1;
			temp.elementsContent = [__MazeInfoPanelSkin_UIAsset1_i(),getout_i(),tabBar_i(),__MazeInfoPanelSkin_UIAsset2_i(),__MazeInfoPanelSkin_UIAsset3_i(),title_i(),endTime_i(),lastRank_i(),allEnd_i()];
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonTopRightArrow);
			temp.x = 231;
			temp.y = 9;
			return temp;
		}

		private function btnOpen_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOpen = temp;
			temp.name = "btnOpen";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.mainui.chat.button.ButtonSkin_min);
			temp.x = 231;
			temp.y = 10;
			return temp;
		}

		private function endTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			endTime = temp;
			temp.name = "endTime";
			temp.text = "活动倒计时:";
			temp.color = 0xD4C996;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 229;
			temp.x = 16;
			temp.y = 42;
			return temp;
		}

		private function getout_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			getout = temp;
			temp.name = "getout";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 35;
			temp.label = "离开迷宫";
			temp.fontSize = 14;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_e_erjianniu);
			temp.color = 0xF9F0CC;
			temp.width = 108;
			temp.x = 81;
			temp.y = 443;
			return temp;
		}

		private function lastRank_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lastRank = temp;
			temp.name = "lastRank";
			temp.text = "上次排名";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.underline = true;
			temp.x = 189;
			temp.y = 457;
			return temp;
		}

		private function tabBar_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tabBar = temp;
			temp.name = "tabBar";
			temp.btnWidth = 70;
			temp.gap = 0;
			temp.height = 26;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.tabbar.TabBarSkin_normal);
			temp.width = 256;
			temp.x = 11;
			temp.y = 89;
			temp.layout = __MazeInfoPanelSkin_HorizontalLayout1_i();
			temp.dataProvider = __MazeInfoPanelSkin_ArrayCollection1_i();
			return temp;
		}

		private function title_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			title = temp;
			temp.name = "title";
			temp.fontSize = 16;
			temp.text = "全服排名";
			temp.textAlign = "center";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 243;
			temp.x = 7;
			temp.y = 12;
			return temp;
		}

	}
}