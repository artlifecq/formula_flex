package org.mokylin.skin.app.systemSet
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.ComboBox;
	import feathers.controls.Group;
	import feathers.controls.Slider;
	import feathers.controls.Label;
	import feathers.controls.Radio;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_putong;
	import org.mokylin.skin.component.check.CheckBoxSkin_1;
	import org.mokylin.skin.component.combobox.ComboBox1_Skin;
	import org.mokylin.skin.component.radio.RadioButtonSkin_1;
	import org.mokylin.skin.component.slider.skin_Slider2;

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
		public var btn_start:feathers.controls.Button;

		public var chk_danyao:feathers.controls.Check;

		public var chk_fanji:feathers.controls.Check;

		public var chk_fuhuo:feathers.controls.Check;

		public var chk_life:feathers.controls.Check;

		public var chk_neili:feathers.controls.Check;

		public var chk_type:feathers.controls.Check;

		public var chk_yaoping:feathers.controls.Check;

		public var chk_zhuangbei:feathers.controls.Check;

		public var chk_zidong:feathers.controls.Check;

		public var grp_fuzhu:feathers.controls.Group;

		public var grp_guaji:feathers.controls.Group;

		public var lbl_life:feathers.controls.Label;

		public var lbl_neili:feathers.controls.Label;

		public var rdo_dangqian:feathers.controls.Radio;

		public var rdo_dingdian:feathers.controls.Radio;

		public var rdo_quantu:feathers.controls.Radio;

		public var sld_life:feathers.controls.Slider;

		public var sld_neili:feathers.controls.Slider;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function guajiset_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 482;
			this.width = 405;
			this.elementsContent = [__guajiset_Skin_UIAsset1_i(),__guajiset_Skin_UIAsset2_i(),grp_fuzhu_i(),grp_guaji_i(),btn_start_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __guajiset_Skin_ComboBox1_i():feathers.controls.ComboBox
		{
			var temp:feathers.controls.ComboBox = new feathers.controls.ComboBox();
			temp.fontSize = 12;
			temp.styleClass = org.mokylin.skin.component.combobox.ComboBox1_Skin;
			temp.textAlign = "left";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 134;
			temp.y = 140;
			return temp;
		}

		private function __guajiset_Skin_ComboBox2_i():feathers.controls.ComboBox
		{
			var temp:feathers.controls.ComboBox = new feathers.controls.ComboBox();
			temp.fontSize = 12;
			temp.styleClass = org.mokylin.skin.component.combobox.ComboBox1_Skin;
			temp.textAlign = "left";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 134;
			temp.y = 173;
			return temp;
		}

		private function __guajiset_Skin_Label10_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "品质以下且无锻造属性的装备";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 204;
			temp.y = 141;
			return temp;
		}

		private function __guajiset_Skin_Label11_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "经验丹";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 210;
			temp.y = 175;
			return temp;
		}

		private function __guajiset_Skin_Label12_i():feathers.controls.Label
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

		private function __guajiset_Skin_Label13_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "（设置后自动生效）";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 65;
			temp.y = 5;
			return temp;
		}

		private function __guajiset_Skin_Label14_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "挂机范围：";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 2;
			temp.y = 37;
			return temp;
		}

		private function __guajiset_Skin_Label15_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "非和平式自动挂机时优先攻击玩家";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 29;
			temp.y = 69;
			return temp;
		}

		private function __guajiset_Skin_Label16_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.htmlText = "自动拾取勾选的<font color='#5DBD37'>地面物品</font>";
			temp.text = "文本";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 29;
			temp.y = 100;
			return temp;
		}

		private function __guajiset_Skin_Label17_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "受到玩家攻击自动追踪反击";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 29;
			temp.y = 131;
			return temp;
		}

		private function __guajiset_Skin_Label18_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "任务死亡自动使用还魂丹复活";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 29;
			temp.y = 164;
			return temp;
		}

		private function __guajiset_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 16;
			temp.text = "辅助设置";
			temp.color = 0xe8c958;
			temp.x = 0;
			temp.y = 3;
			return temp;
		}

		private function __guajiset_Skin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "（设置后自动生效）";
			temp.color = 0x8b8d7b;
			temp.x = 64;
			temp.y = 4;
			return temp;
		}

		private function __guajiset_Skin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "生命值低于";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 28;
			temp.y = 41;
			return temp;
		}

		private function __guajiset_Skin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "内力值低于";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 28;
			temp.y = 74;
			return temp;
		}

		private function __guajiset_Skin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "%自动智能吃药";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 257;
			temp.y = 42;
			return temp;
		}

		private function __guajiset_Skin_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "%自动智能吃药";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 257;
			temp.y = 75;
			return temp;
		}

		private function __guajiset_Skin_Label7_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "药瓶耗尽时自动购买";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 28;
			temp.y = 108;
			return temp;
		}

		private function __guajiset_Skin_Label8_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "自动出售背包中";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 28;
			temp.y = 141;
			return temp;
		}

		private function __guajiset_Skin_Label9_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "自动出售背包中";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 28;
			temp.y = 175;
			return temp;
		}

		private function __guajiset_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 444;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 405;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __guajiset_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/systemSet/fen.png";
			temp.x = 21;
			temp.y = 226;
			return temp;
		}

		private function __guajiset_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 25;
			temp.styleName = "ui/common/background/xiaobiaotibeijing.png";
			temp.width = 38;
			temp.x = 217;
			temp.y = 39;
			return temp;
		}

		private function __guajiset_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 25;
			temp.styleName = "ui/common/background/xiaobiaotibeijing.png";
			temp.width = 38;
			temp.x = 217;
			temp.y = 72;
			return temp;
		}

		private function btn_start_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_start = temp;
			temp.name = "btn_start";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "开始挂机";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.width = 79;
			temp.x = 163;
			temp.y = 445;
			return temp;
		}

		private function chk_danyao_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_danyao = temp;
			temp.name = "chk_danyao";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 0;
			temp.y = 173;
			return temp;
		}

		private function chk_fanji_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_fanji = temp;
			temp.name = "chk_fanji";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 1;
			temp.y = 129;
			return temp;
		}

		private function chk_fuhuo_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_fuhuo = temp;
			temp.name = "chk_fuhuo";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 1;
			temp.y = 162;
			return temp;
		}

		private function chk_life_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_life = temp;
			temp.name = "chk_life";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 0;
			temp.y = 40;
			return temp;
		}

		private function chk_neili_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_neili = temp;
			temp.name = "chk_neili";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 0;
			temp.y = 74;
			return temp;
		}

		private function chk_type_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_type = temp;
			temp.name = "chk_type";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 1;
			temp.y = 68;
			return temp;
		}

		private function chk_yaoping_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_yaoping = temp;
			temp.name = "chk_yaoping";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 0;
			temp.y = 107;
			return temp;
		}

		private function chk_zhuangbei_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_zhuangbei = temp;
			temp.name = "chk_zhuangbei";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 0;
			temp.y = 139;
			return temp;
		}

		private function chk_zidong_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_zidong = temp;
			temp.name = "chk_zidong";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 1;
			temp.y = 98;
			return temp;
		}

		private function grp_fuzhu_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_fuzhu = temp;
			temp.name = "grp_fuzhu";
			temp.x = 9;
			temp.y = 12;
			temp.elementsContent = [__guajiset_Skin_Label1_i(),__guajiset_Skin_Label2_i(),chk_life_i(),chk_neili_i(),chk_yaoping_i(),chk_zhuangbei_i(),chk_danyao_i(),__guajiset_Skin_Label3_i(),__guajiset_Skin_Label4_i(),__guajiset_Skin_Label5_i(),__guajiset_Skin_Label6_i(),__guajiset_Skin_Label7_i(),__guajiset_Skin_Label8_i(),__guajiset_Skin_Label9_i(),__guajiset_Skin_Label10_i(),__guajiset_Skin_Label11_i(),sld_life_i(),sld_neili_i(),__guajiset_Skin_UIAsset3_i(),__guajiset_Skin_UIAsset4_i(),lbl_life_i(),lbl_neili_i(),__guajiset_Skin_ComboBox1_i(),__guajiset_Skin_ComboBox2_i()];
			return temp;
		}

		private function grp_guaji_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_guaji = temp;
			temp.name = "grp_guaji";
			temp.x = 9;
			temp.y = 246;
			temp.elementsContent = [__guajiset_Skin_Label12_i(),__guajiset_Skin_Label13_i(),__guajiset_Skin_Label14_i(),rdo_dingdian_i(),rdo_dangqian_i(),rdo_quantu_i(),chk_type_i(),chk_zidong_i(),chk_fanji_i(),chk_fuhuo_i(),__guajiset_Skin_Label15_i(),__guajiset_Skin_Label16_i(),__guajiset_Skin_Label17_i(),__guajiset_Skin_Label18_i()];
			return temp;
		}

		private function lbl_life_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_life = temp;
			temp.name = "lbl_life";
			temp.height = 20;
			temp.text = "60";
			temp.textAlign = "center";
			temp.color = 0xe1201c;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 36;
			temp.x = 218;
			temp.y = 43;
			return temp;
		}

		private function lbl_neili_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_neili = temp;
			temp.name = "lbl_neili";
			temp.height = 20;
			temp.text = "60";
			temp.textAlign = "center";
			temp.color = 0xe1201c;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 36;
			temp.x = 218;
			temp.y = 76;
			return temp;
		}

		private function rdo_dangqian_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			rdo_dangqian = temp;
			temp.name = "rdo_dangqian";
			temp.label = "当前屏";
			temp.styleClass = org.mokylin.skin.component.radio.RadioButtonSkin_1;
			temp.textAlign = "left";
			temp.width = 68;
			temp.x = 156;
			temp.y = 37;
			return temp;
		}

		private function rdo_dingdian_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			rdo_dingdian = temp;
			temp.name = "rdo_dingdian";
			temp.label = "定点";
			temp.styleClass = org.mokylin.skin.component.radio.RadioButtonSkin_1;
			temp.textAlign = "left";
			temp.width = 73;
			temp.x = 82;
			temp.y = 37;
			return temp;
		}

		private function rdo_quantu_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			rdo_quantu = temp;
			temp.name = "rdo_quantu";
			temp.label = "全地图";
			temp.styleClass = org.mokylin.skin.component.radio.RadioButtonSkin_1;
			temp.textAlign = "left";
			temp.width = 75;
			temp.x = 241;
			temp.y = 37;
			return temp;
		}

		private function sld_life_i():feathers.controls.Slider
		{
			var temp:feathers.controls.Slider = new feathers.controls.Slider();
			sld_life = temp;
			temp.name = "sld_life";
			temp.direction = Slider.DIRECTION_HORIZONTAL
			temp.styleClass = org.mokylin.skin.component.slider.skin_Slider2;
			temp.value = 5;
			temp.width = 110;
			temp.x = 106;
			temp.y = 38;
			return temp;
		}

		private function sld_neili_i():feathers.controls.Slider
		{
			var temp:feathers.controls.Slider = new feathers.controls.Slider();
			sld_neili = temp;
			temp.name = "sld_neili";
			temp.direction = Slider.DIRECTION_HORIZONTAL
			temp.styleClass = org.mokylin.skin.component.slider.skin_Slider2;
			temp.value = 5;
			temp.width = 110;
			temp.x = 106;
			temp.y = 70;
			return temp;
		}

	}
}