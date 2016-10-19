package org.mokylin.skin.app.mount.panel
{
	import feathers.controls.text.Fontter;
	import flash.filters.GlowFilter;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.layout.VerticalLayout;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_close;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_da;
	import org.mokylin.skin.component.check.CheckBoxSkin_3;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MountAuthenticateSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnClose:feathers.controls.Button;

		public var btnZhuanHuan:feathers.controls.Button;

		public var buttomGroup:feathers.controls.Group;

		public var checkBoxYinZi:feathers.controls.Check;

		public var grid0:feathers.controls.UIAsset;

		public var group:feathers.controls.Group;

		public var groupIcon:feathers.controls.Group;

		public var labMoney:feathers.controls.Label;

		public var labName:feathers.controls.Label;

		public var labSpeed:feathers.controls.Label;

		public var labZiZhi:feathers.controls.Label;

		public var labelFilterBlack:flash.filters.GlowFilter;

		public var rightGroup:feathers.controls.Group;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MountAuthenticateSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 574;
			this.width = 420;
			labelFilterBlack_i();
			this.elementsContent = [__MountAuthenticateSkin_UIAsset1_i(),__MountAuthenticateSkin_UIAsset2_i(),__MountAuthenticateSkin_UIAsset3_i(),__MountAuthenticateSkin_UIAsset4_i(),btnClose_i(),rightGroup_i(),buttomGroup_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __MountAuthenticateSkin_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 8;
			temp.y = 15;
			temp.elementsContent = [__MountAuthenticateSkin_Label1_i(),__MountAuthenticateSkin_UIAsset8_i(),labName_i(),__MountAuthenticateSkin_Label2_i(),__MountAuthenticateSkin_UIAsset9_i(),labZiZhi_i(),__MountAuthenticateSkin_Label3_i(),__MountAuthenticateSkin_UIAsset10_i(),labSpeed_i()];
			return temp;
		}

		private function __MountAuthenticateSkin_Group2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.height = 158;
			temp.x = 0;
			temp.y = 110;
			temp.elementsContent = [__MountAuthenticateSkin_UIAsset11_i(),__MountAuthenticateSkin_UIAsset12_i(),group_i(),groupIcon_i(),__MountAuthenticateSkin_Label4_i(),__MountAuthenticateSkin_Label5_i(),__MountAuthenticateSkin_Label6_i()];
			return temp;
		}

		private function __MountAuthenticateSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 23;
			temp.fontSize = 14;
			temp.text = "姓     名";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 85;
			temp.x = 0;
			temp.y = 2;
			return temp;
		}

		private function __MountAuthenticateSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 23;
			temp.fontSize = 14;
			temp.text = "资     质";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 85;
			temp.x = 0;
			temp.y = 33;
			return temp;
		}

		private function __MountAuthenticateSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 23;
			temp.fontSize = 14;
			temp.text = "速     度";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 85;
			temp.x = 0;
			temp.y = 62;
			return temp;
		}

		private function __MountAuthenticateSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "属性";
			temp.textAlign = "center";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 94;
			temp.x = 3;
			temp.y = 6;
			return temp;
		}

		private function __MountAuthenticateSkin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "转化率";
			temp.textAlign = "center";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 86;
			temp.x = 115;
			temp.y = 6;
			return temp;
		}

		private function __MountAuthenticateSkin_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "成长";
			temp.textAlign = "center";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 75;
			temp.x = 220;
			temp.y = 6;
			return temp;
		}

		private function __MountAuthenticateSkin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 23;
			temp.styleName = "ui/common/kang/mount/shu_ru_kuang_1.png";
			temp.width = 220;
			temp.x = 83;
			temp.y = 59;
			return temp;
		}

		private function __MountAuthenticateSkin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 148;
			temp.styleName = "ui/common/version_3/D_di/di_4.png";
			temp.width = 320;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __MountAuthenticateSkin_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 24;
			temp.styleName = "ui/common/liebiao/lie_biao_di.png";
			temp.width = 310;
			temp.x = 5;
			temp.y = 3;
			return temp;
		}

		private function __MountAuthenticateSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 573;
			temp.styleName = "ui/common/backgound/di_ban.png";
			temp.width = 420;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __MountAuthenticateSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 28;
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/common/backgound/gao_guang.png";
			temp.width = 375;
			temp.x = 21;
			temp.y = 3;
			return temp;
		}

		private function __MountAuthenticateSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/app/mount/char/zuo_qi_jian_ding.png";
			temp.x = 170;
			temp.y = 7;
			return temp;
		}

		private function __MountAuthenticateSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/mount/img/tan_di.png";
			temp.x = 80;
			temp.y = 35;
			return temp;
		}

		private function __MountAuthenticateSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/kang/mount/tu_biao_kuang_2.png";
			temp.x = 103;
			temp.y = 25;
			return temp;
		}

		private function __MountAuthenticateSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/mount/char/xu_jian_ding_zuo_qi.png";
			temp.x = 115;
			temp.y = 5;
			return temp;
		}

		private function __MountAuthenticateSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 35;
			temp.styleName = "ui/common/version_3/S_shurukuang/shu_ru_kuang.png";
			temp.width = 250;
			temp.x = 45;
			temp.y = 145;
			return temp;
		}

		private function __MountAuthenticateSkin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 23;
			temp.styleName = "ui/common/kang/mount/shu_ru_kuang_1.png";
			temp.width = 220;
			temp.x = 83;
			temp.y = 0;
			return temp;
		}

		private function __MountAuthenticateSkin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 23;
			temp.styleName = "ui/common/kang/mount/shu_ru_kuang_1.png";
			temp.width = 220;
			temp.x = 83;
			temp.y = 30;
			return temp;
		}

		private function __MountAuthenticateSkin_VerticalLayout1_i():feathers.layout.VerticalLayout
		{
			var temp:feathers.layout.VerticalLayout = new feathers.layout.VerticalLayout();
			temp.gap = 6;
			return temp;
		}

		private function __MountAuthenticateSkin_VerticalLayout2_i():feathers.layout.VerticalLayout
		{
			var temp:feathers.layout.VerticalLayout = new feathers.layout.VerticalLayout();
			temp.gap = 1;
			temp.paddingTop = -2;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_mount_btn_close;
			temp.x = 393;
			temp.y = 0;
			return temp;
		}

		private function btnZhuanHuan_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnZhuanHuan = temp;
			temp.name = "btnZhuanHuan";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "坐骑鉴定";
			temp.fontSize = 18;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_mount_btn_da;
			temp.color = 0xDDDABA;
			temp.x = 90;
			temp.y = 210;
			return temp;
		}

		private function buttomGroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			buttomGroup = temp;
			temp.name = "buttomGroup";
			temp.height = 271;
			temp.width = 330;
			temp.x = 85;
			temp.y = 285;
			temp.elementsContent = [__MountAuthenticateSkin_Group1_i(),__MountAuthenticateSkin_Group2_i()];
			return temp;
		}

		private function checkBoxYinZi_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			checkBoxYinZi = temp;
			temp.name = "checkBoxYinZi";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "使用银子代替";
			temp.leading = 2;
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_3;
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.underline = false;
			temp.width = 116;
			temp.x = 113;
			temp.y = 184;
			return temp;
		}

		private function grid0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid0 = temp;
			temp.name = "grid0";
			temp.styleName = "ui/common/grid/normal/60.png";
			temp.x = 128;
			temp.y = 50;
			return temp;
		}

		private function groupIcon_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			groupIcon = temp;
			temp.name = "groupIcon";
			temp.height = 116;
			temp.width = 20;
			temp.x = 290;
			temp.y = 30;
			temp.layout = __MountAuthenticateSkin_VerticalLayout2_i();
			return temp;
		}

		private function group_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			group = temp;
			temp.name = "group";
			temp.height = 116;
			temp.width = 311;
			temp.x = 0;
			temp.y = 30;
			temp.layout = __MountAuthenticateSkin_VerticalLayout1_i();
			return temp;
		}

		private function labMoney_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labMoney = temp;
			temp.name = "labMoney";
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.fontSize = 14;
			temp.text = "鉴定消耗：银子/绑银 3锭48两4文";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 250;
			temp.x = 45;
			temp.y = 153;
			return temp;
		}

		private function labName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labName = temp;
			temp.name = "labName";
			temp.height = 23;
			temp.fontSize = 14;
			temp.text = "勇猛的紫金赤兔";
			temp.color = 0xF4BD63;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 188;
			temp.x = 88;
			temp.y = 2;
			return temp;
		}

		private function labSpeed_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labSpeed = temp;
			temp.name = "labSpeed";
			temp.height = 23;
			temp.fontSize = 14;
			temp.text = "754";
			temp.color = 0xF4BD63;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 160;
			temp.x = 88;
			temp.y = 62;
			return temp;
		}

		private function labZiZhi_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labZiZhi = temp;
			temp.name = "labZiZhi";
			temp.height = 23;
			temp.fontSize = 14;
			temp.text = "完美";
			temp.color = 0xF4BD63;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 160;
			temp.x = 88;
			temp.y = 32;
			return temp;
		}

		private function labelFilterBlack_i():flash.filters.GlowFilter
		{
			var temp:flash.filters.GlowFilter = new flash.filters.GlowFilter();
			labelFilterBlack = temp;
			temp.alpha = 0.8;
			temp.blurX = 2;
			temp.blurY = 2;
			temp.color = 0x000000;
			temp.inner = false;
			temp.knockout = false;
			temp.quality = 1;
			temp.strength = 10;
			return temp;
		}

		private function rightGroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			rightGroup = temp;
			temp.name = "rightGroup";
			temp.height = 520;
			temp.width = 334;
			temp.x = 83;
			temp.y = 36;
			temp.elementsContent = [__MountAuthenticateSkin_UIAsset5_i(),grid0_i(),btnZhuanHuan_i(),__MountAuthenticateSkin_UIAsset6_i(),__MountAuthenticateSkin_UIAsset7_i(),labMoney_i(),checkBoxYinZi_i()];
			return temp;
		}

	}
}