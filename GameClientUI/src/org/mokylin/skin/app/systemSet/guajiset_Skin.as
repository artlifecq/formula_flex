package org.mokylin.skin.app.systemSet
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.ComboBox;
	import feathers.controls.Group;
	import feathers.controls.Slider;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.TextInput;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_jia;
	import org.mokylin.skin.component.button.ButtonSkin_jian;
	import org.mokylin.skin.component.button.ButtonSkin_putong;
	import org.mokylin.skin.component.check.CheckBoxSkin_1;
	import org.mokylin.skin.component.combobox.ComboBox1_Skin;
	import org.mokylin.skin.component.combobox.ComboBox2_Skin;
	import org.mokylin.skin.component.slider.skin_Slider2;
	import org.mokylin.skin.component.text.textInput3_Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class guajiset_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var btn_max:feathers.controls.Button;

		public var btn_min:feathers.controls.Button;

		public var btn_start:feathers.controls.Button;

		public var chk_cailiao:feathers.controls.Check;

		public var chk_danyao:feathers.controls.Check;

		public var chk_life:feathers.controls.Check;

		public var chk_shiqu:feathers.controls.Check;

		public var chk_type:feathers.controls.Check;

		public var chk_yaopin:feathers.controls.Check;

		public var chk_yaoping:feathers.controls.Check;

		public var chk_yinliang:feathers.controls.Check;

		public var cmb_danyao:feathers.controls.ComboBox;

		public var cmb_dengjie:feathers.controls.ComboBox;

		public var cmb_pinzhi:feathers.controls.ComboBox;

		public var cmb_zhiye:feathers.controls.ComboBox;

		public var grp_fuzhu:feathers.controls.Group;

		public var grp_guaji:feathers.controls.Group;

		public var input_life:feathers.controls.TextInput;

		public var input_txt:feathers.controls.TextInput;

		public var sld_life:feathers.controls.Slider;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function guajiset_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 482;
			this.width = 405;
			this.elementsContent = [bg_i(),__guajiset_Skin_UIAsset1_i(),grp_fuzhu_i(),grp_guaji_i(),btn_start_i(),__guajiset_Skin_Label14_i(),chk_shiqu_i(),chk_yaopin_i(),chk_yinliang_i(),chk_cailiao_i(),__guajiset_Skin_Label15_i(),__guajiset_Skin_Label16_i(),__guajiset_Skin_Label17_i(),__guajiset_Skin_Label18_i(),__guajiset_Skin_Label19_i(),__guajiset_Skin_Label20_i(),cmb_zhiye_i(),cmb_dengjie_i(),cmb_pinzhi_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __guajiset_Skin_Label10_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "挂机范围：";
			temp.color = 0xC29444;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 2;
			temp.y = 40;
			return temp;
		}

		private function __guajiset_Skin_Label11_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "攻击";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 73;
			temp.y = 40;
			return temp;
		}

		private function __guajiset_Skin_Label12_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "米范围内的怪物（仅野外有效）";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 179;
			temp.y = 40;
			return temp;
		}

		private function __guajiset_Skin_Label13_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "死亡后，自动使用复活丹复活（道具不足则无法复活）";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 29;
			temp.y = 73;
			return temp;
		}

		private function __guajiset_Skin_Label14_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "快捷键：A";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 245;
			temp.y = 458;
			return temp;
		}

		private function __guajiset_Skin_Label15_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "拾取设置：";
			temp.color = 0xC29444;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 11;
			temp.y = 283;
			return temp;
		}

		private function __guajiset_Skin_Label16_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "装备";
			temp.color = 0xC29444;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 361;
			temp.y = 319;
			return temp;
		}

		private function __guajiset_Skin_Label17_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "拾取";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 38;
			temp.y = 318;
			return temp;
		}

		private function __guajiset_Skin_Label18_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "拾取药品";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 38;
			temp.y = 356;
			return temp;
		}

		private function __guajiset_Skin_Label19_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "拾取银两";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 162;
			temp.y = 356;
			return temp;
		}

		private function __guajiset_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 16;
			temp.text = "辅助设置";
			temp.color = 0xe8c958;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __guajiset_Skin_Label20_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "拾取材料";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 280;
			temp.y = 356;
			return temp;
		}

		private function __guajiset_Skin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "（设置后自动生效）";
			temp.color = 0x8b8d7b;
			temp.x = 64;
			temp.y = 1;
			return temp;
		}

		private function __guajiset_Skin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "生命值低于";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 28;
			temp.y = 39;
			return temp;
		}

		private function __guajiset_Skin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "%自动智能吃药";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 257;
			temp.y = 40;
			return temp;
		}

		private function __guajiset_Skin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "药品耗尽时，自动购买与人物等级相符的药品";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 28;
			temp.y = 73;
			return temp;
		}

		private function __guajiset_Skin_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "自动使用背包中的";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 28;
			temp.y = 106;
			return temp;
		}

		private function __guajiset_Skin_Label7_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "经验丹";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 218;
			temp.y = 106;
			return temp;
		}

		private function __guajiset_Skin_Label8_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 16;
			temp.text = "挂机设置";
			temp.color = 0xe8c958;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 3;
			return temp;
		}

		private function __guajiset_Skin_Label9_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "（设置后自动生效）";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 65;
			temp.y = 5;
			return temp;
		}

		private function __guajiset_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/systemSet/fen.png";
			temp.x = 21;
			temp.y = 157;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 444;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 405;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btn_max_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_max = temp;
			temp.name = "btn_max";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jia;
			temp.x = 156;
			temp.y = 39;
			return temp;
		}

		private function btn_min_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_min = temp;
			temp.name = "btn_min";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jian;
			temp.x = 107;
			temp.y = 39;
			return temp;
		}

		private function btn_start_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_start = temp;
			temp.name = "btn_start";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "开始挂机";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xFFFFFF;
			temp.width = 90;
			temp.x = 157;
			temp.y = 449;
			return temp;
		}

		private function chk_cailiao_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_cailiao = temp;
			temp.name = "chk_cailiao";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 252;
			temp.y = 354;
			return temp;
		}

		private function chk_danyao_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_danyao = temp;
			temp.name = "chk_danyao";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 0;
			temp.y = 104;
			return temp;
		}

		private function chk_life_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_life = temp;
			temp.name = "chk_life";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 0;
			temp.y = 37;
			return temp;
		}

		private function chk_shiqu_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_shiqu = temp;
			temp.name = "chk_shiqu";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 10;
			temp.y = 316;
			return temp;
		}

		private function chk_type_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_type = temp;
			temp.name = "chk_type";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 1;
			temp.y = 71;
			return temp;
		}

		private function chk_yaopin_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_yaopin = temp;
			temp.name = "chk_yaopin";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 10;
			temp.y = 354;
			return temp;
		}

		private function chk_yaoping_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_yaoping = temp;
			temp.name = "chk_yaoping";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 0;
			temp.y = 71;
			return temp;
		}

		private function chk_yinliang_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_yinliang = temp;
			temp.name = "chk_yinliang";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 134;
			temp.y = 354;
			return temp;
		}

		private function cmb_danyao_i():feathers.controls.ComboBox
		{
			var temp:feathers.controls.ComboBox = new feathers.controls.ComboBox();
			cmb_danyao = temp;
			temp.name = "cmb_danyao";
			temp.height = 24;
			temp.fontSize = 14;
			temp.styleClass = org.mokylin.skin.component.combobox.ComboBox1_Skin;
			temp.textAlign = "left";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 70;
			temp.x = 146;
			temp.y = 103;
			return temp;
		}

		private function cmb_dengjie_i():feathers.controls.ComboBox
		{
			var temp:feathers.controls.ComboBox = new feathers.controls.ComboBox();
			cmb_dengjie = temp;
			temp.name = "cmb_dengjie";
			temp.styleClass = org.mokylin.skin.component.combobox.ComboBox2_Skin;
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 89;
			temp.x = 173;
			temp.y = 316;
			return temp;
		}

		private function cmb_pinzhi_i():feathers.controls.ComboBox
		{
			var temp:feathers.controls.ComboBox = new feathers.controls.ComboBox();
			cmb_pinzhi = temp;
			temp.name = "cmb_pinzhi";
			temp.styleClass = org.mokylin.skin.component.combobox.ComboBox2_Skin;
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 89;
			temp.x = 267;
			temp.y = 316;
			return temp;
		}

		private function cmb_zhiye_i():feathers.controls.ComboBox
		{
			var temp:feathers.controls.ComboBox = new feathers.controls.ComboBox();
			cmb_zhiye = temp;
			temp.name = "cmb_zhiye";
			temp.styleClass = org.mokylin.skin.component.combobox.ComboBox2_Skin;
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 89;
			temp.x = 79;
			temp.y = 316;
			return temp;
		}

		private function grp_fuzhu_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_fuzhu = temp;
			temp.name = "grp_fuzhu";
			temp.x = 9;
			temp.y = 15;
			temp.elementsContent = [__guajiset_Skin_Label1_i(),__guajiset_Skin_Label2_i(),chk_life_i(),chk_yaoping_i(),chk_danyao_i(),__guajiset_Skin_Label3_i(),__guajiset_Skin_Label4_i(),__guajiset_Skin_Label5_i(),__guajiset_Skin_Label6_i(),__guajiset_Skin_Label7_i(),sld_life_i(),cmb_danyao_i(),input_life_i()];
			return temp;
		}

		private function grp_guaji_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_guaji = temp;
			temp.name = "grp_guaji";
			temp.x = 9;
			temp.y = 175;
			temp.elementsContent = [__guajiset_Skin_Label8_i(),__guajiset_Skin_Label9_i(),__guajiset_Skin_Label10_i(),__guajiset_Skin_Label11_i(),__guajiset_Skin_Label12_i(),input_txt_i(),btn_min_i(),btn_max_i(),chk_type_i(),__guajiset_Skin_Label13_i()];
			return temp;
		}

		private function input_life_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			input_life = temp;
			temp.name = "input_life";
			temp.height = 25;
			temp.styleClass = org.mokylin.skin.component.text.textInput3_Skin;
			temp.textAlign = "center";
			temp.color = 0xD02525;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 38;
			temp.x = 217;
			temp.y = 36;
			return temp;
		}

		private function input_txt_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			input_txt = temp;
			temp.name = "input_txt";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleClass = org.mokylin.skin.component.text.textInput3_Skin;
			temp.textAlign = "center";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 36;
			temp.x = 124;
			temp.y = 37;
			return temp;
		}

		private function sld_life_i():feathers.controls.Slider
		{
			var temp:feathers.controls.Slider = new feathers.controls.Slider();
			sld_life = temp;
			temp.name = "sld_life";
			temp.height = 7;
			temp.direction = Slider.DIRECTION_HORIZONTAL
			temp.styleClass = org.mokylin.skin.component.slider.skin_Slider2;
			temp.value = 10;
			temp.width = 110;
			temp.x = 106;
			temp.y = 43;
			return temp;
		}

	}
}