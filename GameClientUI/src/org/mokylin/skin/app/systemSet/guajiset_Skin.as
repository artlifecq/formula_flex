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
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.check.CheckBoxSkin_1;
	import org.mokylin.skin.component.combobox.ComboBox1_Skin;
	import org.mokylin.skin.component.combobox.ComboBox2_Skin;
	import org.mokylin.skin.component.slider.skin_Slider;
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
		public var btn_max:feathers.controls.Button;

		public var btn_min:feathers.controls.Button;

		public var btn_ok:feathers.controls.Button;

		public var btn_start:feathers.controls.Button;

		public var chk_life:feathers.controls.Check;

		public var chk_shiqu:feathers.controls.Check;

		public var chk_type:feathers.controls.Check;

		public var chk_yaopin:feathers.controls.Check;

		public var chk_yaoping:feathers.controls.Check;

		public var cmb_dengjie:feathers.controls.ComboBox;

		public var cmb_zhiye:feathers.controls.ComboBox;

		public var grp_fuzhu:feathers.controls.Group;

		public var grp_guaji:feathers.controls.Group;

		public var input_life:feathers.controls.TextInput;

		public var input_txt:feathers.controls.TextInput;

		public var lbGuaji:feathers.controls.Label;

		public var sld_life:feathers.controls.Slider;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function guajiset_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 476;
			this.width = 405;
			this.elementsContent = [__guajiset_Skin_UIAsset1_i(),grp_fuzhu_i(),grp_guaji_i(),btn_start_i(),btn_ok_i(),lbGuaji_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __guajiset_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "生命值低于";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 53;
			temp.y = 42;
			return temp;
		}

		private function __guajiset_Skin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "%自动智能吃药";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 254;
			temp.y = 42;
			return temp;
		}

		private function __guajiset_Skin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "药品耗尽时，自动购买与人物等级相符的药品";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 53;
			temp.y = 77;
			return temp;
		}

		private function __guajiset_Skin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "攻击";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 26;
			temp.y = 41;
			return temp;
		}

		private function __guajiset_Skin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "米范围内的怪物（仅野外有效）";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 135;
			temp.y = 41;
			return temp;
		}

		private function __guajiset_Skin_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "自动拾取所有物品";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 54;
			temp.y = 76;
			return temp;
		}

		private function __guajiset_Skin_Label7_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "装备";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 307;
			temp.y = 111;
			return temp;
		}

		private function __guajiset_Skin_Label8_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "拾取";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 56;
			temp.y = 111;
			return temp;
		}

		private function __guajiset_Skin_Label9_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "死亡后，自动使用复活丹原地复活";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 55;
			temp.y = 146;
			return temp;
		}

		private function __guajiset_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/systemSet/fen.png";
			temp.x = 23;
			temp.y = 405;
			return temp;
		}

		private function __guajiset_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/systemSet/fuzhushezhi.png";
			temp.x = -4;
			temp.y = -7;
			return temp;
		}

		private function __guajiset_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/systemSet/guajixuanxiang.png";
			temp.x = -4;
			temp.y = -7;
			return temp;
		}

		private function btn_max_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_max = temp;
			temp.name = "btn_max";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jia;
			temp.x = 111;
			temp.y = 39;
			return temp;
		}

		private function btn_min_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_min = temp;
			temp.name = "btn_min";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jian;
			temp.x = 60;
			temp.y = 39;
			return temp;
		}

		private function btn_ok_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_ok = temp;
			temp.name = "btn_ok";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "保存设置";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xFFFFFF;
			temp.width = 88;
			temp.x = 88;
			temp.y = 424;
			return temp;
		}

		private function btn_start_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_start = temp;
			temp.name = "btn_start";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "开始挂机";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xFFFFFF;
			temp.width = 88;
			temp.x = 229;
			temp.y = 424;
			return temp;
		}

		private function chk_life_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_life = temp;
			temp.name = "chk_life";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 26;
			temp.y = 40;
			return temp;
		}

		private function chk_shiqu_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_shiqu = temp;
			temp.name = "chk_shiqu";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 26;
			temp.y = 109;
			return temp;
		}

		private function chk_type_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_type = temp;
			temp.name = "chk_type";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 26;
			temp.y = 74;
			return temp;
		}

		private function chk_yaopin_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_yaopin = temp;
			temp.name = "chk_yaopin";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 26;
			temp.y = 144;
			return temp;
		}

		private function chk_yaoping_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_yaoping = temp;
			temp.name = "chk_yaoping";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 26;
			temp.y = 75;
			return temp;
		}

		private function cmb_dengjie_i():feathers.controls.ComboBox
		{
			var temp:feathers.controls.ComboBox = new feathers.controls.ComboBox();
			cmb_dengjie = temp;
			temp.name = "cmb_dengjie";
			temp.height = 24;
			temp.fontSize = 14;
			temp.styleClass = org.mokylin.skin.component.combobox.ComboBox1_Skin;
			temp.textAlign = "left";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 123;
			temp.x = 181;
			temp.y = 109;
			return temp;
		}

		private function cmb_zhiye_i():feathers.controls.ComboBox
		{
			var temp:feathers.controls.ComboBox = new feathers.controls.ComboBox();
			cmb_zhiye = temp;
			temp.name = "cmb_zhiye";
			temp.height = 24;
			temp.fontSize = 14;
			temp.styleClass = org.mokylin.skin.component.combobox.ComboBox2_Skin;
			temp.textAlign = "left";
			temp.color = 0xA3A594;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 91;
			temp.x = 90;
			temp.y = 109;
			return temp;
		}

		private function grp_fuzhu_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_fuzhu = temp;
			temp.name = "grp_fuzhu";
			temp.x = 9;
			temp.y = 15;
			temp.elementsContent = [__guajiset_Skin_UIAsset2_i(),chk_life_i(),chk_yaoping_i(),__guajiset_Skin_Label1_i(),__guajiset_Skin_Label2_i(),__guajiset_Skin_Label3_i(),sld_life_i(),input_life_i()];
			return temp;
		}

		private function grp_guaji_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_guaji = temp;
			temp.name = "grp_guaji";
			temp.x = 9;
			temp.y = 144;
			temp.elementsContent = [__guajiset_Skin_UIAsset3_i(),__guajiset_Skin_Label4_i(),__guajiset_Skin_Label5_i(),input_txt_i(),btn_min_i(),btn_max_i(),chk_type_i(),__guajiset_Skin_Label6_i(),chk_shiqu_i(),__guajiset_Skin_Label7_i(),__guajiset_Skin_Label8_i(),cmb_zhiye_i(),cmb_dengjie_i(),chk_yaopin_i(),__guajiset_Skin_Label9_i()];
			return temp;
		}

		private function input_life_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			input_life = temp;
			temp.name = "input_life";
			temp.height = 22;
			temp.styleClass = org.mokylin.skin.component.text.textInput3_Skin;
			temp.textAlign = "center";
			temp.color = 0xFF0D0D;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 35;
			temp.x = 218;
			temp.y = 40;
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
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 36;
			temp.x = 78;
			temp.y = 39;
			return temp;
		}

		private function lbGuaji_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbGuaji = temp;
			temp.name = "lbGuaji";
			temp.fontSize = 14;
			temp.text = "快[A]可快速开启/关闭挂机";
			temp.textAlign = "center";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 219;
			temp.x = 93;
			temp.y = 380;
			return temp;
		}

		private function sld_life_i():feathers.controls.Slider
		{
			var temp:feathers.controls.Slider = new feathers.controls.Slider();
			sld_life = temp;
			temp.name = "sld_life";
			temp.height = 7;
			temp.direction = Slider.DIRECTION_HORIZONTAL
			temp.styleClass = org.mokylin.skin.component.slider.skin_Slider;
			temp.value = 10;
			temp.width = 91;
			temp.x = 127;
			temp.y = 48;
			return temp;
		}

	}
}