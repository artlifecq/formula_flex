package org.mokylin.skin.app.systemSet
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.Group;
	import feathers.controls.Slider;
	import feathers.controls.Label;
	import feathers.controls.Radio;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.check.CheckBoxSkin_1;
	import org.mokylin.skin.component.radio.RadioButtonSkin_1;
	import org.mokylin.skin.component.slider.skin_Slider;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class xitong_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn_ok:feathers.controls.Button;

		public var chk_jujuebanghui:feathers.controls.Check;

		public var chk_jujuehaoyou:feathers.controls.Check;

		public var chk_jujuesiliao:feathers.controls.Check;

		public var chk_jujuezudui:feathers.controls.Check;

		public var chk_moren:feathers.controls.Check;

		public var grp_shejiao:feathers.controls.Group;

		public var grp_sound:feathers.controls.Group;

		public var rdoDi:feathers.controls.Radio;

		public var rdoGao:feathers.controls.Radio;

		public var rdoZhong:feathers.controls.Radio;

		public var rdoZidong:feathers.controls.Radio;

		public var sld_dengji:feathers.controls.Slider;

		public var sld_pinzhi:feathers.controls.Slider;

		public var sld_yinxiao:feathers.controls.Slider;

		public var sld_yinyue:feathers.controls.Slider;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function xitong_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__xitong_Skin_UIAsset1_i(),__xitong_Skin_UIAsset2_i(),grp_sound_i(),grp_shejiao_i(),btn_ok_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __xitong_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "渲染倍数";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 20;
			temp.y = 70;
			return temp;
		}

		private function __xitong_Skin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "抗锯齿";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 20;
			temp.y = 103;
			return temp;
		}

		private function __xitong_Skin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "显示等级";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 20;
			temp.y = 137;
			return temp;
		}

		private function __xitong_Skin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "阴影品质";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 20;
			temp.y = 171;
			return temp;
		}

		private function __xitong_Skin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "开启幻影效果";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 40;
			temp.y = 2;
			return temp;
		}

		private function __xitong_Skin_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "开启混合通道";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 40;
			temp.y = 36;
			return temp;
		}

		private function __xitong_Skin_Label7_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "开启增强效果";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 40;
			temp.y = 73;
			return temp;
		}

		private function __xitong_Skin_Label8_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "开启扭曲效果";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 40;
			temp.y = 107;
			return temp;
		}

		private function __xitong_Skin_Label9_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "开启发光效果";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 40;
			temp.y = 142;
			return temp;
		}

		private function __xitong_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/systemSet/fen.png";
			temp.x = 23;
			temp.y = 405;
			return temp;
		}

		private function __xitong_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/systemSet/huamianshezhi.png";
			temp.x = 1;
			temp.y = 8;
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
			temp.x = 155;
			temp.y = 424;
			return temp;
		}

		private function chk_jujuebanghui_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_jujuebanghui = temp;
			temp.name = "chk_jujuebanghui";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 0;
			temp.y = 105;
			return temp;
		}

		private function chk_jujuehaoyou_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_jujuehaoyou = temp;
			temp.name = "chk_jujuehaoyou";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function chk_jujuesiliao_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_jujuesiliao = temp;
			temp.name = "chk_jujuesiliao";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 0;
			temp.y = 34;
			return temp;
		}

		private function chk_jujuezudui_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_jujuezudui = temp;
			temp.name = "chk_jujuezudui";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 0;
			temp.y = 70;
			return temp;
		}

		private function chk_moren_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_moren = temp;
			temp.name = "chk_moren";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 0;
			temp.y = 139;
			return temp;
		}

		private function grp_shejiao_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_shejiao = temp;
			temp.name = "grp_shejiao";
			temp.x = 31;
			temp.y = 224;
			temp.elementsContent = [chk_jujuehaoyou_i(),chk_jujuesiliao_i(),chk_jujuezudui_i(),chk_jujuebanghui_i(),chk_moren_i(),__xitong_Skin_Label5_i(),__xitong_Skin_Label6_i(),__xitong_Skin_Label7_i(),__xitong_Skin_Label8_i(),__xitong_Skin_Label9_i()];
			return temp;
		}

		private function grp_sound_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_sound = temp;
			temp.name = "grp_sound";
			temp.x = 11;
			temp.y = 18;
			temp.elementsContent = [__xitong_Skin_Label1_i(),__xitong_Skin_Label2_i(),__xitong_Skin_Label3_i(),__xitong_Skin_Label4_i(),sld_yinyue_i(),sld_yinxiao_i(),sld_dengji_i(),sld_pinzhi_i(),rdoZidong_i(),rdoDi_i(),rdoZhong_i(),rdoGao_i()];
			return temp;
		}

		private function rdoDi_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			rdoDi = temp;
			temp.name = "rdoDi";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.groupName = "rdoSet";
			temp.label = "低";
			temp.labelOffsetX = 9;
			temp.styleClass = org.mokylin.skin.component.radio.RadioButtonSkin_1;
			temp.textAlign = "left";
			temp.color = 0xEAEABC;
			temp.width = 70;
			temp.x = 124;
			temp.y = 35;
			return temp;
		}

		private function rdoGao_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			rdoGao = temp;
			temp.name = "rdoGao";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.groupName = "rdoSet";
			temp.label = "高";
			temp.labelOffsetX = 9;
			temp.styleClass = org.mokylin.skin.component.radio.RadioButtonSkin_1;
			temp.textAlign = "left";
			temp.color = 0xEAEABC;
			temp.width = 70;
			temp.x = 274;
			temp.y = 35;
			return temp;
		}

		private function rdoZhong_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			rdoZhong = temp;
			temp.name = "rdoZhong";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.groupName = "rdoSet";
			temp.label = "中";
			temp.labelOffsetX = 9;
			temp.styleClass = org.mokylin.skin.component.radio.RadioButtonSkin_1;
			temp.textAlign = "left";
			temp.color = 0xEAEABC;
			temp.width = 70;
			temp.x = 199;
			temp.y = 35;
			return temp;
		}

		private function rdoZidong_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			rdoZidong = temp;
			temp.name = "rdoZidong";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.groupName = "rdoSet";
			temp.label = "自动";
			temp.labelOffsetX = 9;
			temp.styleClass = org.mokylin.skin.component.radio.RadioButtonSkin_1;
			temp.textAlign = "left";
			temp.color = 0xEAEABC;
			temp.width = 70;
			temp.x = 49;
			temp.y = 35;
			return temp;
		}

		private function sld_dengji_i():feathers.controls.Slider
		{
			var temp:feathers.controls.Slider = new feathers.controls.Slider();
			sld_dengji = temp;
			temp.name = "sld_dengji";
			temp.height = 7;
			temp.direction = Slider.DIRECTION_HORIZONTAL
			temp.styleClass = org.mokylin.skin.component.slider.skin_Slider;
			temp.value = 3;
			temp.width = 240;
			temp.x = 98;
			temp.y = 131;
			return temp;
		}

		private function sld_pinzhi_i():feathers.controls.Slider
		{
			var temp:feathers.controls.Slider = new feathers.controls.Slider();
			sld_pinzhi = temp;
			temp.name = "sld_pinzhi";
			temp.height = 7;
			temp.direction = Slider.DIRECTION_HORIZONTAL
			temp.styleClass = org.mokylin.skin.component.slider.skin_Slider;
			temp.value = 3;
			temp.width = 240;
			temp.x = 98;
			temp.y = 165;
			return temp;
		}

		private function sld_yinxiao_i():feathers.controls.Slider
		{
			var temp:feathers.controls.Slider = new feathers.controls.Slider();
			sld_yinxiao = temp;
			temp.name = "sld_yinxiao";
			temp.height = 7;
			temp.direction = Slider.DIRECTION_HORIZONTAL
			temp.styleClass = org.mokylin.skin.component.slider.skin_Slider;
			temp.value = 3;
			temp.width = 240;
			temp.x = 98;
			temp.y = 96;
			return temp;
		}

		private function sld_yinyue_i():feathers.controls.Slider
		{
			var temp:feathers.controls.Slider = new feathers.controls.Slider();
			sld_yinyue = temp;
			temp.name = "sld_yinyue";
			temp.height = 7;
			temp.direction = Slider.DIRECTION_HORIZONTAL
			temp.styleClass = org.mokylin.skin.component.slider.skin_Slider;
			temp.value = 3;
			temp.width = 240;
			temp.x = 98;
			temp.y = 62;
			return temp;
		}

	}
}