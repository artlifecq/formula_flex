package org.mokylin.skin.app.country
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_close_3;
	import org.mokylin.skin.component.button.ButtonSkin_getequip;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class PrivilegeMarkPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnClose:feathers.controls.Button;

		public var newWarInfoTxt:feathers.controls.Label;

		public var prizeGrid:feathers.controls.UIAsset;

		public var receiveBtn:feathers.controls.Button;

		public var title:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function PrivilegeMarkPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__PrivilegeMarkPanelSkin_UIAsset1_i(),__PrivilegeMarkPanelSkin_UIAsset2_i(),__PrivilegeMarkPanelSkin_UIAsset3_i(),title_i(),btnClose_i(),newWarInfoTxt_i(),receiveBtn_i(),__PrivilegeMarkPanelSkin_UIAsset4_i(),prizeGrid_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __PrivilegeMarkPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 238;
			temp.styleName = "ui/common/backgound/dikuang.png";
			temp.width = 410;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __PrivilegeMarkPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/common/kang/taitougaoliang.png";
			temp.width = 372;
			temp.x = 21;
			temp.y = 7;
			return temp;
		}

		private function __PrivilegeMarkPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 132;
			temp.styleName = "ui/common/kang/neikuang1.png";
			temp.width = 376;
			temp.x = 17;
			temp.y = 43;
			return temp;
		}

		private function __PrivilegeMarkPanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 167;
			temp.y = 53;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_close_3);
			temp.x = 376;
			temp.y = 6;
			return temp;
		}

		private function newWarInfoTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			newWarInfoTxt = temp;
			temp.name = "newWarInfoTxt";
			temp.bold = true;
			temp.height = 59;
			temp.htmlText = "恭喜您担任国王。<br>使用玉玺可以打开专属权限界面。";
			temp.fontSize = 14;
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 224;
			temp.x = 24;
			temp.y = 114;
			return temp;
		}

		private function prizeGrid_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			prizeGrid = temp;
			temp.name = "prizeGrid";
			temp.styleName = "ui/common/tubiao/bangpaizijin48.png";
			temp.x = 171;
			temp.y = 56;
			return temp;
		}

		private function receiveBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			receiveBtn = temp;
			temp.name = "receiveBtn";
			temp.label = "领取";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_getequip);
			temp.width = 93;
			temp.x = 153;
			temp.y = 186;
			return temp;
		}

		private function title_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			title = temp;
			temp.name = "title";
			temp.height = 26;
			temp.touchGroup = false;
			temp.touchable = false;
			temp.fontSize = 18;
			temp.text = "权利印记";
			temp.textAlign = "center";
			temp.color = 0xDDDABA;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 175;
			temp.x = 119;
			temp.y = 4;
			return temp;
		}

	}
}