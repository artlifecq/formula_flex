package org.mokylin.skin.app.mount.panel
{
	import feathers.controls.text.Fontter;
	import flash.filters.GlowFilter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.layout.VerticalLayout;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_close;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_da;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MountChangeSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnClose:feathers.controls.Button;

		public var btnZhuanHuan:feathers.controls.Button;

		public var buttomGroup:feathers.controls.Group;

		public var grid0:feathers.controls.UIAsset;

		public var group:feathers.controls.Group;

		public var groupAttr:feathers.controls.Group;

		public var groupIcon:feathers.controls.Group;

		public var item0:feathers.controls.UIAsset;

		public var labGenGu:feathers.controls.Label;

		public var labGroupGenGu:feathers.controls.Group;

		public var labGroupName:feathers.controls.Group;

		public var labGroupSex:feathers.controls.Group;

		public var labGroupSpeed:feathers.controls.Group;

		public var labGroupType:feathers.controls.Group;

		public var labGroupZiZhi:feathers.controls.Group;

		public var labMoney:feathers.controls.Label;

		public var labName:feathers.controls.Label;

		public var labSex:feathers.controls.Label;

		public var labSpeed:feathers.controls.Label;

		public var labTypeName:feathers.controls.Label;

		public var labZiZhi:feathers.controls.Label;

		public var labelFilterBlack:flash.filters.GlowFilter;

		public var rightGroup:feathers.controls.Group;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MountChangeSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 575;
			this.width = 428;
			labelFilterBlack_i();
			this.elementsContent = [__MountChangeSkin_UIAsset1_i(),__MountChangeSkin_UIAsset2_i(),__MountChangeSkin_UIAsset3_i(),__MountChangeSkin_UIAsset4_i(),btnClose_i(),rightGroup_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __MountChangeSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 23;
			temp.fontSize = 14;
			temp.text = "姓     名";
			temp.textAlign = "center";
			temp.color = 0xD4C996;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 85;
			temp.x = 0;
			temp.y = 4;
			return temp;
		}

		private function __MountChangeSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 23;
			temp.fontSize = 14;
			temp.text = "性     别";
			temp.textAlign = "center";
			temp.color = 0xD4C996;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 85;
			temp.x = 0;
			temp.y = 4;
			return temp;
		}

		private function __MountChangeSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 23;
			temp.fontSize = 14;
			temp.text = "物     种";
			temp.textAlign = "center";
			temp.color = 0xD4C996;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 85;
			temp.x = 0;
			temp.y = 4;
			return temp;
		}

		private function __MountChangeSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 23;
			temp.fontSize = 14;
			temp.text = "资     质";
			temp.textAlign = "center";
			temp.color = 0xD4C996;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 85;
			temp.x = 0;
			temp.y = 4;
			return temp;
		}

		private function __MountChangeSkin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 23;
			temp.fontSize = 14;
			temp.text = "根     骨";
			temp.textAlign = "center";
			temp.color = 0xD4C996;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 85;
			temp.x = 0;
			temp.y = 4;
			return temp;
		}

		private function __MountChangeSkin_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 23;
			temp.fontSize = 14;
			temp.text = "速     度";
			temp.textAlign = "center";
			temp.color = 0xD4C996;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 85;
			temp.x = 0;
			temp.y = 4;
			return temp;
		}

		private function __MountChangeSkin_Label7_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "属性";
			temp.textAlign = "center";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 90;
			temp.x = 4;
			temp.y = 3;
			return temp;
		}

		private function __MountChangeSkin_Label8_i():feathers.controls.Label
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
			temp.x = 114;
			temp.y = 3;
			return temp;
		}

		private function __MountChangeSkin_Label9_i():feathers.controls.Label
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
			temp.x = 204;
			temp.y = 3;
			return temp;
		}

		private function __MountChangeSkin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 23;
			temp.styleName = "ui/common/kang/mount/shu_ru_kuang_1.png";
			temp.width = 220;
			temp.x = 85;
			temp.y = 0;
			return temp;
		}

		private function __MountChangeSkin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 23;
			temp.styleName = "ui/common/kang/mount/shu_ru_kuang_1.png";
			temp.width = 220;
			temp.x = 85;
			temp.y = 0;
			return temp;
		}

		private function __MountChangeSkin_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 23;
			temp.styleName = "ui/common/kang/mount/shu_ru_kuang_1.png";
			temp.width = 220;
			temp.x = 85;
			temp.y = 0;
			return temp;
		}

		private function __MountChangeSkin_UIAsset13_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 23;
			temp.styleName = "ui/common/kang/mount/shu_ru_kuang_1.png";
			temp.width = 220;
			temp.x = 85;
			temp.y = 0;
			return temp;
		}

		private function __MountChangeSkin_UIAsset14_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 23;
			temp.styleName = "ui/common/kang/mount/shu_ru_kuang_1.png";
			temp.width = 220;
			temp.x = 85;
			temp.y = 0;
			return temp;
		}

		private function __MountChangeSkin_UIAsset15_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 24;
			temp.styleName = "ui/common/liebiao/lie_biao_di.png";
			temp.width = 310;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __MountChangeSkin_UIAsset16_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 35;
			temp.styleName = "ui/common/version_3/S_shurukuang/shu_ru_kuang.png";
			temp.width = 250;
			temp.x = 40;
			temp.y = 430;
			return temp;
		}

		private function __MountChangeSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 573;
			temp.styleName = "ui/common/backgound/di_ban.png";
			temp.width = 425;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __MountChangeSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/mount/img/tan_di.png";
			temp.x = 80;
			temp.y = 36;
			return temp;
		}

		private function __MountChangeSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/common/backgound/gao_guang.png";
			temp.width = 365;
			temp.x = 27;
			temp.y = 4;
			return temp;
		}

		private function __MountChangeSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/app/mount/char/zuo_qi_zhuan_hua.png";
			temp.x = 170;
			temp.y = 8;
			return temp;
		}

		private function __MountChangeSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/mount/icon/jian_tou_xiao.png";
			temp.x = 135;
			temp.y = 40;
			return temp;
		}

		private function __MountChangeSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/T_tubiaodikuang/tu_biao_di_kuang.png";
			temp.x = 217;
			temp.y = 22;
			return temp;
		}

		private function __MountChangeSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/kang/mount/tu_biao_kuang_2.png";
			temp.x = 15;
			temp.y = 0;
			return temp;
		}

		private function __MountChangeSkin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 145;
			temp.styleName = "ui/common/version_3/D_di/di_4.png";
			temp.width = 320;
			temp.x = -3;
			temp.y = 155;
			return temp;
		}

		private function __MountChangeSkin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 23;
			temp.styleName = "ui/common/kang/mount/shu_ru_kuang_1.png";
			temp.width = 220;
			temp.x = 85;
			temp.y = 0;
			return temp;
		}

		private function __MountChangeSkin_VerticalLayout1_i():feathers.layout.VerticalLayout
		{
			var temp:feathers.layout.VerticalLayout = new feathers.layout.VerticalLayout();
			temp.gap = 6;
			return temp;
		}

		private function __MountChangeSkin_VerticalLayout2_i():feathers.layout.VerticalLayout
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
			temp.x = 398;
			temp.y = 1;
			return temp;
		}

		private function btnZhuanHuan_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnZhuanHuan = temp;
			temp.name = "btnZhuanHuan";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "转换兽牌";
			temp.fontSize = 18;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_mount_btn_da;
			temp.color = 0xDDDABA;
			temp.x = 88;
			temp.y = 469;
			return temp;
		}

		private function buttomGroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			buttomGroup = temp;
			temp.name = "buttomGroup";
			temp.height = 141;
			temp.width = 312;
			temp.x = 2;
			temp.y = 160;
			temp.elementsContent = [__MountChangeSkin_UIAsset15_i(),group_i(),groupIcon_i(),__MountChangeSkin_Label7_i(),__MountChangeSkin_Label8_i(),__MountChangeSkin_Label9_i()];
			return temp;
		}

		private function grid0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid0 = temp;
			temp.name = "grid0";
			temp.styleName = "ui/common/grid/normal/60.png";
			temp.x = 40;
			temp.y = 25;
			return temp;
		}

		private function groupAttr_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			groupAttr = temp;
			temp.name = "groupAttr";
			temp.x = 5;
			temp.y = 125;
			temp.elementsContent = [__MountChangeSkin_UIAsset8_i(),labGroupName_i(),labGroupSex_i(),labGroupType_i(),labGroupZiZhi_i(),labGroupGenGu_i(),labGroupSpeed_i(),buttomGroup_i()];
			return temp;
		}

		private function groupIcon_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			groupIcon = temp;
			temp.name = "groupIcon";
			temp.height = 116;
			temp.width = 20;
			temp.x = 270;
			temp.y = 25;
			temp.layout = __MountChangeSkin_VerticalLayout2_i();
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
			temp.y = 25;
			temp.layout = __MountChangeSkin_VerticalLayout1_i();
			return temp;
		}

		private function item0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			item0 = temp;
			temp.name = "item0";
			temp.styleName = "ui/common/version_3/T_tubiaodikuang/tu_biao_kuang.png";
			temp.x = 231;
			temp.y = 35;
			return temp;
		}

		private function labGenGu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labGenGu = temp;
			temp.name = "labGenGu";
			temp.height = 23;
			temp.fontSize = 14;
			temp.text = "+ 9";
			temp.color = 0xF4BD63;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 185;
			temp.x = 90;
			temp.y = 3;
			return temp;
		}

		private function labGroupGenGu_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			labGroupGenGu = temp;
			temp.name = "labGroupGenGu";
			temp.height = 23;
			temp.width = 315;
			temp.x = 0;
			temp.y = 100;
			temp.elementsContent = [__MountChangeSkin_Label5_i(),__MountChangeSkin_UIAsset13_i(),labGenGu_i()];
			return temp;
		}

		private function labGroupName_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			labGroupName = temp;
			temp.name = "labGroupName";
			temp.height = 23;
			temp.width = 315;
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [__MountChangeSkin_Label1_i(),__MountChangeSkin_UIAsset9_i(),labName_i()];
			return temp;
		}

		private function labGroupSex_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			labGroupSex = temp;
			temp.name = "labGroupSex";
			temp.height = 23;
			temp.width = 315;
			temp.x = 0;
			temp.y = 25;
			temp.elementsContent = [__MountChangeSkin_Label2_i(),__MountChangeSkin_UIAsset10_i(),labSex_i()];
			return temp;
		}

		private function labGroupSpeed_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			labGroupSpeed = temp;
			temp.name = "labGroupSpeed";
			temp.height = 23;
			temp.width = 315;
			temp.x = 0;
			temp.y = 125;
			temp.elementsContent = [__MountChangeSkin_Label6_i(),__MountChangeSkin_UIAsset14_i(),labSpeed_i()];
			return temp;
		}

		private function labGroupType_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			labGroupType = temp;
			temp.name = "labGroupType";
			temp.height = 23;
			temp.width = 315;
			temp.x = 0;
			temp.y = 50;
			temp.elementsContent = [__MountChangeSkin_Label3_i(),__MountChangeSkin_UIAsset11_i(),labTypeName_i()];
			return temp;
		}

		private function labGroupZiZhi_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			labGroupZiZhi = temp;
			temp.name = "labGroupZiZhi";
			temp.height = 23;
			temp.width = 315;
			temp.x = 0;
			temp.y = 75;
			temp.elementsContent = [__MountChangeSkin_Label4_i(),__MountChangeSkin_UIAsset12_i(),labZiZhi_i()];
			return temp;
		}

		private function labMoney_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labMoney = temp;
			temp.name = "labMoney";
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.fontSize = 14;
			temp.text = "转换消耗：银子/绑银 3锭48两4文";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 250;
			temp.x = 40;
			temp.y = 438;
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
			temp.width = 185;
			temp.x = 90;
			temp.y = 3;
			return temp;
		}

		private function labSex_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labSex = temp;
			temp.name = "labSex";
			temp.height = 23;
			temp.fontSize = 14;
			temp.text = "雄";
			temp.color = 0xF4BD63;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 185;
			temp.x = 90;
			temp.y = 3;
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
			temp.width = 185;
			temp.x = 90;
			temp.y = 3;
			return temp;
		}

		private function labTypeName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labTypeName = temp;
			temp.name = "labTypeName";
			temp.height = 23;
			temp.fontSize = 14;
			temp.text = "紫金赤兔";
			temp.color = 0xF4BD63;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 185;
			temp.x = 90;
			temp.y = 3;
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
			temp.width = 185;
			temp.x = 90;
			temp.y = 3;
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
			temp.width = 331;
			temp.x = 83;
			temp.y = 38;
			temp.elementsContent = [__MountChangeSkin_UIAsset5_i(),__MountChangeSkin_UIAsset6_i(),item0_i(),__MountChangeSkin_UIAsset7_i(),grid0_i(),btnZhuanHuan_i(),groupAttr_i(),__MountChangeSkin_UIAsset16_i(),labMoney_i()];
			return temp;
		}

	}
}