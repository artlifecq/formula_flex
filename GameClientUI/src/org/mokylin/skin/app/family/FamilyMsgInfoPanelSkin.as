package org.mokylin.skin.app.family
{
	import feathers.themes.GuiThemeStyle;
	import feathers.data.ListCollection;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.TextArea;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.button.ButtonSkin_green2;
	import org.mokylin.skin.component.tabbar.TabBtnSkin;
	import org.mokylin.skin.component.text.TextInputSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class FamilyMsgInfoPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnCancel:feathers.controls.Button;

		public var btnClose:feathers.controls.Button;

		public var btnRelease:feathers.controls.Button;

		public var labInfo:feathers.controls.TextArea;

		public var tabBar:feathers.controls.TabBar;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FamilyMsgInfoPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__FamilyMsgInfoPanelSkin_UIAsset1_i(),btnClose_i(),__FamilyMsgInfoPanelSkin_Label1_i(),tabBar_i(),btnRelease_i(),btnCancel_i(),labInfo_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __FamilyMsgInfoPanelSkin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['宗旨','公告','招募'];
			return temp;
		}

		private function __FamilyMsgInfoPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.height = 18;
			temp.touchable = false;
			temp.fontSize = 14;
			temp.text = "家族招募";
			temp.textAlign = "center";
			temp.color = 0xDED8C7;
			temp.width = 88;
			temp.x = 163;
			temp.y = 9;
			return temp;
		}

		private function __FamilyMsgInfoPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 230;
			temp.styleName = "ui/common/backgound/tyzk.png";
			temp.width = 415;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnCancel_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnCancel = temp;
			temp.name = "btnCancel";
			temp.label = "取 消";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_green2);
			temp.width = 90;
			temp.x = 221;
			temp.y = 183;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_close);
			temp.x = 381;
			temp.y = 4;
			return temp;
		}

		private function btnRelease_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnRelease = temp;
			temp.name = "btnRelease";
			temp.label = "发 布";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_green2);
			temp.width = 90;
			temp.x = 92;
			temp.y = 183;
			return temp;
		}

		private function labInfo_i():feathers.controls.TextArea
		{
			var temp:feathers.controls.TextArea = new feathers.controls.TextArea();
			labInfo = temp;
			temp.name = "labInfo";
			temp.height = 101;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextInputSkin);
			temp.width = 375;
			temp.x = 17;
			temp.y = 68;
			return temp;
		}

		private function tabBar_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tabBar = temp;
			temp.name = "tabBar";
			temp.height = 26;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.tabbar.TabBtnSkin);
			temp.width = 223;
			temp.x = 18;
			temp.y = 39;
			temp.dataProvider = __FamilyMsgInfoPanelSkin_ArrayCollection1_i();
			return temp;
		}

	}
}