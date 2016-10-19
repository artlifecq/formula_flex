package org.mokylin.skin.common
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_close2;
	import org.mokylin.skin.component.button.ButtonSkin_getequip;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class AutoDressEquipAlertSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnClose:feathers.controls.Button;

		public var btnDress:feathers.controls.Button;

		public var grid:feathers.controls.UIAsset;

		public var imgBG:feathers.controls.UIAsset;

		public var lbName:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function AutoDressEquipAlertSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 211;
			this.width = 215;
			this.elementsContent = [imgBG_i(),grid_i(),lbName_i(),__AutoDressEquipAlertSkin_UIAsset1_i(),btnDress_i(),btnClose_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __AutoDressEquipAlertSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 1;
			temp.styleName = "ui/common/tip/equipTips/dikuang/taitoufengexian.png";
			temp.width = 200;
			temp.x = 7;
			temp.y = 48;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.height = 12;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_close2);
			temp.width = 13;
			temp.x = 193;
			temp.y = 9;
			return temp;
		}

		private function btnDress_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnDress = temp;
			temp.name = "btnDress";
			temp.height = 31;
			temp.label = "立即穿戴";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_getequip);
			temp.textAlign = "center";
			temp.width = 76;
			temp.x = 71;
			temp.y = 154;
			return temp;
		}

		private function grid_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid = temp;
			temp.name = "grid";
			temp.height = 74;
			temp.styleName = "ui/common/grid/normal/60.png";
			temp.width = 76;
			temp.x = 70;
			temp.y = 67;
			return temp;
		}

		private function imgBG_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBG = temp;
			temp.name = "imgBG";
			temp.height = 211;
			temp.styleName = "ui/common/tip/equipTips/dikuang/tipsBg.png";
			temp.width = 215;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.bold = false;
			temp.height = 27;
			temp.fontSize = 18;
			temp.text = "装备名称";
			temp.textAlign = "center";
			temp.color = 0xF09E01;
			temp.width = 188;
			temp.x = 13;
			temp.y = 14;
			return temp;
		}

	}
}