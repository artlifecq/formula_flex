package org.mokylin.skin.app.family
{
	import feathers.themes.GuiThemeStyle;
	import feathers.data.ListCollection;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.UIAsset;
	import feathers.controls.ScrollContainer;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.button.ButtonSkin_green2;
	import org.mokylin.skin.component.check.CheckSkin_2;
	import org.mokylin.skin.component.scrollbar.skin_chat.VScrollBarChatSkin;
	import org.mokylin.skin.component.tabbar.TabBtnSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class FamilyIncomePanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnChange:feathers.controls.Button;

		public var btnClose:feathers.controls.Button;

		public var btnJoinFamily:feathers.controls.Button;

		public var btnSpecial:feathers.controls.Check;

		public var scrollBar:feathers.controls.ScrollContainer;

		public var tabBar:feathers.controls.TabBar;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FamilyIncomePanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__FamilyIncomePanelSkin_UIAsset1_i(),btnClose_i(),__FamilyIncomePanelSkin_Label1_i(),tabBar_i(),scrollBar_i(),__FamilyIncomePanelSkin_Label2_i(),__FamilyIncomePanelSkin_Label3_i(),btnJoinFamily_i(),btnChange_i(),btnSpecial_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __FamilyIncomePanelSkin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['家族申请列表','可招募列表'];
			return temp;
		}

		private function __FamilyIncomePanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.height = 18;
			temp.touchable = false;
			temp.fontSize = 14;
			temp.text = "家族收人";
			temp.textAlign = "center";
			temp.color = 0xDED8C7;
			temp.width = 88;
			temp.x = 130;
			temp.y = 8;
			return temp;
		}

		private function __FamilyIncomePanelSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.fontSize = 14;
			temp.text = "玩家姓名";
			temp.textAlign = "center";
			temp.width = 89;
			temp.x = 35;
			temp.y = 73;
			return temp;
		}

		private function __FamilyIncomePanelSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.fontSize = 14;
			temp.text = "等级";
			temp.textAlign = "center";
			temp.width = 91;
			temp.x = 193;
			temp.y = 73;
			return temp;
		}

		private function __FamilyIncomePanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 474;
			temp.styleName = "ui/common/backgound/tyzk.png";
			temp.width = 354;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnChange_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnChange = temp;
			temp.name = "btnChange";
			temp.label = "换一批";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_green2);
			temp.width = 90;
			temp.x = 182;
			temp.y = 430;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_close);
			temp.x = 321;
			temp.y = 3;
			return temp;
		}

		private function btnJoinFamily_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnJoinFamily = temp;
			temp.name = "btnJoinFamily";
			temp.label = "邀请加入家族";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_green2);
			temp.width = 90;
			temp.x = 79;
			temp.y = 428;
			return temp;
		}

		private function btnSpecial_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			btnSpecial = temp;
			temp.name = "btnSpecial";
			temp.label = "仅显示特殊玩家";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.check.CheckSkin_2);
			temp.x = 18;
			temp.y = 398;
			return temp;
		}

		private function scrollBar_i():feathers.controls.ScrollContainer
		{
			var temp:feathers.controls.ScrollContainer = new feathers.controls.ScrollContainer();
			scrollBar = temp;
			temp.name = "scrollBar";
			temp.height = 281;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.scrollbar.skin_chat.VScrollBarChatSkin);
			temp.width = 308;
			temp.x = 16;
			temp.y = 100;
			return temp;
		}

		private function tabBar_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tabBar = temp;
			temp.name = "tabBar";
			temp.height = 26;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.tabbar.TabBtnSkin);
			temp.width = 185;
			temp.x = 15;
			temp.y = 39;
			temp.dataProvider = __FamilyIncomePanelSkin_ArrayCollection1_i();
			return temp;
		}

	}
}