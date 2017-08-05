package org.mokylin.skin.common.alert
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.common.TongYongTanKuang_bg;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.uinumber.UINumberSkin_zhujuezhandouli;

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

		public var bg:feathers.controls.SkinnableContainer;

		public var btnClose:feathers.controls.Button;

		public var btn_ok:feathers.controls.Button;

		public var icons:feathers.controls.UIAsset;

		public var imgLine1:feathers.controls.UIAsset;

		public var lbMiaoshu:feathers.controls.Label;

		public var lbl_name:feathers.controls.Label;

		public var uiUP:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function AlertNewWeapon()
		{
			super();
			
			this.currentState = "normal";
			this.height = 264;
			this.width = 326;
			this.elementsContent = [bg_i(),imgLine1_i(),btnClose_i(),icons_i(),lbl_name_i(),lbMiaoshu_i(),__AlertNewWeapon_Group1_i(),btn_ok_i(),__AlertNewWeapon_UIAsset2_i()];
			
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
			temp.gap = -6;
			temp.height = 25;
			temp.label = "629845";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_zhujuezhandouli;
			temp.width = 142;
			temp.x = 68;
			temp.y = 13;
			return temp;
		}

		private function __AlertNewWeapon_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 67;
			temp.y = 147;
			temp.elementsContent = [__AlertNewWeapon_UIAsset1_i(),NumZhanli_i(),uiUP_i()];
			return temp;
		}

		private function __AlertNewWeapon_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/zhandouli2.png";
			temp.x = 13;
			temp.y = 10;
			return temp;
		}

		private function __AlertNewWeapon_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/common/background/wxts.png";
			temp.x = 121;
			temp.y = 9;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 264;
			var skin:StateSkin = new org.mokylin.skin.common.TongYongTanKuang_bg()
			temp.skin = skin
			temp.width = 326;
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
			temp.x = 293;
			temp.y = 5;
			return temp;
		}

		private function btn_ok_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_ok = temp;
			temp.name = "btn_ok";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "立即使用";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 110;
			temp.x = 108;
			temp.y = 216;
			return temp;
		}

		private function icons_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icons = temp;
			temp.name = "icons";
			temp.styleName = "ui/common/grid/normal/64.png";
			temp.x = 32;
			temp.y = 59;
			return temp;
		}

		private function imgLine1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgLine1 = temp;
			temp.name = "imgLine1";
			temp.styleName = "ui/common/tips/xian.png";
			temp.x = 32;
			temp.y = 146;
			return temp;
		}

		private function lbMiaoshu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbMiaoshu = temp;
			temp.name = "lbMiaoshu";
			temp.height = 40;
			temp.leading = 3;
			temp.text = "你获得了一件更好的装备，佩戴后提升战斗力";
			temp.color = 0xA3A594;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 189;
			temp.x = 114;
			temp.y = 83;
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
			temp.text = "道具名(绿装)";
			temp.textAlign = "left";
			temp.color = 0x00DFFF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 193;
			temp.x = 114;
			temp.y = 61;
			return temp;
		}

		private function uiUP_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiUP = temp;
			temp.name = "uiUP";
			temp.styleName = "ui/common/tubiao/jobup.png";
			temp.x = 159;
			temp.y = 19;
			return temp;
		}

	}
}