package org.mokylin.skin.app.chatSet
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.data.ListCollection;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.TextInput;
	import feathers.controls.UIAsset;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_sanji;
	import org.mokylin.skin.component.button.ButtonV3_g_guanbi;
	import org.mokylin.skin.component.list.ListSkin2;
	import org.mokylin.skin.component.tabbar.TabBarSkin_mount_fenye_heng;
	import org.mokylin.skin.component.text.TextInput6Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ChatSetSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var __ChatSetSkin_HorizontalLayout1:feathers.layout.HorizontalLayout;

		public var addBtn:feathers.controls.Button;

		public var baoCunBtn:feathers.controls.Button;

		public var btnClose:feathers.controls.Button;

		public var channelName:feathers.controls.Label;

		public var deleteBtn:feathers.controls.Button;

		public var tabBar:feathers.controls.TabBar;

		public var targetList:feathers.controls.List;

		public var textInput:feathers.controls.TextInput;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ChatSetSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__ChatSetSkin_UIAsset1_i(),btnClose_i(),__ChatSetSkin_Label1_i(),tabBar_i(),__ChatSetSkin_UIAsset2_i(),__ChatSetSkin_UIAsset3_i(),channelName_i(),deleteBtn_i(),addBtn_i(),textInput_i(),baoCunBtn_i(),targetList_i()];
			
			states = {
				init:[
						{target:"__ChatSetSkin_HorizontalLayout1",
							name:"paddingLeft",
							value:2
						}
					]
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ChatSetSkin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['黑名单','自定义1'];
			return temp;
		}

		private function __ChatSetSkin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = -2;
			__ChatSetSkin_HorizontalLayout1 = temp;
			temp.paddingRight = 2;
			return temp;
		}

		private function __ChatSetSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "聊天系统设置";
			temp.color = 0xDFC8AF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 112;
			temp.y = 15;
			return temp;
		}

		private function __ChatSetSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 434;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/er_ji_mian_ban.png";
			temp.width = 320;
			temp.x = 2;
			temp.y = 1;
			return temp;
		}

		private function __ChatSetSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 308;
			temp.styleName = "ui/common/kang/nei_kuang.png";
			temp.width = 290;
			temp.x = 17;
			temp.y = 69;
			return temp;
		}

		private function __ChatSetSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 26;
			temp.styleName = "ui/common/kang/di_5.png";
			temp.width = 276;
			temp.x = 23;
			temp.y = 75;
			return temp;
		}

		private function addBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			addBtn = temp;
			temp.name = "addBtn";
			temp.height = 23;
			temp.label = "新增";
			temp.fontSize = 14;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_mount_btn_sanji);
			temp.width = 45;
			temp.x = 176;
			temp.y = 46;
			return temp;
		}

		private function baoCunBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			baoCunBtn = temp;
			temp.name = "baoCunBtn";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 36;
			temp.label = "保存设置";
			temp.fontSize = 14;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji);
			temp.color = 0xF9F0CC;
			temp.width = 106;
			temp.x = 110;
			temp.y = 379;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_g_guanbi);
			temp.x = 282;
			temp.y = 8;
			return temp;
		}

		private function channelName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			channelName = temp;
			temp.name = "channelName";
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "频道名称：";
			temp.color = 0xEAA849;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 25;
			temp.y = 79;
			return temp;
		}

		private function deleteBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			deleteBtn = temp;
			temp.name = "deleteBtn";
			temp.height = 23;
			temp.label = "删除";
			temp.fontSize = 14;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_mount_btn_sanji);
			temp.width = 45;
			temp.x = 231;
			temp.y = 46;
			return temp;
		}

		private function tabBar_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tabBar = temp;
			temp.name = "tabBar";
			temp.btnWidth = 78;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.tabbar.TabBarSkin_mount_fenye_heng);
			temp.x = 20;
			temp.y = 42;
			temp.layout = __ChatSetSkin_HorizontalLayout1_i();
			temp.dataProvider = __ChatSetSkin_ArrayCollection1_i();
			return temp;
		}

		private function targetList_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			targetList = temp;
			temp.name = "targetList";
			temp.height = 265;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.list.ListSkin2);
			temp.width = 280;
			temp.x = 23;
			temp.y = 104;
			return temp;
		}

		private function textInput_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			textInput = temp;
			temp.name = "textInput";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextInput6Skin);
			temp.width = 197;
			temp.x = 97;
			temp.y = 75;
			return temp;
		}

	}
}