package org.mokylin.skin.app.friend
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.data.ListCollection;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.UIAsset;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.component.button.ButtonV3_e_erjianniu;
	import org.mokylin.skin.component.button.ButtonV3_g_guanbi;
	import org.mokylin.skin.component.tabbar.TabBarSkin_normal;
	import org.mokylin.skin.component.version_3.check.CheckBoxSkin_gold;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class FriendPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var addFriend:feathers.controls.Button;

		public var btnClose:feathers.controls.Button;

		public var headBg:feathers.controls.UIAsset;

		public var imgHeadIco:feathers.controls.UIAsset;

		public var isshowLeavelLine:feathers.controls.Check;

		public var jobBg:feathers.controls.UIAsset;

		public var level:feathers.controls.Label;

		public var mood:feathers.controls.Label;

		public var name:feathers.controls.Label;

		public var sex:feathers.controls.UIAsset;

		public var tabBar:feathers.controls.TabBar;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FriendPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__FriendPanelSkin_UIAsset1_i(),__FriendPanelSkin_UIAsset2_i(),__FriendPanelSkin_UIAsset3_i(),headBg_i(),sex_i(),btnClose_i(),tabBar_i(),__FriendPanelSkin_UIAsset4_i(),imgHeadIco_i(),addFriend_i(),jobBg_i(),level_i(),__FriendPanelSkin_UIAsset5_i(),mood_i(),name_i(),isshowLeavelLine_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __FriendPanelSkin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['好友','屏蔽'];
			return temp;
		}

		private function __FriendPanelSkin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 10;
			return temp;
		}

		private function __FriendPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 652;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/er_ji_mian_ban.png";
			temp.width = 314;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __FriendPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/friend/diwen-top.png";
			temp.x = 168;
			temp.y = 39;
			return temp;
		}

		private function __FriendPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 26;
			temp.styleName = "ui/mainui/chat/shurukuang.png";
			temp.width = 187;
			temp.x = 106;
			temp.y = 81;
			return temp;
		}

		private function __FriendPanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.styleName = "ui/app/friend/wz_hy.png";
			temp.x = 133;
			temp.y = 13;
			return temp;
		}

		private function __FriendPanelSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/common/version_3/B_bujian/shu_ru_icon.png";
			temp.x = 270;
			temp.y = 85;
			return temp;
		}

		private function addFriend_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			addFriend = temp;
			temp.name = "addFriend";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 29;
			temp.label = "添加好友";
			temp.fontSize = 14;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_e_erjianniu);
			temp.color = 0xF9F0CC;
			temp.width = 84;
			temp.x = 213;
			temp.y = 609;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.height = 29;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_g_guanbi);
			temp.width = 30;
			temp.x = 278;
			temp.y = 4;
			return temp;
		}

		private function headBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			headBg = temp;
			temp.name = "headBg";
			temp.height = 71;
			temp.styleName = "ui/common/version_3/B_bujian/tou_xiang_kuang_xiao.png";
			temp.width = 71;
			temp.x = 35;
			temp.y = 62;
			return temp;
		}

		private function imgHeadIco_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgHeadIco = temp;
			temp.name = "imgHeadIco";
			temp.styleName = "ui/mainui/head/renwutouxiang.png";
			temp.x = 35;
			temp.y = 42;
			return temp;
		}

		private function isshowLeavelLine_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			isshowLeavelLine = temp;
			temp.name = "isshowLeavelLine";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "显示离线的好友和仇人";
			temp.fontSize = 14;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.version_3.check.CheckBoxSkin_gold);
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.width = 194;
			temp.x = 20;
			temp.y = 614;
			return temp;
		}

		private function jobBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			jobBg = temp;
			temp.name = "jobBg";
			temp.height = 28;
			temp.styleName = "ui/mainui/head/zhiye_di.png";
			temp.width = 28;
			temp.x = 31;
			temp.y = 103;
			return temp;
		}

		private function level_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			level = temp;
			temp.name = "level";
			temp.text = "89";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 37;
			temp.x = 27;
			temp.y = 108;
			return temp;
		}

		private function mood_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			mood = temp;
			temp.name = "mood";
			temp.text = "编辑心情";
			temp.color = 0x76726D;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 176;
			temp.x = 111;
			temp.y = 85;
			return temp;
		}

		private function name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			name = temp;
			temp.name = "name";
			temp.fontSize = 16;
			temp.text = "欧阳瑞雪";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 126;
			temp.y = 54;
			return temp;
		}

		private function sex_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sex = temp;
			temp.name = "sex";
			temp.styleName = "ui/common/version_3/B_bujian/nv.png";
			temp.x = 113;
			temp.y = 56;
			return temp;
		}

		private function tabBar_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tabBar = temp;
			temp.name = "tabBar";
			temp.btnWidth = 73;
			temp.height = 26;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.tabbar.TabBarSkin_normal);
			temp.width = 269;
			temp.x = 24;
			temp.y = 131;
			temp.layout = __FriendPanelSkin_HorizontalLayout1_i();
			temp.dataProvider = __FriendPanelSkin_ArrayCollection1_i();
			return temp;
		}

	}
}