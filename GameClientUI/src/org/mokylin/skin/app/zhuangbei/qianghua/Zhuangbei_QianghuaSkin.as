package org.mokylin.skin.app.zhuangbei.qianghua
{
	import feathers.controls.text.Fontter;
	import feathers.data.ListCollection;
	import feathers.controls.Button;
	import feathers.controls.ComboBox;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.ProgressBar;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.UIAsset;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.app.zhuangbei.Zhuangbei_left;
	import org.mokylin.skin.app.zhuangbei.qianghua.Shuxing2_Skin;
	import org.mokylin.skin.app.zhuangbei.qianghua.Shuxing_Skin;
	import org.mokylin.skin.app.zhuangbei.qianghua.button.ButtonShuoming;
	import org.mokylin.skin.app.zhuangbei.qianghua.button.ButtonYijianqianghua;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.combobox.ComboBox1_Skin;
	import org.mokylin.skin.component.combobox.ComboBox2_Skin;
	import org.mokylin.skin.component.progress.pro_jindu_Skin;

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
		public var arrow_up:feathers.controls.UIAsset;

		public var btn_qianghua_all:feathers.controls.Button;

		public var btn_qianhua:feathers.controls.Button;

		public var btn_shuoming:feathers.controls.Button;

		public var cmb_dengjie:feathers.controls.ComboBox;

		public var cmb_pinzhi:feathers.controls.ComboBox;

		public var lb_current:feathers.controls.Label;

		public var lb_dengji:feathers.controls.Label;

		public var lb_name:feathers.controls.Label;

		public var lb_name0:feathers.controls.Label;

		public var lb_num:feathers.controls.Label;

		public var lb_num0:feathers.controls.Label;

		public var lb_num1:feathers.controls.Label;

		public var lb_up:feathers.controls.Label;

		public var lb_yinzi:feathers.controls.Label;

		public var left:feathers.controls.SkinnableContainer;

		public var list1:feathers.controls.List;

		public var list2:feathers.controls.List;

		public var tab_pack:feathers.controls.TabBar;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Zhuangbei_QianghuaSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 587;
			this.width = 947;
			this.elementsContent = [__Zhuangbei_QianghuaSkin_UIAsset1_i(),__Zhuangbei_QianghuaSkin_UIAsset2_i(),left_i(),__Zhuangbei_QianghuaSkin_UIAsset6_i(),__Zhuangbei_QianghuaSkin_Label2_i(),btn_shuoming_i(),lb_dengji_i(),__Zhuangbei_QianghuaSkin_Label3_i(),__Zhuangbei_QianghuaSkin_Group1_i(),__Zhuangbei_QianghuaSkin_Label4_i(),__Zhuangbei_QianghuaSkin_UIAsset13_i(),lb_current_i(),lb_up_i(),__Zhuangbei_QianghuaSkin_SkinnableContainer3_i(),__Zhuangbei_QianghuaSkin_SkinnableContainer4_i(),__Zhuangbei_QianghuaSkin_SkinnableContainer5_i(),__Zhuangbei_QianghuaSkin_SkinnableContainer6_i(),__Zhuangbei_QianghuaSkin_ProgressBar1_i(),btn_qianhua_i(),cmb_pinzhi_i(),cmb_dengjie_i(),btn_qianghua_all_i(),__Zhuangbei_QianghuaSkin_UIAsset14_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Zhuangbei_QianghuaSkin_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 446;
			temp.y = 255;
			temp.elementsContent = [__Zhuangbei_QianghuaSkin_UIAsset7_i(),__Zhuangbei_QianghuaSkin_UIAsset8_i(),__Zhuangbei_QianghuaSkin_UIAsset9_i(),__Zhuangbei_QianghuaSkin_UIAsset10_i(),__Zhuangbei_QianghuaSkin_UIAsset11_i(),__Zhuangbei_QianghuaSkin_UIAsset12_i()];
			return temp;
		}

		private function __Zhuangbei_QianghuaSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "装备名字";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 619;
			temp.y = 84;
			return temp;
		}

		private function __Zhuangbei_QianghuaSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 12;
			temp.text = "请放入强化材料";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 484;
			temp.y = 234;
			return temp;
		}

		private function __Zhuangbei_QianghuaSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 12;
			temp.text = "(强化成功后消耗材料将会消失，请慎重选择）";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 576;
			temp.y = 233;
			return temp;
		}

		private function __Zhuangbei_QianghuaSkin_ProgressBar1_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			temp.styleClass = org.mokylin.skin.component.progress.pro_jindu_Skin;
			temp.x = 536;
			temp.y = 343;
			return temp;
		}

		private function __Zhuangbei_QianghuaSkin_SkinnableContainer3_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.app.zhuangbei.qianghua.Shuxing_Skin()
			temp.skin = skin
			temp.width = 57;
			temp.x = 476;
			temp.y = 370;
			return temp;
		}

		private function __Zhuangbei_QianghuaSkin_SkinnableContainer4_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.app.zhuangbei.qianghua.Shuxing2_Skin()
			temp.skin = skin
			temp.width = 90;
			temp.x = 798;
			temp.y = 370;
			return temp;
		}

		private function __Zhuangbei_QianghuaSkin_SkinnableContainer5_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.app.zhuangbei.qianghua.Shuxing_Skin()
			temp.skin = skin
			temp.width = 57;
			temp.x = 476;
			temp.y = 390;
			return temp;
		}

		private function __Zhuangbei_QianghuaSkin_SkinnableContainer6_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.app.zhuangbei.qianghua.Shuxing2_Skin()
			temp.skin = skin
			temp.width = 90;
			temp.x = 798;
			temp.y = 390;
			return temp;
		}

		private function __Zhuangbei_QianghuaSkin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhuangbei/qianghua/xiaodaojukuang.png";
			temp.x = 212;
			temp.y = 0;
			return temp;
		}

		private function __Zhuangbei_QianghuaSkin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhuangbei/qianghua/xiaodaojukuang.png";
			temp.x = 283;
			temp.y = 0;
			return temp;
		}

		private function __Zhuangbei_QianghuaSkin_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhuangbei/qianghua/xiaodaojukuang.png";
			temp.x = 354;
			temp.y = 0;
			return temp;
		}

		private function __Zhuangbei_QianghuaSkin_UIAsset13_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhuangbei/qianghua/qianghuajiacheng.png";
			temp.x = 400;
			temp.y = 329;
			return temp;
		}

		private function __Zhuangbei_QianghuaSkin_UIAsset14_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhuangbei/qianghua/titile.png";
			temp.x = 447;
			temp.y = 13;
			return temp;
		}

		private function __Zhuangbei_QianghuaSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 453;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 922;
			temp.x = 14;
			temp.y = 69;
			return temp;
		}

		private function __Zhuangbei_QianghuaSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 445;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 350;
			temp.x = 19;
			temp.y = 73;
			return temp;
		}

		private function __Zhuangbei_QianghuaSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhuangbei/qianghua/bg.jpg";
			temp.x = 371;
			temp.y = 75;
			return temp;
		}

		private function __Zhuangbei_QianghuaSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhuangbei/qianghua/xiaodaojukuang.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Zhuangbei_QianghuaSkin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhuangbei/qianghua/xiaodaojukuang.png";
			temp.x = 71;
			temp.y = 0;
			return temp;
		}

		private function __Zhuangbei_QianghuaSkin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhuangbei/qianghua/xiaodaojukuang.png";
			temp.x = 142;
			temp.y = 0;
			return temp;
		}

		private function btn_qianghua_all_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_qianghua_all = temp;
			temp.name = "btn_qianghua_all";
			temp.styleClass = org.mokylin.skin.app.zhuangbei.qianghua.button.ButtonYijianqianghua;
			temp.x = 589;
			temp.y = 476;
			return temp;
		}

		private function btn_qianhua_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_qianhua = temp;
			temp.name = "btn_qianhua";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "强化";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xCFC6AE;
			temp.x = 631;
			temp.y = 389;
			return temp;
		}

		private function btn_shuoming_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_shuoming = temp;
			temp.name = "btn_shuoming";
			temp.styleClass = org.mokylin.skin.app.zhuangbei.qianghua.button.ButtonShuoming;
			temp.x = 834;
			temp.y = 79;
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
			temp.x = 535;
			temp.y = 442;
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
			temp.width = 171;
			temp.x = 605;
			temp.y = 442;
			return temp;
		}

		private function lb_current_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_current = temp;
			temp.name = "lb_current";
			temp.bold = true;
			temp.text = "等级1";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 48;
			temp.x = 479;
			temp.y = 351;
			return temp;
		}

		private function lb_dengji_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_dengji = temp;
			temp.name = "lb_dengji";
			temp.htmlText = "最大强化等级：<font color='#CFC6AE'>30/30</font>";
			temp.text = "标签";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 782;
			temp.y = 105;
			return temp;
		}

		private function lb_up_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_up = temp;
			temp.name = "lb_up";
			temp.bold = true;
			temp.text = "等级2";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 48;
			temp.x = 799;
			temp.y = 351;
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

	}
}