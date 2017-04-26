package org.mokylin.skin.app.zuoqi
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.Radio;
	import feathers.controls.StateSkin;
	import feathers.controls.TextInput;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.button.ButtonSkin_jia;
	import org.mokylin.skin.component.button.ButtonSkin_jian;
	import org.mokylin.skin.component.button.ButtonSkin_putong;
	import org.mokylin.skin.component.button.ButtonSkin_putong3;
	import org.mokylin.skin.component.radio.RadioButtonSkin_1;
	import org.mokylin.skin.component.text.textInput3_Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class huoquSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var benfuqianwang:feathers.controls.Button;

		public var benfuzudui:feathers.controls.Label;

		public var bg:feathers.controls.UIAsset;

		public var bizhong:feathers.controls.Group;

		public var bossqianwang:feathers.controls.Button;

		public var btnClose:feathers.controls.Button;

		public var btn_chongzhi:feathers.controls.Button;

		public var btn_dianquan:feathers.controls.Radio;

		public var btn_goumai:feathers.controls.Button;

		public var btn_jia:feathers.controls.Button;

		public var btn_jian:feathers.controls.Button;

		public var btn_yuanbao:feathers.controls.Radio;

		public var grp_danjia:feathers.controls.Group;

		public var grp_diejia:feathers.controls.Group;

		public var input_txt:feathers.controls.TextInput;

		public var kuafuqianwang:feathers.controls.Button;

		public var kuafuzudui:feathers.controls.Label;

		public var lab_num:feathers.controls.Label;

		public var lijin:feathers.controls.UIAsset;

		public var max:feathers.controls.Button;

		public var num_danjia:feathers.controls.Label;

		public var num_zuida:feathers.controls.Label;

		public var shijieboss:feathers.controls.Label;

		public var shuliang:feathers.controls.Group;

		public var titleDisplay:feathers.controls.Label;

		public var yuanbao:feathers.controls.UIAsset;

		public var zongjia:feathers.controls.Group;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function huoquSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [bg_i(),__huoquSkin_UIAsset1_i(),btnClose_i(),btn_goumai_i(),btn_chongzhi_i(),zongjia_i(),bizhong_i(),shuliang_i(),__huoquSkin_UIAsset4_i(),benfuzudui_i(),benfuqianwang_i(),kuafuzudui_i(),kuafuqianwang_i(),shijieboss_i(),bossqianwang_i(),titleDisplay_i(),__huoquSkin_UIAsset5_i(),grp_diejia_i(),grp_danjia_i(),__huoquSkin_Label6_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __huoquSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "购买总价：";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 0;
			temp.y = 5;
			return temp;
		}

		private function __huoquSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "使用币种：";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 0;
			temp.y = 4;
			return temp;
		}

		private function __huoquSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 24;
			temp.text = "购买数量：";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 87;
			temp.x = 0;
			temp.y = 3;
			return temp;
		}

		private function __huoquSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.letterSpacing = 0;
			temp.text = "最大叠加：";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __huoquSkin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.letterSpacing = 1;
			temp.fontSize = 14;
			temp.text = "单价：";
			temp.textAlign = "left";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 0;
			temp.y = 4;
			return temp;
		}

		private function __huoquSkin_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "坐骑进阶符";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 133;
			temp.y = 77;
			return temp;
		}

		private function __huoquSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zuoqi/qitalujing.png";
			temp.x = 82;
			temp.y = 385;
			return temp;
		}

		private function __huoquSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tubiao/yuanbao_24.png";
			temp.x = 108;
			temp.y = 0;
			return temp;
		}

		private function __huoquSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tubiao/lijin_24.png";
			temp.x = 108;
			temp.y = 29;
			return temp;
		}

		private function __huoquSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zuoqi/shangdianhuode.png";
			temp.x = 82;
			temp.y = 49;
			return temp;
		}

		private function __huoquSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/60.png";
			temp.x = 49;
			temp.y = 74;
			return temp;
		}

		private function __huoquSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tubiao/yuanbao_24.png";
			temp.x = 41;
			temp.y = 1;
			return temp;
		}

		private function __huoquSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tubiao/lijin_24.png";
			temp.visible = false;
			temp.x = 40;
			temp.y = 0;
			return temp;
		}

		private function benfuqianwang_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			benfuqianwang = temp;
			temp.name = "benfuqianwang";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "前往";
			temp.leading = 1;
			temp.fontSize = 14;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong3;
			temp.color = 0xCFC6AE;
			temp.width = 61;
			temp.x = 228;
			temp.y = 413;
			return temp;
		}

		private function benfuzudui_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			benfuzudui = temp;
			temp.name = "benfuzudui";
			temp.text = "本服组队副本";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.x = 53;
			temp.y = 416;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 559;
			temp.styleName = "ui/common/background/erji_kuang.png";
			temp.width = 337;
			temp.x = 1;
			temp.y = 2;
			return temp;
		}

		private function bizhong_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			bizhong = temp;
			temp.name = "bizhong";
			temp.x = 53;
			temp.y = 207;
			temp.elementsContent = [__huoquSkin_Label2_i(),btn_yuanbao_i(),btn_dianquan_i(),__huoquSkin_UIAsset2_i(),__huoquSkin_UIAsset3_i()];
			return temp;
		}

		private function bossqianwang_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			bossqianwang = temp;
			temp.name = "bossqianwang";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "前往";
			temp.leading = 1;
			temp.fontSize = 14;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong3;
			temp.color = 0xCFC6AE;
			temp.width = 61;
			temp.x = 228;
			temp.y = 465;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close;
			temp.x = 303;
			temp.y = 9;
			return temp;
		}

		private function btn_chongzhi_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_chongzhi = temp;
			temp.name = "btn_chongzhi";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "充 值";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xE1D4A9;
			temp.width = 95;
			temp.x = 199;
			temp.y = 318;
			return temp;
		}

		private function btn_dianquan_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btn_dianquan = temp;
			temp.name = "btn_dianquan";
			temp.label = " 礼金";
			temp.isSelected = true;
			temp.styleClass = org.mokylin.skin.component.radio.RadioButtonSkin_1;
			temp.x = 73;
			temp.y = 30;
			return temp;
		}

		private function btn_goumai_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_goumai = temp;
			temp.name = "btn_goumai";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "购 买";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xE1D4A9;
			temp.width = 95;
			temp.x = 51;
			temp.y = 318;
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
			temp.label = " 元宝";
			temp.isSelected = true;
			temp.styleClass = org.mokylin.skin.component.radio.RadioButtonSkin_1;
			temp.x = 73;
			temp.y = 3;
			return temp;
		}

		private function grp_danjia_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_danjia = temp;
			temp.name = "grp_danjia";
			temp.x = 134;
			temp.y = 97;
			temp.elementsContent = [__huoquSkin_Label5_i(),num_danjia_i(),__huoquSkin_UIAsset6_i(),__huoquSkin_UIAsset7_i()];
			return temp;
		}

		private function grp_diejia_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_diejia = temp;
			temp.name = "grp_diejia";
			temp.x = 134;
			temp.y = 122;
			temp.elementsContent = [__huoquSkin_Label4_i(),num_zuida_i()];
			return temp;
		}

		private function input_txt_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			input_txt = temp;
			temp.name = "input_txt";
			temp.styleClass = org.mokylin.skin.component.text.textInput3_Skin;
			temp.textAlign = "center";
			temp.width = 76;
			temp.x = 85;
			temp.y = 0;
			return temp;
		}

		private function kuafuqianwang_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			kuafuqianwang = temp;
			temp.name = "kuafuqianwang";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "前往";
			temp.leading = 1;
			temp.fontSize = 14;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong3;
			temp.color = 0xCFC6AE;
			temp.width = 61;
			temp.x = 228;
			temp.y = 439;
			return temp;
		}

		private function kuafuzudui_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			kuafuzudui = temp;
			temp.name = "kuafuzudui";
			temp.text = "跨服组队副本";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.x = 53;
			temp.y = 443;
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
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.x = 105;
			temp.y = 3;
			return temp;
		}

		private function lijin_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			lijin = temp;
			temp.name = "lijin";
			temp.styleName = "ui/common/tubiao/lijin_24.png";
			temp.visible = false;
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
			temp.label = "MAX";
			temp.leading = 01;
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong3;
			temp.color = 0xCFC6AE;
			temp.width = 61;
			temp.x = 175;
			temp.y = 1;
			return temp;
		}

		private function num_danjia_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			num_danjia = temp;
			temp.name = "num_danjia";
			temp.text = "10";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
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
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 69;
			temp.y = 0;
			return temp;
		}

		private function shijieboss_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			shijieboss = temp;
			temp.name = "shijieboss";
			temp.text = "世界BOSS礼包";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.x = 53;
			temp.y = 470;
			return temp;
		}

		private function shuliang_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			shuliang = temp;
			temp.name = "shuliang";
			temp.x = 53;
			temp.y = 171;
			temp.elementsContent = [input_txt_i(),btn_jian_i(),btn_jia_i(),__huoquSkin_Label3_i(),max_i()];
			return temp;
		}

		private function titleDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			titleDisplay = temp;
			temp.name = "titleDisplay";
			temp.bold = true;
			temp.height = 26;
			temp.fontSize = 16;
			temp.text = "物品获取建议";
			temp.textAlign = "center";
			temp.color = 0xB8AD80;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 119;
			temp.x = 119;
			temp.y = 13;
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
			temp.x = 53;
			temp.y = 261;
			temp.elementsContent = [__huoquSkin_Label1_i(),lijin_i(),yuanbao_i(),lab_num_i()];
			return temp;
		}

	}
}