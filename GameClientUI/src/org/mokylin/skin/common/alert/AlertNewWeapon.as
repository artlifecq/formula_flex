package org.mokylin.skin.common.alert
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.button.ButtonSkin_putong;
	import org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli_yellow2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class AlertNewWeapon extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var NumZhanli:feathers.controls.UINumber;

		public var bg:feathers.controls.UIAsset;

		public var btnClose:feathers.controls.Button;

		public var btn_ok:feathers.controls.Button;

		public var icons:feathers.controls.UIAsset;

		public var lbl_name:feathers.controls.Label;

		public var lbl_title:feathers.controls.Label;

		public var uiUP:feathers.controls.UIAsset;

		public var uiZhandouli:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function AlertNewWeapon()
		{
			super();
			
			this.currentState = "normal";
			this.height = 265;
			this.width = 331;
			this.elementsContent = [bg_i(),__AlertNewWeapon_UIAsset1_i(),lbl_title_i(),btnClose_i(),btn_ok_i(),icons_i(),lbl_name_i(),__AlertNewWeapon_Label1_i(),uiZhandouli_i(),NumZhanli_i(),uiUP_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function NumZhanli_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			NumZhanli = temp;
			temp.name = "NumZhanli";
			temp.gap = -13;
			temp.height = 33;
			temp.label = "198";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli_yellow2;
			temp.width = 148;
			temp.x = 133;
			temp.y = 149;
			return temp;
		}

		private function __AlertNewWeapon_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 40;
			temp.leading = 6;
			temp.text = "你获得了一件更好的装备，佩戴后提升战斗力";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 189;
			temp.x = 114;
			temp.y = 96;
			return temp;
		}

		private function __AlertNewWeapon_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/background/erji_bg.jpg";
			temp.x = 12;
			temp.y = 40;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 265;
			temp.styleName = "ui/common/background/erji_kuang.png";
			temp.width = 331;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close;
			temp.x = 297;
			temp.y = 7;
			return temp;
		}

		private function btn_ok_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_ok = temp;
			temp.name = "btn_ok";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "确认使用";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xE1D4A9;
			temp.width = 115;
			temp.x = 109;
			temp.y = 214;
			return temp;
		}

		private function icons_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icons = temp;
			temp.name = "icons";
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/64.png";
			temp.x = 33;
			temp.y = 67;
			return temp;
		}

		private function lbl_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_name = temp;
			temp.name = "lbl_name";
			temp.bold = false;
			temp.height = 22;
			temp.letterSpacing = 0;
			temp.fontSize = 16;
			temp.text = "流星护甲";
			temp.textAlign = "left";
			temp.color = 0x9D4AA8;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 193;
			temp.x = 113;
			temp.y = 71;
			return temp;
		}

		private function lbl_title_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_title = temp;
			temp.name = "lbl_title";
			temp.bold = true;
			temp.touchable = false;
			temp.touchGroup = true;
			temp.letterSpacing = 2;
			temp.fontSize = 16;
			temp.text = "更好的装备";
			temp.textAlign = "center";
			temp.color = 0xDDE2B1;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 240;
			temp.x = 48;
			temp.y = 11;
			return temp;
		}

		private function uiUP_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiUP = temp;
			temp.name = "uiUP";
			temp.styleName = "ui/common/tubiao/xiangshang.png";
			temp.x = 255;
			temp.y = 160;
			return temp;
		}

		private function uiZhandouli_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiZhandouli = temp;
			temp.name = "uiZhandouli";
			temp.styleName = "ui/common/zdl2.png";
			temp.x = 58;
			temp.y = 139;
			return temp;
		}

	}
}