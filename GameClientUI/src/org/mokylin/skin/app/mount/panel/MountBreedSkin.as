package org.mokylin.skin.app.mount.panel
{
	import feathers.controls.text.Fontter;
	import flash.filters.GlowFilter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.TextInput;
	import feathers.controls.UIAsset;
	import feathers.layout.VerticalLayout;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_close;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji;
	import org.mokylin.skin.component.text.TextInput6Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MountBreedSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnBread:feathers.controls.Button;

		public var btnCancleBread:feathers.controls.Button;

		public var btnClose:feathers.controls.Button;

		public var btnGet:feathers.controls.Button;

		public var btnInviteBreed:feathers.controls.Button;

		public var btnSuoDing:feathers.controls.Button;

		public var buttomGroup:feathers.controls.Group;

		public var grid0:feathers.controls.UIAsset;

		public var group:feathers.controls.Group;

		public var groupIcon:feathers.controls.Group;

		public var imgBG:feathers.controls.UIAsset;

		public var imgInBreed:feathers.controls.UIAsset;

		public var imgTips:feathers.controls.UIAsset;

		public var labGenGu:feathers.controls.Label;

		public var labGroupGenGu:feathers.controls.Group;

		public var labGroupName:feathers.controls.Group;

		public var labGroupSex:feathers.controls.Group;

		public var labGroupSpeed:feathers.controls.Group;

		public var labGroupType:feathers.controls.Group;

		public var labGroupZiZhi:feathers.controls.Group;

		public var labMountBreedTime:feathers.controls.Label;

		public var labMountBreedTime0:feathers.controls.Label;

		public var labName:feathers.controls.Label;

		public var labSex:feathers.controls.Label;

		public var labSpeed:feathers.controls.Label;

		public var labTypeName:feathers.controls.Label;

		public var labZiZhi:feathers.controls.Label;

		public var labelFilterBlack:flash.filters.GlowFilter;

		public var rightGroup:feathers.controls.Group;

		public var textInput:feathers.controls.TextInput;

		public var topGroup:feathers.controls.Group;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MountBreedSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 574;
			this.width = 420;
			labelFilterBlack_i();
			this.elementsContent = [__MountBreedSkin_UIAsset1_i(),imgBG_i(),__MountBreedSkin_UIAsset2_i(),btnClose_i(),rightGroup_i(),__MountBreedSkin_UIAsset13_i(),grid0_i(),imgInBreed_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __MountBreedSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "属性";
			temp.textAlign = "center";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 82;
			temp.x = 10;
			temp.y = 168;
			return temp;
		}

		private function __MountBreedSkin_Label2_i():feathers.controls.Label
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
			temp.y = 168;
			return temp;
		}

		private function __MountBreedSkin_Label3_i():feathers.controls.Label
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
			temp.x = 210;
			temp.y = 168;
			return temp;
		}

		private function __MountBreedSkin_Label4_i():feathers.controls.Label
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

		private function __MountBreedSkin_Label5_i():feathers.controls.Label
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

		private function __MountBreedSkin_Label6_i():feathers.controls.Label
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

		private function __MountBreedSkin_Label7_i():feathers.controls.Label
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

		private function __MountBreedSkin_Label8_i():feathers.controls.Label
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

		private function __MountBreedSkin_Label9_i():feathers.controls.Label
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

		private function __MountBreedSkin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 23;
			temp.styleName = "ui/common/kang/mount/shu_ru_kuang_1.png";
			temp.width = 220;
			temp.x = 85;
			temp.y = 0;
			return temp;
		}

		private function __MountBreedSkin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 23;
			temp.styleName = "ui/common/kang/mount/shu_ru_kuang_1.png";
			temp.width = 220;
			temp.x = 85;
			temp.y = 0;
			return temp;
		}

		private function __MountBreedSkin_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 23;
			temp.styleName = "ui/common/kang/mount/shu_ru_kuang_1.png";
			temp.width = 220;
			temp.x = 85;
			temp.y = 0;
			return temp;
		}

		private function __MountBreedSkin_UIAsset13_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/app/mount/char/zuo_qi_fan_yu.png";
			temp.x = 170;
			temp.y = 6;
			return temp;
		}

		private function __MountBreedSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 573;
			temp.styleName = "ui/common/backgound/di_ban.png";
			temp.width = 420;
			temp.x = 2;
			temp.y = 0;
			return temp;
		}

		private function __MountBreedSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/common/backgound/gao_guang.png";
			temp.width = 402;
			temp.x = 11;
			temp.y = 3;
			return temp;
		}

		private function __MountBreedSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/mount/char/fan_yu_zuo_qi.png";
			temp.x = 120;
			temp.y = 35;
			return temp;
		}

		private function __MountBreedSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/kang/mount/tu_biao_kuang_2.png";
			temp.x = 100;
			temp.y = 55;
			return temp;
		}

		private function __MountBreedSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 148;
			temp.styleName = "ui/common/version_3/D_di/di_4.png";
			temp.width = 320;
			temp.x = 2;
			temp.y = 161;
			return temp;
		}

		private function __MountBreedSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 24;
			temp.styleName = "ui/common/liebiao/lie_biao_di.png";
			temp.width = 310;
			temp.x = 7;
			temp.y = 164;
			return temp;
		}

		private function __MountBreedSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 23;
			temp.styleName = "ui/common/kang/mount/shu_ru_kuang_1.png";
			temp.width = 220;
			temp.x = 85;
			temp.y = 0;
			return temp;
		}

		private function __MountBreedSkin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 23;
			temp.styleName = "ui/common/kang/mount/shu_ru_kuang_1.png";
			temp.width = 220;
			temp.x = 85;
			temp.y = 0;
			return temp;
		}

		private function __MountBreedSkin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 23;
			temp.styleName = "ui/common/kang/mount/shu_ru_kuang_1.png";
			temp.width = 220;
			temp.x = 85;
			temp.y = 0;
			return temp;
		}

		private function __MountBreedSkin_VerticalLayout1_i():feathers.layout.VerticalLayout
		{
			var temp:feathers.layout.VerticalLayout = new feathers.layout.VerticalLayout();
			temp.gap = 6;
			return temp;
		}

		private function __MountBreedSkin_VerticalLayout2_i():feathers.layout.VerticalLayout
		{
			var temp:feathers.layout.VerticalLayout = new feathers.layout.VerticalLayout();
			temp.gap = 1;
			temp.paddingTop = -2;
			return temp;
		}

		private function btnBread_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnBread = temp;
			temp.name = "btnBread";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 33;
			temp.label = "繁育";
			temp.fontSize = 14;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji;
			temp.textAlign = "center";
			temp.color = 0xDDDABA;
			temp.width = 72;
			temp.x = 127;
			temp.y = 170;
			return temp;
		}

		private function btnCancleBread_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnCancleBread = temp;
			temp.name = "btnCancleBread";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 33;
			temp.label = "取消繁育";
			temp.fontSize = 14;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji;
			temp.textAlign = "center";
			temp.color = 0xDDDABA;
			temp.width = 72;
			temp.x = 200;
			temp.y = 170;
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

		private function btnGet_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnGet = temp;
			temp.name = "btnGet";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 33;
			temp.label = "领取宝宝";
			temp.fontSize = 14;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji;
			temp.textAlign = "center";
			temp.color = 0xDDDABA;
			temp.width = 72;
			temp.x = 127;
			temp.y = 170;
			return temp;
		}

		private function btnInviteBreed_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnInviteBreed = temp;
			temp.name = "btnInviteBreed";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "发送繁育";
			temp.fontSize = 14;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji;
			temp.textAlign = "center";
			temp.color = 0xDDDABA;
			temp.width = 80;
			temp.x = 230;
			temp.y = 3;
			return temp;
		}

		private function btnSuoDing_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnSuoDing = temp;
			temp.name = "btnSuoDing";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 33;
			temp.label = "锁定";
			temp.fontSize = 14;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji;
			temp.textAlign = "center";
			temp.color = 0xDDDABA;
			temp.width = 72;
			temp.x = 55;
			temp.y = 170;
			return temp;
		}

		private function buttomGroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			buttomGroup = temp;
			temp.name = "buttomGroup";
			temp.height = 315;
			temp.width = 331;
			temp.x = 0;
			temp.y = 205;
			temp.elementsContent = [__MountBreedSkin_UIAsset5_i(),__MountBreedSkin_UIAsset6_i(),__MountBreedSkin_Label1_i(),__MountBreedSkin_Label2_i(),__MountBreedSkin_Label3_i(),labGroupName_i(),labGroupSex_i(),labGroupType_i(),labGroupZiZhi_i(),labGroupGenGu_i(),labGroupSpeed_i(),group_i(),groupIcon_i()];
			return temp;
		}

		private function grid0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid0 = temp;
			temp.name = "grid0";
			temp.styleName = "ui/common/grid/normal/60.png";
			temp.x = 207;
			temp.y = 115;
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
			temp.y = 189;
			temp.layout = __MountBreedSkin_VerticalLayout2_i();
			return temp;
		}

		private function group_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			group = temp;
			temp.name = "group";
			temp.height = 116;
			temp.width = 315;
			temp.x = 0;
			temp.y = 189;
			temp.layout = __MountBreedSkin_VerticalLayout1_i();
			return temp;
		}

		private function imgBG_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBG = temp;
			temp.name = "imgBG";
			temp.styleName = "ui/app/mount/img/tan_di.png";
			temp.x = 80;
			temp.y = 35;
			return temp;
		}

		private function imgInBreed_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgInBreed = temp;
			temp.name = "imgInBreed";
			temp.styleName = "ui/app/mount/char/fan_yu_zhong.png";
			temp.x = 183;
			temp.y = 130;
			return temp;
		}

		private function imgTips_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgTips = temp;
			temp.name = "imgTips";
			temp.styleName = "ui/common/icon/bangzhu.png";
			temp.x = 10;
			temp.y = 41;
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
			temp.y = 102;
			temp.elementsContent = [__MountBreedSkin_Label8_i(),__MountBreedSkin_UIAsset11_i(),labGenGu_i()];
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
			temp.y = 2;
			temp.elementsContent = [__MountBreedSkin_Label4_i(),__MountBreedSkin_UIAsset7_i(),labName_i()];
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
			temp.y = 27;
			temp.elementsContent = [__MountBreedSkin_Label5_i(),__MountBreedSkin_UIAsset8_i(),labSex_i()];
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
			temp.y = 127;
			temp.elementsContent = [__MountBreedSkin_Label9_i(),__MountBreedSkin_UIAsset12_i(),labSpeed_i()];
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
			temp.y = 52;
			temp.elementsContent = [__MountBreedSkin_Label6_i(),__MountBreedSkin_UIAsset9_i(),labTypeName_i()];
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
			temp.y = 77;
			temp.elementsContent = [__MountBreedSkin_Label7_i(),__MountBreedSkin_UIAsset10_i(),labZiZhi_i()];
			return temp;
		}

		private function labMountBreedTime0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labMountBreedTime0 = temp;
			temp.name = "labMountBreedTime0";
			temp.height = 20;
			temp.textAlign = "center";
			temp.color = 0xFF0000;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 324;
			temp.x = 0;
			temp.y = 152;
			return temp;
		}

		private function labMountBreedTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labMountBreedTime = temp;
			temp.name = "labMountBreedTime";
			temp.height = 20;
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 324;
			temp.x = 0;
			temp.y = 11;
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
			temp.height = 525;
			temp.width = 332;
			temp.x = 83;
			temp.y = 37;
			temp.elementsContent = [topGroup_i(),buttomGroup_i()];
			return temp;
		}

		private function textInput_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			textInput = temp;
			temp.name = "textInput";
			temp.height = 24;
			temp.styleClass = org.mokylin.skin.component.text.TextInput6Skin;
			temp.text = "邀请玩家繁育";
			temp.color = 0x4A4744;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 200;
			temp.x = 20;
			temp.y = 8;
			return temp;
		}

		private function topGroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			topGroup = temp;
			temp.name = "topGroup";
			temp.height = 204;
			temp.width = 329;
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [__MountBreedSkin_UIAsset3_i(),__MountBreedSkin_UIAsset4_i(),btnSuoDing_i(),btnGet_i(),btnBread_i(),btnCancleBread_i(),btnInviteBreed_i(),textInput_i(),imgTips_i(),labMountBreedTime_i(),labMountBreedTime0_i()];
			return temp;
		}

	}
}