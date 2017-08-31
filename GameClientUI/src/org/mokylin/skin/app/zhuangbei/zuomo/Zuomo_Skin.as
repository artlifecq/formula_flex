package org.mokylin.skin.app.zhuangbei.zuomo
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
	public class Zuomo_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var arrow_up1:feathers.controls.UIAsset;

		public var arrow_up2:feathers.controls.UIAsset;

		public var btn_shuoming:feathers.controls.Button;

		public var btn_zuomo:feathers.controls.Button;

		public var btn_zuomo_all:feathers.controls.Button;

		public var cmb_dengjie:feathers.controls.ComboBox;

		public var cmb_pinzhi:feathers.controls.ComboBox;

		public var grp_cilun:feathers.controls.Group;

		public var grp_jiacheng:feathers.controls.Group;

		public var ico_zuomo:feathers.controls.UIAsset;

		public var lb_baifenbi:feathers.controls.Label;

		public var lb_current:feathers.controls.Label;

		public var lb_name:feathers.controls.Label;

		public var lb_next:feathers.controls.Label;

		public var lb_pro:feathers.controls.Label;

		public var lb_up1:feathers.controls.Label;

		public var lb_up2:feathers.controls.Label;

		public var left:feathers.controls.SkinnableContainer;

		public var progressBar1:feathers.controls.ProgressBar;

		public var progressBar2:feathers.controls.ProgressBar;

		public var up_title:feathers.controls.Label;

		public var use1:feathers.controls.UIAsset;

		public var use2:feathers.controls.UIAsset;

		public var use3:feathers.controls.UIAsset;

		public var use4:feathers.controls.UIAsset;

		public var use5:feathers.controls.UIAsset;

		public var use6:feathers.controls.UIAsset;

		public var use_grp:feathers.controls.Group;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Zuomo_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 601;
			this.width = 956;
			this.elementsContent = [__Zuomo_Skin_UIAsset2_i(),left_i(),__Zuomo_Skin_UIAsset3_i(),btn_shuoming_i(),grp_cilun_i(),lb_name_i(),btn_zuomo_i(),ico_zuomo_i(),use_grp_i(),grp_jiacheng_i(),cmb_pinzhi_i(),cmb_dengjie_i(),btn_zuomo_all_i(),__Zuomo_Skin_Label3_i(),__Zuomo_Skin_Label4_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Zuomo_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "当前等级";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 3;
			temp.y = 64;
			return temp;
		}

		private function __Zuomo_Skin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "琢磨后等级";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 373;
			temp.y = 64;
			return temp;
		}

		private function __Zuomo_Skin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "请放入消耗材料";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 449;
			temp.y = 370;
			return temp;
		}

		private function __Zuomo_Skin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "(琢磨成功后消耗材料将会消失，请慎重选择）";
			temp.color = 0xFF0D0D;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 553;
			temp.y = 370;
			return temp;
		}

		private function __Zuomo_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 444;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 574;
			temp.x = 361;
			temp.y = 87;
			return temp;
		}

		private function __Zuomo_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/zhuangbei/zuomo/bg.jpg";
			temp.x = 364;
			temp.y = 90;
			return temp;
		}

		private function __Zuomo_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhuangbei/zuomo/yuankuang.png";
			temp.x = 95;
			temp.y = 8;
			return temp;
		}

		private function __Zuomo_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/text/input_bg.png";
			temp.width = 60;
			temp.x = 0;
			temp.y = 32;
			return temp;
		}

		private function __Zuomo_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/text/input_bg.png";
			temp.width = 60;
			temp.x = 380;
			temp.y = 32;
			return temp;
		}

		private function __Zuomo_Skin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/progress/jindutiao2/jdt_di.png";
			temp.width = 301;
			temp.x = 71;
			temp.y = 32;
			return temp;
		}

		private function __Zuomo_Skin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhuangbei/zuomo/dangqianzhuomojiacheng.png";
			temp.x = 154;
			temp.y = 0;
			return temp;
		}

		private function arrow_up1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			arrow_up1 = temp;
			temp.name = "arrow_up1";
			temp.styleName = "ui/common/tubiao/jobup2.png";
			temp.x = 448;
			temp.y = 38;
			return temp;
		}

		private function arrow_up2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			arrow_up2 = temp;
			temp.name = "arrow_up2";
			temp.styleName = "ui/common/tubiao/jobup2.png";
			temp.x = 273;
			temp.y = 66;
			return temp;
		}

		private function btn_shuoming_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_shuoming = temp;
			temp.name = "btn_shuoming";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_info;
			temp.x = 903;
			temp.y = 94;
			return temp;
		}

		private function btn_zuomo_all_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_zuomo_all = temp;
			temp.name = "btn_zuomo_all";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "一键琢磨";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 110;
			temp.x = 707;
			temp.y = 490;
			return temp;
		}

		private function btn_zuomo_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_zuomo = temp;
			temp.name = "btn_zuomo";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "琢 磨";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 88;
			temp.x = 825;
			temp.y = 490;
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
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 78;
			temp.x = 384;
			temp.y = 496;
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
			temp.width = 159;
			temp.x = 466;
			temp.y = 496;
			return temp;
		}

		private function grp_cilun_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_cilun = temp;
			temp.name = "grp_cilun";
			temp.x = 416;
			temp.y = 87;
			temp.elementsContent = [__Zuomo_Skin_UIAsset4_i()];
			return temp;
		}

		private function grp_jiacheng_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_jiacheng = temp;
			temp.name = "grp_jiacheng";
			temp.x = 427;
			temp.y = 397;
			temp.elementsContent = [__Zuomo_Skin_UIAsset5_i(),__Zuomo_Skin_UIAsset6_i(),lb_current_i(),lb_next_i(),__Zuomo_Skin_UIAsset7_i(),progressBar1_i(),progressBar2_i(),lb_pro_i(),__Zuomo_Skin_Label1_i(),__Zuomo_Skin_Label2_i(),up_title_i(),lb_baifenbi_i(),lb_up2_i(),arrow_up2_i(),lb_up1_i(),arrow_up1_i(),__Zuomo_Skin_UIAsset8_i()];
			return temp;
		}

		private function ico_zuomo_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico_zuomo = temp;
			temp.name = "ico_zuomo";
			temp.styleName = "ui/app/zhuangbei/zuomo/kuang.png";
			temp.x = 602;
			temp.y = 185;
			return temp;
		}

		private function lb_baifenbi_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_baifenbi = temp;
			temp.name = "lb_baifenbi";
			temp.text = "0%";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 25;
			temp.x = 241;
			temp.y = 64;
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
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 57;
			temp.x = 3;
			temp.y = 35;
			return temp;
		}

		private function lb_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_name = temp;
			temp.name = "lb_name";
			temp.text = "装备名字";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 123;
			temp.x = 587;
			temp.y = 283;
			return temp;
		}

		private function lb_next_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_next = temp;
			temp.name = "lb_next";
			temp.bold = true;
			temp.text = "等级2";
			temp.textAlign = "center";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 57;
			temp.x = 381;
			temp.y = 35;
			return temp;
		}

		private function lb_pro_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_pro = temp;
			temp.name = "lb_pro";
			temp.text = "333/333";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 139;
			temp.x = 152;
			temp.y = 35;
			return temp;
		}

		private function lb_up1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_up1 = temp;
			temp.name = "lb_up1";
			temp.text = "1%";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 30;
			temp.x = 458;
			temp.y = 36;
			return temp;
		}

		private function lb_up2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_up2 = temp;
			temp.name = "lb_up2";
			temp.text = "1%";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 30;
			temp.x = 283;
			temp.y = 64;
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
			temp.x = 92;
			temp.y = 35;
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
			temp.x = 92;
			temp.y = 35;
			return temp;
		}

		private function up_title_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			up_title = temp;
			temp.name = "up_title";
			temp.text = "装备基础属性提升：";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 115;
			temp.y = 64;
			return temp;
		}

		private function use1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			use1 = temp;
			temp.name = "use1";
			temp.styleName = "ui/common/grid/normal/42.png";
			temp.x = 47;
			temp.y = 0;
			return temp;
		}

		private function use2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			use2 = temp;
			temp.name = "use2";
			temp.styleName = "ui/common/grid/normal/42.png";
			temp.x = 0;
			temp.y = 89;
			return temp;
		}

		private function use3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			use3 = temp;
			temp.name = "use3";
			temp.styleName = "ui/common/grid/normal/42.png";
			temp.x = 47;
			temp.y = 178;
			return temp;
		}

		private function use4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			use4 = temp;
			temp.name = "use4";
			temp.styleName = "ui/common/grid/normal/42.png";
			temp.x = 245;
			temp.y = 0;
			return temp;
		}

		private function use5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			use5 = temp;
			temp.name = "use5";
			temp.styleName = "ui/common/grid/normal/42.png";
			temp.x = 287;
			temp.y = 89;
			return temp;
		}

		private function use6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			use6 = temp;
			temp.name = "use6";
			temp.styleName = "ui/common/grid/normal/42.png";
			temp.x = 246;
			temp.y = 178;
			return temp;
		}

		private function use_grp_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			use_grp = temp;
			temp.name = "use_grp";
			temp.x = 477;
			temp.y = 115;
			temp.elementsContent = [use1_i(),use4_i(),use3_i(),use6_i(),use2_i(),use5_i()];
			return temp;
		}

	}
}