package org.mokylin.skin.app.zhuangbei.qianghua
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.ComboBox;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.ProgressBar;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.zhuangbei.Zhuangbei_left;
	import org.mokylin.skin.app.zhuangbei.qianghua.Shuxing2_Skin;
	import org.mokylin.skin.app.zhuangbei.zuomo.Pro_zuomo1;
	import org.mokylin.skin.app.zhuangbei.zuomo.Pro_zuomo2;
	import org.mokylin.skin.component.button.ButtonSkin_info;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.combobox.ComboBox1_Skin;
	import org.mokylin.skin.component.combobox.ComboBox2_Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Zhuangbei_QianghuaSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn_qianghua_all:feathers.controls.Button;

		public var btn_qianhua:feathers.controls.Button;

		public var btn_shuoming:feathers.controls.Button;

		public var cmb_dengjie:feathers.controls.ComboBox;

		public var cmb_pinzhi:feathers.controls.ComboBox;

		public var equip_name:feathers.controls.Label;

		public var grpIcon:feathers.controls.Group;

		public var grp_pro:feathers.controls.Group;

		public var icon1:feathers.controls.UIAsset;

		public var icon2:feathers.controls.UIAsset;

		public var icon3:feathers.controls.UIAsset;

		public var icon4:feathers.controls.UIAsset;

		public var icon5:feathers.controls.UIAsset;

		public var icon6:feathers.controls.UIAsset;

		public var lb_current:feathers.controls.Label;

		public var lb_dengji:feathers.controls.Label;

		public var lb_pro:feathers.controls.Label;

		public var lb_up:feathers.controls.Label;

		public var left:feathers.controls.SkinnableContainer;

		public var progressBar1:feathers.controls.ProgressBar;

		public var progressBar2:feathers.controls.ProgressBar;

		public var up0:feathers.controls.SkinnableContainer;

		public var up1:feathers.controls.SkinnableContainer;

		public var up2:feathers.controls.SkinnableContainer;

		public var up3:feathers.controls.SkinnableContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Zhuangbei_QianghuaSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 601;
			this.width = 956;
			this.elementsContent = [__Zhuangbei_QianghuaSkin_UIAsset2_i(),__Zhuangbei_QianghuaSkin_UIAsset3_i(),left_i(),equip_name_i(),btn_shuoming_i(),lb_dengji_i(),__Zhuangbei_QianghuaSkin_Label1_i(),__Zhuangbei_QianghuaSkin_Label2_i(),up0_i(),up1_i(),up2_i(),up3_i(),btn_qianhua_i(),cmb_pinzhi_i(),cmb_dengjie_i(),btn_qianghua_all_i(),grp_pro_i(),grpIcon_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Zhuangbei_QianghuaSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "请放入强化材料";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 449;
			temp.y = 384;
			return temp;
		}

		private function __Zhuangbei_QianghuaSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "(强化成功后消耗材料将会消失，请慎重选择）";
			temp.color = 0xD02525;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 549;
			temp.y = 384;
			return temp;
		}

		private function __Zhuangbei_QianghuaSkin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/progress/jindutiao2/jdt_di.png";
			temp.width = 301;
			temp.x = 28;
			temp.y = 2;
			return temp;
		}

		private function __Zhuangbei_QianghuaSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 444;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 574;
			temp.x = 361;
			temp.y = 87;
			return temp;
		}

		private function __Zhuangbei_QianghuaSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/zhuangbei/qianghua/bg.jpg";
			temp.x = 364;
			temp.y = 89;
			return temp;
		}

		private function __Zhuangbei_QianghuaSkin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/text/input_bg.png";
			temp.width = 60;
			temp.x = -36;
			temp.y = 1;
			return temp;
		}

		private function __Zhuangbei_QianghuaSkin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/text/input_bg.png";
			temp.width = 60;
			temp.x = 333;
			temp.y = 1;
			return temp;
		}

		private function btn_qianghua_all_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_qianghua_all = temp;
			temp.name = "btn_qianghua_all";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "一键强化";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 88;
			temp.x = 708;
			temp.y = 483;
			return temp;
		}

		private function btn_qianhua_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_qianhua = temp;
			temp.name = "btn_qianhua";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "强 化";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 88;
			temp.x = 812;
			temp.y = 483;
			return temp;
		}

		private function btn_shuoming_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_shuoming = temp;
			temp.name = "btn_shuoming";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_info;
			temp.x = 901;
			temp.y = 94;
			return temp;
		}

		private function cmb_dengjie_i():feathers.controls.ComboBox
		{
			var temp:feathers.controls.ComboBox = new feathers.controls.ComboBox();
			cmb_dengjie = temp;
			temp.name = "cmb_dengjie";
			temp.height = 24;
			temp.fontSize = 14;
			temp.styleClass = org.mokylin.skin.component.combobox.ComboBox2_Skin;
			temp.textAlign = "left";
			temp.color = 0xA3A594;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 75;
			temp.x = 402;
			temp.y = 489;
			return temp;
		}

		private function cmb_pinzhi_i():feathers.controls.ComboBox
		{
			var temp:feathers.controls.ComboBox = new feathers.controls.ComboBox();
			cmb_pinzhi = temp;
			temp.name = "cmb_pinzhi";
			temp.height = 24;
			temp.fontSize = 14;
			temp.styleClass = org.mokylin.skin.component.combobox.ComboBox1_Skin;
			temp.textAlign = "left";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 166;
			temp.x = 484;
			temp.y = 489;
			return temp;
		}

		private function equip_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			equip_name = temp;
			temp.name = "equip_name";
			temp.text = "装备名字几个字";
			temp.textAlign = "center";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 138;
			temp.x = 579;
			temp.y = 101;
			return temp;
		}

		private function grpIcon_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpIcon = temp;
			temp.name = "grpIcon";
			temp.x = 481;
			temp.y = 146;
			temp.elementsContent = [icon1_i(),icon4_i(),icon2_i(),icon5_i(),icon3_i(),icon6_i()];
			return temp;
		}

		private function grp_pro_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_pro = temp;
			temp.name = "grp_pro";
			temp.x = 473;
			temp.y = 345;
			temp.elementsContent = [__Zhuangbei_QianghuaSkin_UIAsset8_i(),__Zhuangbei_QianghuaSkin_UIAsset9_i(),lb_current_i(),lb_up_i(),__Zhuangbei_QianghuaSkin_UIAsset11_i(),progressBar1_i(),progressBar2_i(),lb_pro_i()];
			return temp;
		}

		private function icon1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon1 = temp;
			temp.name = "icon1";
			temp.styleName = "ui/common/grid/normal/42.png";
			temp.x = 20;
			temp.y = 0;
			return temp;
		}

		private function icon2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon2 = temp;
			temp.name = "icon2";
			temp.styleName = "ui/common/grid/normal/42.png";
			temp.x = 0;
			temp.y = 64;
			return temp;
		}

		private function icon3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon3 = temp;
			temp.name = "icon3";
			temp.styleName = "ui/common/grid/normal/42.png";
			temp.x = 20;
			temp.y = 127;
			return temp;
		}

		private function icon4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon4 = temp;
			temp.name = "icon4";
			temp.styleName = "ui/common/grid/normal/42.png";
			temp.x = 266;
			temp.y = 0;
			return temp;
		}

		private function icon5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon5 = temp;
			temp.name = "icon5";
			temp.styleName = "ui/common/grid/normal/42.png";
			temp.x = 286;
			temp.y = 64;
			return temp;
		}

		private function icon6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon6 = temp;
			temp.name = "icon6";
			temp.styleName = "ui/common/grid/normal/42.png";
			temp.x = 266;
			temp.y = 127;
			return temp;
		}

		private function lb_current_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_current = temp;
			temp.name = "lb_current";
			temp.bold = true;
			temp.text = "等级1";
			temp.textAlign = "center";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 57;
			temp.x = -35;
			temp.y = 4;
			return temp;
		}

		private function lb_dengji_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_dengji = temp;
			temp.name = "lb_dengji";
			temp.height = 20;
			temp.text = "最大强化等级:30/30";
			temp.textAlign = "right";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 146;
			temp.x = 755;
			temp.y = 97;
			return temp;
		}

		private function lb_pro_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_pro = temp;
			temp.name = "lb_pro";
			temp.text = "160/200";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 166;
			temp.x = 101;
			temp.y = 5;
			return temp;
		}

		private function lb_up_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_up = temp;
			temp.name = "lb_up";
			temp.bold = true;
			temp.text = "等级2";
			temp.textAlign = "center";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 57;
			temp.x = 333;
			temp.y = 4;
			return temp;
		}

		private function left_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			left = temp;
			temp.name = "left";
			temp.height = 444;
			var skin:StateSkin = new org.mokylin.skin.app.zhuangbei.Zhuangbei_left()
			temp.skin = skin
			temp.width = 338;
			temp.x = 23;
			temp.y = 87;
			return temp;
		}

		private function progressBar1_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			progressBar1 = temp;
			temp.name = "progressBar1";
			temp.maximum = 200;
			temp.minimum = 0;
			temp.styleClass = org.mokylin.skin.app.zhuangbei.zuomo.Pro_zuomo1;
			temp.value = 100;
			temp.x = 49;
			temp.y = 5;
			return temp;
		}

		private function progressBar2_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			progressBar2 = temp;
			temp.name = "progressBar2";
			temp.maximum = 200;
			temp.minimum = 0;
			temp.styleClass = org.mokylin.skin.app.zhuangbei.zuomo.Pro_zuomo2;
			temp.value = 50;
			temp.x = 49;
			temp.y = 5;
			return temp;
		}

		private function up0_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			up0 = temp;
			temp.name = "up0";
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.app.zhuangbei.qianghua.Shuxing2_Skin()
			temp.skin = skin
			temp.width = 120;
			temp.x = 470;
			temp.y = 417;
			return temp;
		}

		private function up1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			up1 = temp;
			temp.name = "up1";
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.app.zhuangbei.qianghua.Shuxing2_Skin()
			temp.skin = skin
			temp.width = 120;
			temp.x = 684;
			temp.y = 416;
			return temp;
		}

		private function up2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			up2 = temp;
			temp.name = "up2";
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.app.zhuangbei.qianghua.Shuxing2_Skin()
			temp.skin = skin
			temp.width = 120;
			temp.x = 470;
			temp.y = 441;
			return temp;
		}

		private function up3_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			up3 = temp;
			temp.name = "up3";
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.app.zhuangbei.qianghua.Shuxing2_Skin()
			temp.skin = skin
			temp.width = 120;
			temp.x = 684;
			temp.y = 440;
			return temp;
		}

	}
}