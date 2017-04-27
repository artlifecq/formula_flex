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
	import org.mokylin.skin.app.zhuangbei.qianghua.button.ButtonYijianqianghua;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.button.ButtonSkin_shuoming;
	import org.mokylin.skin.component.combobox.ComboBox1_Skin;
	import org.mokylin.skin.component.combobox.ComboBox2_Skin;
	import org.mokylin.skin.component.list.ListSkin1;
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

		public var equip_name:feathers.controls.Label;

		public var grp_pro:feathers.controls.Group;

		public var lb_current:feathers.controls.Label;

		public var lb_dengji:feathers.controls.Label;

		public var lb_name:feathers.controls.Label;

		public var lb_name0:feathers.controls.Label;

		public var lb_num:feathers.controls.Label;

		public var lb_num0:feathers.controls.Label;

		public var lb_num1:feathers.controls.Label;

		public var lb_pro:feathers.controls.Label;

		public var lb_up:feathers.controls.Label;

		public var lb_yinzi:feathers.controls.Label;

		public var left:feathers.controls.SkinnableContainer;

		public var list1:feathers.controls.List;

		public var list2:feathers.controls.List;

		public var progressBar:feathers.controls.ProgressBar;

		public var tab_pack:feathers.controls.TabBar;

		public var up0:feathers.controls.SkinnableContainer;

		public var up1:feathers.controls.SkinnableContainer;

		public var up2:feathers.controls.SkinnableContainer;

		public var up3:feathers.controls.SkinnableContainer;

		public var use_list:feathers.controls.List;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Zhuangbei_QianghuaSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 587;
			this.width = 947;
			this.elementsContent = [left_i(),__Zhuangbei_QianghuaSkin_UIAsset6_i(),equip_name_i(),btn_shuoming_i(),lb_dengji_i(),__Zhuangbei_QianghuaSkin_Label2_i(),__Zhuangbei_QianghuaSkin_Label3_i(),__Zhuangbei_QianghuaSkin_UIAsset7_i(),up0_i(),up1_i(),up2_i(),up3_i(),btn_qianhua_i(),cmb_pinzhi_i(),cmb_dengjie_i(),btn_qianghua_all_i(),use_list_i(),grp_pro_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Zhuangbei_QianghuaSkin_HorizontalLayout2_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 15;
			temp.horizontalAlign = "center";
			return temp;
		}

		private function __Zhuangbei_QianghuaSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 12;
			temp.text = "请放入强化材料";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 484;
			temp.y = 351;
			return temp;
		}

		private function __Zhuangbei_QianghuaSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 12;
			temp.text = "(强化成功后消耗材料将会消失，请慎重选择）";
			temp.color = 0xD02525;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 576;
			temp.y = 351;
			return temp;
		}

		private function __Zhuangbei_QianghuaSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.height = 18;
			temp.fontSize = 12;
			temp.text = "当前等级";
			temp.textAlign = "left";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 58;
			temp.x = 0;
			temp.y = 34;
			return temp;
		}

		private function __Zhuangbei_QianghuaSkin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.height = 18;
			temp.fontSize = 12;
			temp.text = "强化后等级";
			temp.textAlign = "left";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 71;
			temp.x = 316;
			temp.y = 34;
			return temp;
		}

		private function __Zhuangbei_QianghuaSkin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhuangbei/qianghua/dengjidikuang.png";
			temp.x = 0;
			temp.y = 6;
			return temp;
		}

		private function __Zhuangbei_QianghuaSkin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhuangbei/qianghua/dengjidikuang.png";
			temp.x = 322;
			temp.y = 6;
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
			temp.styleName = "ui/app/zhuangbei/qianghua/dangqianqianghua.png";
			temp.x = 606;
			temp.y = 390;
			return temp;
		}

		private function __Zhuangbei_QianghuaSkin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/progress/skin_jindu/thumb.png";
			temp.x = 54;
			temp.y = -1;
			return temp;
		}

		private function btn_qianghua_all_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_qianghua_all = temp;
			temp.name = "btn_qianghua_all";
			temp.styleClass = org.mokylin.skin.app.zhuangbei.qianghua.button.ButtonYijianqianghua;
			temp.x = 675;
			temp.y = 474;
			return temp;
		}

		private function btn_qianhua_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_qianhua = temp;
			temp.name = "btn_qianhua";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "强 化";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xE1D4A9;
			temp.x = 811;
			temp.y = 474;
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
			temp.x = 413;
			temp.y = 479;
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
			temp.x = 485;
			temp.y = 479;
			return temp;
		}

		private function equip_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			equip_name = temp;
			temp.name = "equip_name";
			temp.text = "装备名字";
			temp.textAlign = "center";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 138;
			temp.x = 583;
			temp.y = 84;
			return temp;
		}

		private function grp_pro_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_pro = temp;
			temp.name = "grp_pro";
			temp.x = 471;
			temp.y = 228;
			temp.elementsContent = [__Zhuangbei_QianghuaSkin_UIAsset9_i(),__Zhuangbei_QianghuaSkin_UIAsset10_i(),__Zhuangbei_QianghuaSkin_UIAsset11_i(),lb_current_i(),__Zhuangbei_QianghuaSkin_Label4_i(),__Zhuangbei_QianghuaSkin_Label5_i(),lb_up_i(),progressBar_i(),lb_pro_i()];
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
			temp.width = 54;
			temp.x = 0;
			temp.y = 9;
			return temp;
		}

		private function lb_dengji_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_dengji = temp;
			temp.name = "lb_dengji";
			temp.height = 20;
			temp.htmlText = "最大强化等级：<font color='#CFC6AE'>30/30</font>";
			temp.textAlign = "right";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 146;
			temp.x = 775;
			temp.y = 111;
			return temp;
		}

		private function lb_pro_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_pro = temp;
			temp.name = "lb_pro";
			temp.text = "(100/200)";
			temp.textAlign = "center";
			temp.color = 0xDFB01F;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 172;
			temp.x = 101;
			temp.y = 8;
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
			temp.width = 54;
			temp.x = 323;
			temp.y = 9;
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
			temp.maximum = 100;
			temp.minimum = 0;
			temp.styleClass = org.mokylin.skin.component.progress.pro_jindu_Skin;
			temp.value = 40;
			temp.width = 209;
			temp.x = 81;
			temp.y = 10;
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
			temp.x = 476;
			temp.y = 419;
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
			temp.x = 740;
			temp.y = 418;
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
			temp.x = 476;
			temp.y = 439;
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
			temp.x = 740;
			temp.y = 438;
			return temp;
		}

		private function use_list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			use_list = temp;
			temp.name = "use_list";
			temp.height = 60;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 433;
			temp.x = 438;
			temp.y = 286;
			temp.layout = __Zhuangbei_QianghuaSkin_HorizontalLayout2_i();
			return temp;
		}

	}
}