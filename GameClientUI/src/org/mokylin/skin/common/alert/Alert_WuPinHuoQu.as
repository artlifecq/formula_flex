package org.mokylin.skin.common.alert
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.Radio;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.common.TongYongTanKuang_bg;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.button.ButtonSkin_jia;
	import org.mokylin.skin.component.button.ButtonSkin_jian;
	import org.mokylin.skin.component.button.ButtonSkin_putong;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.button.ButtonSkin_putongMax;
	import org.mokylin.skin.component.radio.RadioButtonSkin_1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Alert_WuPinHuoQu extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var bg0:feathers.controls.UIAsset;

		public var bizhong:feathers.controls.Group;

		public var btnClose:feathers.controls.Button;

		public var btn_chongzhi:feathers.controls.Button;

		public var btn_dianquan:feathers.controls.Radio;

		public var btn_goumai:feathers.controls.Button;

		public var btn_jia:feathers.controls.Button;

		public var btn_jian:feathers.controls.Button;

		public var btn_yuanbao:feathers.controls.Radio;

		public var gBindGold:feathers.controls.Group;

		public var gGetPath:feathers.controls.Group;

		public var gGold:feathers.controls.Group;

		public var grp_danjia:feathers.controls.Group;

		public var grp_diejia:feathers.controls.Group;

		public var itembg:feathers.controls.UIAsset;

		public var itemname:feathers.controls.Label;

		public var lab_lijin:feathers.controls.Label;

		public var lab_num:feathers.controls.Label;

		public var lab_yuanbao:feathers.controls.Label;

		public var lbBuyNum:feathers.controls.Label;

		public var lijin:feathers.controls.UIAsset;

		public var max:feathers.controls.Button;

		public var num_danjia:feathers.controls.Label;

		public var num_zuida:feathers.controls.Label;

		public var shuliang:feathers.controls.Group;

		public var yuanbao:feathers.controls.UIAsset;

		public var zongjia:feathers.controls.Group;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Alert_WuPinHuoQu()
		{
			super();
			
			this.currentState = "normal";
			this.height = 557;
			this.width = 292;
			this.elementsContent = [bg_i(),__Alert_WuPinHuoQu_UIAsset1_i(),btnClose_i(),btn_goumai_i(),btn_chongzhi_i(),zongjia_i(),bizhong_i(),shuliang_i(),__Alert_WuPinHuoQu_Group1_i(),__Alert_WuPinHuoQu_Group2_i(),gGetPath_i(),itembg_i(),grp_diejia_i(),grp_danjia_i(),itemname_i(),__Alert_WuPinHuoQu_UIAsset12_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Alert_WuPinHuoQu_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 44;
			temp.y = 47;
			temp.elementsContent = [__Alert_WuPinHuoQu_UIAsset4_i(),__Alert_WuPinHuoQu_UIAsset5_i(),__Alert_WuPinHuoQu_UIAsset6_i()];
			return temp;
		}

		private function __Alert_WuPinHuoQu_Group2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 44;
			temp.y = 386;
			temp.elementsContent = [__Alert_WuPinHuoQu_UIAsset7_i(),__Alert_WuPinHuoQu_UIAsset8_i(),__Alert_WuPinHuoQu_UIAsset9_i()];
			return temp;
		}

		private function __Alert_WuPinHuoQu_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "购买总价：";
			temp.color = 0xA3A594;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 0;
			temp.y = 5;
			return temp;
		}

		private function __Alert_WuPinHuoQu_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "使用币种：";
			temp.color = 0xA3A594;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 0;
			temp.y = 4;
			return temp;
		}

		private function __Alert_WuPinHuoQu_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 24;
			temp.text = "购买数量：";
			temp.color = 0xA3A594;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 87;
			temp.x = 0;
			temp.y = 3;
			return temp;
		}

		private function __Alert_WuPinHuoQu_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.letterSpacing = 0;
			temp.text = "最大叠加：";
			temp.color = 0xA3A594;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Alert_WuPinHuoQu_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.letterSpacing = 1;
			temp.fontSize = 14;
			temp.text = "单价：";
			temp.textAlign = "left";
			temp.color = 0xA3A594;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 0;
			temp.y = 4;
			return temp;
		}

		private function __Alert_WuPinHuoQu_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tubiao/yuanbao_24.png";
			temp.x = 41;
			temp.y = 1;
			return temp;
		}

		private function __Alert_WuPinHuoQu_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tubiao/lijin_24.png";
			temp.visible = false;
			temp.x = 40;
			temp.y = 0;
			return temp;
		}

		private function __Alert_WuPinHuoQu_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/art_txt/common/background/wupinhuoqu.png";
			temp.x = 80;
			temp.y = 7;
			return temp;
		}

		private function __Alert_WuPinHuoQu_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 518;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 280;
			temp.x = 6;
			temp.y = 33;
			return temp;
		}

		private function __Alert_WuPinHuoQu_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tubiao/yuanbao_24.png";
			temp.x = 35;
			temp.y = 0;
			return temp;
		}

		private function __Alert_WuPinHuoQu_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tubiao/lijin_24.png";
			temp.x = 35;
			temp.y = 0;
			return temp;
		}

		private function __Alert_WuPinHuoQu_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/art_txt/common/background/shangdianhuode.png";
			temp.x = 76;
			temp.y = 0;
			return temp;
		}

		private function __Alert_WuPinHuoQu_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/wenshi/huawen_1.png";
			temp.x = 0;
			temp.y = 6;
			return temp;
		}

		private function __Alert_WuPinHuoQu_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/wenshi/huawen_2.png";
			temp.x = 150;
			temp.y = 6;
			return temp;
		}

		private function __Alert_WuPinHuoQu_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/art_txt/common/background/qitalujin.png";
			temp.x = 76;
			temp.y = 0;
			return temp;
		}

		private function __Alert_WuPinHuoQu_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/wenshi/huawen_1.png";
			temp.x = 0;
			temp.y = 5;
			return temp;
		}

		private function __Alert_WuPinHuoQu_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/wenshi/huawen_2.png";
			temp.x = 150;
			temp.y = 5;
			return temp;
		}

		private function bg0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg0 = temp;
			temp.name = "bg0";
			temp.styleName = "ui/component/text/flip_bg.png";
			temp.width = 61;
			temp.x = 93;
			temp.y = 2;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 557;
			var skin:StateSkin = new org.mokylin.skin.common.TongYongTanKuang_bg()
			temp.skin = skin
			temp.width = 292;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bizhong_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			bizhong = temp;
			temp.name = "bizhong";
			temp.x = 31;
			temp.y = 205;
			temp.elementsContent = [__Alert_WuPinHuoQu_Label2_i(),gGold_i(),gBindGold_i()];
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close;
			temp.x = 256;
			temp.y = 4;
			return temp;
		}

		private function btn_chongzhi_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_chongzhi = temp;
			temp.name = "btn_chongzhi";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "充 值";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 88;
			temp.x = 162;
			temp.y = 316;
			return temp;
		}

		private function btn_dianquan_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btn_dianquan = temp;
			temp.name = "btn_dianquan";
			temp.isSelected = true;
			temp.styleClass = org.mokylin.skin.component.radio.RadioButtonSkin_1;
			temp.width = 20;
			temp.x = 0;
			temp.y = 1;
			return temp;
		}

		private function btn_goumai_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_goumai = temp;
			temp.name = "btn_goumai";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "购 买";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xEAEABC;
			temp.width = 88;
			temp.x = 44;
			temp.y = 316;
			return temp;
		}

		private function btn_jia_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_jia = temp;
			temp.name = "btn_jia";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jia;
			temp.x = 155;
			temp.y = 2;
			return temp;
		}

		private function btn_jian_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_jian = temp;
			temp.name = "btn_jian";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jian;
			temp.x = 70;
			temp.y = 2;
			return temp;
		}

		private function btn_yuanbao_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btn_yuanbao = temp;
			temp.name = "btn_yuanbao";
			temp.isSelected = true;
			temp.styleClass = org.mokylin.skin.component.radio.RadioButtonSkin_1;
			temp.width = 20;
			temp.x = 0;
			temp.y = 3;
			return temp;
		}

		private function gBindGold_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			gBindGold = temp;
			temp.name = "gBindGold";
			temp.x = 73;
			temp.y = 29;
			temp.elementsContent = [btn_dianquan_i(),__Alert_WuPinHuoQu_UIAsset3_i(),lab_lijin_i()];
			return temp;
		}

		private function gGetPath_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			gGetPath = temp;
			temp.name = "gGetPath";
			temp.height = 100;
			temp.width = 237;
			temp.x = 31;
			temp.y = 411;
			temp.elementsContent = [];
			return temp;
		}

		private function gGold_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			gGold = temp;
			temp.name = "gGold";
			temp.x = 73;
			temp.y = 0;
			temp.elementsContent = [btn_yuanbao_i(),__Alert_WuPinHuoQu_UIAsset2_i(),lab_yuanbao_i()];
			return temp;
		}

		private function grp_danjia_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_danjia = temp;
			temp.name = "grp_danjia";
			temp.x = 112;
			temp.y = 99;
			temp.elementsContent = [__Alert_WuPinHuoQu_Label5_i(),num_danjia_i(),__Alert_WuPinHuoQu_UIAsset10_i(),__Alert_WuPinHuoQu_UIAsset11_i()];
			return temp;
		}

		private function grp_diejia_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_diejia = temp;
			temp.name = "grp_diejia";
			temp.x = 112;
			temp.y = 124;
			temp.elementsContent = [__Alert_WuPinHuoQu_Label4_i(),num_zuida_i()];
			return temp;
		}

		private function itembg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			itembg = temp;
			temp.name = "itembg";
			temp.styleName = "ui/common/grid/normal/64.png";
			temp.x = 31;
			temp.y = 77;
			return temp;
		}

		private function itemname_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			itemname = temp;
			temp.name = "itemname";
			temp.text = "坐骑进阶符";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 125;
			temp.x = 111;
			temp.y = 79;
			return temp;
		}

		private function lab_lijin_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lab_lijin = temp;
			temp.name = "lab_lijin";
			temp.text = "礼金";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 66;
			temp.y = 2;
			return temp;
		}

		private function lab_num_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lab_num = temp;
			temp.name = "lab_num";
			temp.leading = 0;
			temp.fontSize = 16;
			temp.text = "198";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 105;
			temp.y = 3;
			return temp;
		}

		private function lab_yuanbao_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lab_yuanbao = temp;
			temp.name = "lab_yuanbao";
			temp.text = "元宝";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 66;
			temp.y = 4;
			return temp;
		}

		private function lbBuyNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbBuyNum = temp;
			temp.name = "lbBuyNum";
			temp.text = "1000";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 57;
			temp.x = 94;
			temp.y = 5;
			return temp;
		}

		private function lijin_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			lijin = temp;
			temp.name = "lijin";
			temp.styleName = "ui/common/tubiao/lijin_24.png";
			temp.x = 71;
			temp.y = 0;
			return temp;
		}

		private function max_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			max = temp;
			temp.name = "max";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.leading = 01;
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putongMax;
			temp.color = 0xCFC6AE;
			temp.x = 178;
			temp.y = 2;
			return temp;
		}

		private function num_danjia_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			num_danjia = temp;
			temp.name = "num_danjia";
			temp.text = "10";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 61;
			temp.x = 65;
			temp.y = 4;
			return temp;
		}

		private function num_zuida_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			num_zuida = temp;
			temp.name = "num_zuida";
			temp.text = "999";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 69;
			temp.y = 0;
			return temp;
		}

		private function shuliang_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			shuliang = temp;
			temp.name = "shuliang";
			temp.x = 31;
			temp.y = 169;
			temp.elementsContent = [max_i(),__Alert_WuPinHuoQu_Label3_i(),btn_jian_i(),btn_jia_i(),bg0_i(),lbBuyNum_i()];
			return temp;
		}

		private function yuanbao_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			yuanbao = temp;
			temp.name = "yuanbao";
			temp.styleName = "ui/common/tubiao/yuanbao_24.png";
			temp.x = 71;
			temp.y = 0;
			return temp;
		}

		private function zongjia_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			zongjia = temp;
			temp.name = "zongjia";
			temp.x = 31;
			temp.y = 259;
			temp.elementsContent = [__Alert_WuPinHuoQu_Label1_i(),lijin_i(),yuanbao_i(),lab_num_i()];
			return temp;
		}

	}
}