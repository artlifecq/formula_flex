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
	import org.mokylin.skin.app.zhuangbei.zuomo.button.ButtonZhuomo;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.button.ButtonSkin_shuoming;
	import org.mokylin.skin.component.combobox.ComboBox1_Skin;
	import org.mokylin.skin.component.combobox.ComboBox2_Skin;
	import org.mokylin.skin.component.progress.pro_jindu_Skin;

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
		public var arrow_up2:feathers.controls.UIAsset;

		public var btn_shuoming:feathers.controls.Button;

		public var btn_zuomo:feathers.controls.Button;

		public var btn_zuomo_all:feathers.controls.Button;

		public var cmb_dengjie:feathers.controls.ComboBox;

		public var cmb_pinzhi:feathers.controls.ComboBox;

		public var grp_jiacheng:feathers.controls.Group;

		public var lb_baifenbi:feathers.controls.Label;

		public var lb_current:feathers.controls.Label;

		public var lb_dengji:feathers.controls.Label;

		public var lb_name:feathers.controls.Label;

		public var lb_next:feathers.controls.Label;

		public var lb_pro:feathers.controls.Label;

		public var lb_up2:feathers.controls.Label;

		public var left:feathers.controls.SkinnableContainer;

		public var progressBar:feathers.controls.ProgressBar;

		public var up_title:feathers.controls.Label;

		public var use0:feathers.controls.UIAsset;

		public var use1:feathers.controls.UIAsset;

		public var use2:feathers.controls.UIAsset;

		public var use3:feathers.controls.UIAsset;

		public var use4:feathers.controls.UIAsset;

		public var use5:feathers.controls.UIAsset;

		public var use_grp:feathers.controls.Group;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Zuomo_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 587;
			this.width = 947;
			this.elementsContent = [left_i(),__Zuomo_Skin_UIAsset3_i(),btn_shuoming_i(),lb_name_i(),btn_zuomo_i(),use_grp_i(),grp_jiacheng_i(),cmb_pinzhi_i(),cmb_dengjie_i(),btn_zuomo_all_i(),__Zuomo_Skin_Label3_i(),__Zuomo_Skin_Label4_i(),__Zuomo_Skin_UIAsset8_i(),lb_dengji_i()];
			
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
			temp.x = 53;
			temp.y = 59;
			return temp;
		}

		private function __Zuomo_Skin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "琢磨后等级";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 384;
			temp.y = 59;
			return temp;
		}

		private function __Zuomo_Skin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 12;
			temp.text = "请放入消耗材料";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 484;
			temp.y = 346;
			return temp;
		}

		private function __Zuomo_Skin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 12;
			temp.text = "(琢磨成功后消耗材料将会消失，请慎重选择）";
			temp.color = 0xD02525;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 576;
			temp.y = 346;
			return temp;
		}

		private function __Zuomo_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhuangbei/zuomo/bg.jpg";
			temp.x = 371;
			temp.y = 75;
			return temp;
		}

		private function __Zuomo_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhuangbei/qianghua/dengjidikuang.png";
			temp.x = 54;
			temp.y = 29;
			return temp;
		}

		private function __Zuomo_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhuangbei/qianghua/dengjidikuang.png";
			temp.x = 388;
			temp.y = 29;
			return temp;
		}

		private function __Zuomo_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/progress/skin_jindu/thumb.png";
			temp.x = 120;
			temp.y = 23;
			return temp;
		}

		private function __Zuomo_Skin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhuangbei/zuomo/jiacheng.png";
			temp.x = 209;
			temp.y = 0;
			return temp;
		}

		private function __Zuomo_Skin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/dianweixiaoguotu/app/zhuangbei/zuomo.jpg";
			temp.visible = false;
			temp.x = 0;
			temp.y = 3;
			return temp;
		}

		private function arrow_up2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			arrow_up2 = temp;
			temp.name = "arrow_up2";
			temp.styleName = "ui/common/tubiao/tu_up.png";
			temp.x = 267;
			temp.y = 61;
			return temp;
		}

		private function btn_shuoming_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_shuoming = temp;
			temp.name = "btn_shuoming";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_shuoming;
			temp.x = 834;
			temp.y = 83;
			return temp;
		}

		private function btn_zuomo_all_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_zuomo_all = temp;
			temp.name = "btn_zuomo_all";
			temp.styleClass = org.mokylin.skin.app.zhuangbei.zuomo.button.ButtonZhuomo;
			temp.x = 732;
			temp.y = 472;
			return temp;
		}

		private function btn_zuomo_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_zuomo = temp;
			temp.name = "btn_zuomo";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "琢 磨";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xE1D4A9;
			temp.width = 77;
			temp.x = 607;
			temp.y = 264;
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
			temp.width = 70;
			temp.x = 462;
			temp.y = 475;
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
			temp.width = 155;
			temp.x = 534;
			temp.y = 475;
			return temp;
		}

		private function grp_jiacheng_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_jiacheng = temp;
			temp.name = "grp_jiacheng";
			temp.x = 401;
			temp.y = 377;
			temp.elementsContent = [__Zuomo_Skin_UIAsset4_i(),__Zuomo_Skin_UIAsset5_i(),lb_current_i(),lb_next_i(),__Zuomo_Skin_UIAsset6_i(),progressBar_i(),lb_pro_i(),__Zuomo_Skin_Label1_i(),__Zuomo_Skin_Label2_i(),up_title_i(),lb_baifenbi_i(),lb_up2_i(),arrow_up2_i(),__Zuomo_Skin_UIAsset7_i()];
			return temp;
		}

		private function lb_baifenbi_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_baifenbi = temp;
			temp.name = "lb_baifenbi";
			temp.text = "0%";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 22;
			temp.x = 243;
			temp.y = 59;
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
			temp.width = 53;
			temp.x = 57;
			temp.y = 32;
			return temp;
		}

		private function lb_dengji_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_dengji = temp;
			temp.name = "lb_dengji";
			temp.height = 26;
			temp.text = "琢磨等级：1234";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 113;
			temp.x = 813;
			temp.y = 113;
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
			temp.x = 584;
			temp.y = 144;
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
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 53;
			temp.x = 391;
			temp.y = 31;
			return temp;
		}

		private function lb_pro_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_pro = temp;
			temp.name = "lb_pro";
			temp.text = "333/333";
			temp.textAlign = "center";
			temp.color = 0xDFB01F;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 139;
			temp.x = 184;
			temp.y = 32;
			return temp;
		}

		private function lb_up2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_up2 = temp;
			temp.name = "lb_up2";
			temp.text = "1%";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 282;
			temp.y = 59;
			return temp;
		}

		private function left_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			left = temp;
			temp.name = "left";
			temp.height = 431;
			var skin:StateSkin = new org.mokylin.skin.app.zhuangbei.Zhuangbei_left()
			temp.skin = skin
			temp.width = 340;
			temp.x = 23;
			temp.y = 79;
			return temp;
		}

		private function progressBar_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			progressBar = temp;
			temp.name = "progressBar";
			temp.height = 14;
			temp.styleClass = org.mokylin.skin.component.progress.pro_jindu_Skin;
			temp.value = 100;
			temp.width = 209;
			temp.x = 147;
			temp.y = 34;
			return temp;
		}

		private function up_title_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			up_title = temp;
			temp.name = "up_title";
			temp.text = "装备属性提升：";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 145;
			temp.y = 59;
			return temp;
		}

		private function use0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			use0 = temp;
			temp.name = "use0";
			temp.styleName = "ui/app/zhuangbei/zuomo/daojukuang.png";
			temp.x = 52;
			temp.y = 0;
			return temp;
		}

		private function use1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			use1 = temp;
			temp.name = "use1";
			temp.styleName = "ui/app/zhuangbei/zuomo/daojukuang.png";
			temp.x = 201;
			temp.y = 0;
			return temp;
		}

		private function use2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			use2 = temp;
			temp.name = "use2";
			temp.styleName = "ui/app/zhuangbei/zuomo/daojukuang.png";
			temp.x = 253;
			temp.y = 101;
			return temp;
		}

		private function use3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			use3 = temp;
			temp.name = "use3";
			temp.styleName = "ui/app/zhuangbei/zuomo/daojukuang.png";
			temp.x = 201;
			temp.y = 202;
			return temp;
		}

		private function use4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			use4 = temp;
			temp.name = "use4";
			temp.styleName = "ui/app/zhuangbei/zuomo/daojukuang.png";
			temp.x = 52;
			temp.y = 202;
			return temp;
		}

		private function use5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			use5 = temp;
			temp.name = "use5";
			temp.styleName = "ui/app/zhuangbei/zuomo/daojukuang.png";
			temp.x = 0;
			temp.y = 101;
			return temp;
		}

		private function use_grp_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			use_grp = temp;
			temp.name = "use_grp";
			temp.x = 490;
			temp.y = 80;
			temp.elementsContent = [use0_i(),use1_i(),use4_i(),use3_i(),use5_i(),use2_i()];
			return temp;
		}

	}
}