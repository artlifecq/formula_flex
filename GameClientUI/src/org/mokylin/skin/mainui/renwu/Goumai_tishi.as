package org.mokylin.skin.mainui.renwu
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.common.TongYongTanKuang_bg;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.check.CheckBoxSkin_1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Goumai_tishi extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var btnClose:feathers.controls.Button;

		public var btn_cancel:feathers.controls.Button;

		public var btn_ok:feathers.controls.Button;

		public var chk_ok:feathers.controls.Check;

		public var lb_name:feathers.controls.Label;

		public var lb_yuanbao:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Goumai_tishi()
		{
			super();
			
			this.currentState = "normal";
			this.height = 264;
			this.width = 337;
			this.elementsContent = [bg_i(),__Goumai_tishi_UIAsset2_i(),btnClose_i(),btn_cancel_i(),btn_ok_i(),chk_ok_i(),__Goumai_tishi_UIAsset3_i(),lb_name_i(),__Goumai_tishi_Label1_i(),__Goumai_tishi_UIAsset4_i(),__Goumai_tishi_UIAsset5_i(),lb_yuanbao_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Goumai_tishi_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "售价：";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 118;
			temp.y = 103;
			return temp;
		}

		private function __Goumai_tishi_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/art_txt/common/background/wxts.png";
			temp.x = 121;
			temp.y = 9;
			return temp;
		}

		private function __Goumai_tishi_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/grid/normal/64.png";
			temp.x = 32;
			temp.y = 59;
			return temp;
		}

		private function __Goumai_tishi_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/background/neikuang.png";
			temp.width = 106;
			temp.x = 166;
			temp.y = 101;
			return temp;
		}

		private function __Goumai_tishi_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tubiao/yuanbao_24.png";
			temp.x = 244;
			temp.y = 100;
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
			temp.width = 337;
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
			temp.x = 302;
			temp.y = 4;
			return temp;
		}

		private function btn_cancel_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_cancel = temp;
			temp.name = "btn_cancel";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "取 消";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 88;
			temp.x = 57;
			temp.y = 216;
			return temp;
		}

		private function btn_ok_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_ok = temp;
			temp.name = "btn_ok";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "购买并使用";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 88;
			temp.x = 181;
			temp.y = 216;
			return temp;
		}

		private function chk_ok_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_ok = temp;
			temp.name = "chk_ok";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "本次出售不再确认";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.color = 0x5CB006;
			temp.width = 149;
			temp.x = 97;
			temp.y = 157;
			return temp;
		}

		private function lb_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_name = temp;
			temp.name = "lb_name";
			temp.fontSize = 16;
			temp.text = "讨伐卷轴（紫装）";
			temp.color = 0x9D4AA8;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 195;
			temp.x = 116;
			temp.y = 68;
			return temp;
		}

		private function lb_yuanbao_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_yuanbao = temp;
			temp.name = "lb_yuanbao";
			temp.text = "9999999";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 90;
			temp.x = 171;
			temp.y = 104;
			return temp;
		}

	}
}