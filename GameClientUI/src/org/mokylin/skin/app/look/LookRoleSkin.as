package org.mokylin.skin.app.look
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_zd_left;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_zd_right;
	import org.mokylin.skin.component.button.ButtonSkin_red_4;
	import org.mokylin.skin.component.uinumber.UINumberSkin_power;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class LookRoleSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var achievementIcon:feathers.controls.UIAsset;

		public var bg:feathers.controls.UIAsset;

		public var bg0:feathers.controls.UIAsset;

		public var bg1:feathers.controls.UIAsset;

		public var grid0:feathers.controls.UIAsset;

		public var grid1:feathers.controls.UIAsset;

		public var grid10:feathers.controls.UIAsset;

		public var grid11:feathers.controls.UIAsset;

		public var grid2:feathers.controls.UIAsset;

		public var grid3:feathers.controls.UIAsset;

		public var grid4:feathers.controls.UIAsset;

		public var grid5:feathers.controls.UIAsset;

		public var grid6:feathers.controls.UIAsset;

		public var grid7:feathers.controls.UIAsset;

		public var grid8:feathers.controls.UIAsset;

		public var grid9:feathers.controls.UIAsset;

		public var honerIcon:feathers.controls.UIAsset;

		public var icon_ping:feathers.controls.UIAsset;

		public var lb_bang:feathers.controls.Label;

		public var lb_bj:feathers.controls.Label;

		public var lb_country:feathers.controls.Label;

		public var lb_dy:feathers.controls.Label;

		public var lb_ff:feathers.controls.Label;

		public var lb_fg:feathers.controls.Label;

		public var lb_fsl:feathers.controls.Label;

		public var lb_hf:feathers.controls.Label;

		public var lb_hp:feathers.controls.Label;

		public var lb_jia:feathers.controls.Label;

		public var lb_js:feathers.controls.Label;

		public var lb_junxian:feathers.controls.Label;

		public var lb_kb:feathers.controls.Label;

		public var lb_leftPoint:feathers.controls.Label;

		public var lb_ll:feathers.controls.Label;

		public var lb_mj:feathers.controls.Label;

		public var lb_mp:feathers.controls.Label;

		public var lb_mz:feathers.controls.Label;

		public var lb_name:feathers.controls.Label;

		public var lb_name0:feathers.controls.Label;

		public var lb_pk:feathers.controls.Label;

		public var lb_qh:feathers.controls.Label;

		public var lb_sb:feathers.controls.Label;

		public var lb_shhm:feathers.controls.Label;

		public var lb_shjc:feathers.controls.Label;

		public var lb_tz:feathers.controls.Label;

		public var lb_wf:feathers.controls.Label;

		public var lb_wg:feathers.controls.Label;

		public var lb_xxb:feathers.controls.Label;

		public var lb_xxz:feathers.controls.Label;

		public var lb_zj:feathers.controls.Label;

		public var lb_zl:feathers.controls.Label;

		public var numberPower:feathers.controls.UINumber;

		public var zd_left:feathers.controls.Button;

		public var zd_right:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function LookRoleSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [bg_i(),numberPower_i(),__LookRoleSkin_UIAsset2_i(),zd_left_i(),zd_right_i(),grid0_i(),grid1_i(),grid7_i(),grid4_i(),grid3_i(),grid9_i(),grid10_i(),grid11_i(),grid5_i(),grid8_i(),grid2_i(),grid6_i(),lb_name_i(),lb_name0_i(),lb_country_i(),lb_junxian_i(),icon_ping_i(),__LookRoleSkin_UIAsset3_i(),__LookRoleSkin_Button1_i(),__LookRoleSkin_Button2_i(),__LookRoleSkin_Group1_i(),__LookRoleSkin_Group2_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __LookRoleSkin_Button1_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.isEnabled = true;
			temp.height = 30;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.label = "基础属性";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_red_4;
			temp.color = 0xF9F0CC;
			temp.width = 88;
			temp.x = 425;
			temp.y = 37;
			return temp;
		}

		private function __LookRoleSkin_Button2_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.isEnabled = true;
			temp.height = 30;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.label = "详细属性";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_red_4;
			temp.color = 0xF9F0CC;
			temp.width = 88;
			temp.x = 645;
			temp.y = 37;
			return temp;
		}

		private function __LookRoleSkin_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.height = 440;
			temp.width = 220;
			temp.x = 421;
			temp.y = 70;
			temp.elementsContent = [bg0_i(),__LookRoleSkin_UIAsset4_i(),__LookRoleSkin_Label1_i(),__LookRoleSkin_UIAsset5_i(),__LookRoleSkin_UIAsset6_i(),__LookRoleSkin_UIAsset7_i(),__LookRoleSkin_UIAsset8_i(),__LookRoleSkin_UIAsset9_i(),__LookRoleSkin_UIAsset10_i(),__LookRoleSkin_UIAsset11_i(),__LookRoleSkin_UIAsset12_i(),__LookRoleSkin_UIAsset13_i(),__LookRoleSkin_Label2_i(),__LookRoleSkin_Label3_i(),__LookRoleSkin_Label4_i(),__LookRoleSkin_Label5_i(),__LookRoleSkin_Label6_i(),__LookRoleSkin_Label7_i(),__LookRoleSkin_Label8_i(),__LookRoleSkin_Label9_i(),__LookRoleSkin_Label10_i(),lb_jia_i(),lb_bang_i(),lb_pk_i(),lb_hp_i(),__LookRoleSkin_UIAsset14_i(),__LookRoleSkin_Label11_i(),lb_ff_i(),__LookRoleSkin_UIAsset15_i(),__LookRoleSkin_Label12_i(),lb_wf_i(),__LookRoleSkin_UIAsset16_i(),__LookRoleSkin_Label13_i(),lb_fg_i(),__LookRoleSkin_UIAsset17_i(),__LookRoleSkin_Label14_i(),lb_wg_i(),__LookRoleSkin_UIAsset18_i(),__LookRoleSkin_Label15_i(),lb_mp_i(),lb_leftPoint_i(),lb_mj_i(),lb_ll_i(),lb_zl_i(),lb_js_i(),lb_tz_i(),honerIcon_i(),achievementIcon_i()];
			return temp;
		}

		private function __LookRoleSkin_Group2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.width = 166;
			temp.x = 640;
			temp.y = 70;
			temp.elementsContent = [bg1_i(),__LookRoleSkin_UIAsset19_i(),__LookRoleSkin_Label16_i(),__LookRoleSkin_UIAsset20_i(),__LookRoleSkin_UIAsset21_i(),__LookRoleSkin_UIAsset22_i(),__LookRoleSkin_UIAsset23_i(),__LookRoleSkin_UIAsset24_i(),__LookRoleSkin_UIAsset25_i(),__LookRoleSkin_UIAsset26_i(),__LookRoleSkin_UIAsset27_i(),__LookRoleSkin_UIAsset28_i(),__LookRoleSkin_UIAsset29_i(),__LookRoleSkin_UIAsset30_i(),__LookRoleSkin_UIAsset31_i(),__LookRoleSkin_UIAsset32_i(),__LookRoleSkin_Label17_i(),__LookRoleSkin_Label18_i(),__LookRoleSkin_Label19_i(),__LookRoleSkin_Label20_i(),__LookRoleSkin_Label21_i(),__LookRoleSkin_Label22_i(),__LookRoleSkin_Label23_i(),__LookRoleSkin_Label24_i(),__LookRoleSkin_Label25_i(),__LookRoleSkin_Label26_i(),__LookRoleSkin_Label27_i(),__LookRoleSkin_Label28_i(),__LookRoleSkin_Label29_i(),lb_mz_i(),lb_sb_i(),lb_bj_i(),lb_kb_i(),lb_fsl_i(),lb_xxz_i(),lb_xxb_i(),lb_hf_i(),lb_qh_i(),lb_shhm_i(),lb_shjc_i(),lb_zj_i(),lb_dy_i()];
			return temp;
		}

		private function __LookRoleSkin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = -10;
			return temp;
		}

		private function __LookRoleSkin_Label10_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 20;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "生命：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 55;
			temp.x = 11;
			temp.y = 129;
			return temp;
		}

		private function __LookRoleSkin_Label11_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 20;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "法防：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 55;
			temp.x = 11;
			temp.y = 253;
			return temp;
		}

		private function __LookRoleSkin_Label12_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 20;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "物防：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 55;
			temp.x = 11;
			temp.y = 228;
			return temp;
		}

		private function __LookRoleSkin_Label13_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 20;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "法攻：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 55;
			temp.x = 11;
			temp.y = 203;
			return temp;
		}

		private function __LookRoleSkin_Label14_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 20;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "物攻：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 55;
			temp.x = 11;
			temp.y = 178;
			return temp;
		}

		private function __LookRoleSkin_Label15_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 20;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "法力：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 55;
			temp.x = 11;
			temp.y = 153;
			return temp;
		}

		private function __LookRoleSkin_Label16_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.fontSize = 14;
			temp.text = "特殊属性";
			temp.textAlign = "center";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 151;
			temp.x = 5;
			temp.y = 132;
			return temp;
		}

		private function __LookRoleSkin_Label17_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.fontSize = 14;
			temp.text = "命  中：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 70;
			temp.x = 9;
			temp.y = 9;
			return temp;
		}

		private function __LookRoleSkin_Label18_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "吸血值：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 70;
			temp.x = 9;
			temp.y = 162;
			return temp;
		}

		private function __LookRoleSkin_Label19_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "吸血比：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 70;
			temp.x = 9;
			temp.y = 185;
			return temp;
		}

		private function __LookRoleSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.leading = 0;
			temp.fontSize = 14;
			temp.text = "属性点数：";
			temp.textAlign = "left";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 80;
			temp.x = 26;
			temp.y = 283;
			return temp;
		}

		private function __LookRoleSkin_Label20_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "恢复率：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 70;
			temp.x = 9;
			temp.y = 209;
			return temp;
		}

		private function __LookRoleSkin_Label21_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "被治疗强化：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 100;
			temp.x = 9;
			temp.y = 232;
			return temp;
		}

		private function __LookRoleSkin_Label22_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "伤害豁免：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 80;
			temp.x = 9;
			temp.y = 255;
			return temp;
		}

		private function __LookRoleSkin_Label23_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "伤害加成：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 80;
			temp.x = 9;
			temp.y = 279;
			return temp;
		}

		private function __LookRoleSkin_Label24_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "招架概率：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 80;
			temp.x = 9;
			temp.y = 302;
			return temp;
		}

		private function __LookRoleSkin_Label25_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "最大伤害抵御：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 110;
			temp.x = 9;
			temp.y = 327;
			return temp;
		}

		private function __LookRoleSkin_Label26_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "闪  避：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 70;
			temp.x = 9;
			temp.y = 34;
			return temp;
		}

		private function __LookRoleSkin_Label27_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "暴  击：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 70;
			temp.x = 9;
			temp.y = 59;
			return temp;
		}

		private function __LookRoleSkin_Label28_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "抗  暴：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 70;
			temp.x = 9;
			temp.y = 84;
			return temp;
		}

		private function __LookRoleSkin_Label29_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "反射率：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 70;
			temp.x = 9;
			temp.y = 108;
			return temp;
		}

		private function __LookRoleSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 20;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "力量：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 55;
			temp.x = 11;
			temp.y = 311;
			return temp;
		}

		private function __LookRoleSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 20;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "敏捷：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 55;
			temp.x = 11;
			temp.y = 336;
			return temp;
		}

		private function __LookRoleSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 20;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "智力：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 55;
			temp.x = 11;
			temp.y = 362;
			return temp;
		}

		private function __LookRoleSkin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 20;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "精神：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 55;
			temp.x = 11;
			temp.y = 388;
			return temp;
		}

		private function __LookRoleSkin_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 20;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "体质：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 55;
			temp.x = 11;
			temp.y = 414;
			return temp;
		}

		private function __LookRoleSkin_Label7_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 20;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "家族：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 55;
			temp.x = 11;
			temp.y = 47;
			return temp;
		}

		private function __LookRoleSkin_Label8_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 20;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "帮派：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 55;
			temp.x = 11;
			temp.y = 72;
			return temp;
		}

		private function __LookRoleSkin_Label9_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 20;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "pk值：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 55;
			temp.x = 11;
			temp.y = 96;
			return temp;
		}

		private function __LookRoleSkin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/liebiao/property_bg.png";
			temp.width = 206;
			temp.x = 6;
			temp.y = 335;
			return temp;
		}

		private function __LookRoleSkin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/liebiao/property_bg.png";
			temp.width = 206;
			temp.x = 6;
			temp.y = 360;
			return temp;
		}

		private function __LookRoleSkin_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/liebiao/property_bg.png";
			temp.width = 206;
			temp.x = 6;
			temp.y = 387;
			return temp;
		}

		private function __LookRoleSkin_UIAsset13_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/liebiao/property_bg.png";
			temp.width = 206;
			temp.x = 6;
			temp.y = 412;
			return temp;
		}

		private function __LookRoleSkin_UIAsset14_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/liebiao/property_bg.png";
			temp.width = 206;
			temp.x = 8;
			temp.y = 250;
			return temp;
		}

		private function __LookRoleSkin_UIAsset15_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/liebiao/property_bg.png";
			temp.width = 206;
			temp.x = 8;
			temp.y = 225;
			return temp;
		}

		private function __LookRoleSkin_UIAsset16_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/liebiao/property_bg.png";
			temp.width = 206;
			temp.x = 6;
			temp.y = 200;
			return temp;
		}

		private function __LookRoleSkin_UIAsset17_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/liebiao/property_bg.png";
			temp.width = 206;
			temp.x = 6;
			temp.y = 175;
			return temp;
		}

		private function __LookRoleSkin_UIAsset18_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/liebiao/property_bg.png";
			temp.width = 206;
			temp.x = 6;
			temp.y = 150;
			return temp;
		}

		private function __LookRoleSkin_UIAsset19_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 24;
			temp.styleName = "ui/common/liebiao/lie_biao_di.png";
			temp.width = 157;
			temp.x = 2;
			temp.y = 129;
			return temp;
		}

		private function __LookRoleSkin_UIAsset20_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/liebiao/property_bg.png";
			temp.width = 157;
			temp.x = 4;
			temp.y = 8;
			return temp;
		}

		private function __LookRoleSkin_UIAsset21_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/liebiao/property_bg.png";
			temp.width = 157;
			temp.x = 4;
			temp.y = 32;
			return temp;
		}

		private function __LookRoleSkin_UIAsset22_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/liebiao/property_bg.png";
			temp.width = 157;
			temp.x = 4;
			temp.y = 57;
			return temp;
		}

		private function __LookRoleSkin_UIAsset23_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/liebiao/property_bg.png";
			temp.width = 157;
			temp.x = 4;
			temp.y = 82;
			return temp;
		}

		private function __LookRoleSkin_UIAsset24_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/liebiao/property_bg.png";
			temp.width = 157;
			temp.x = 4;
			temp.y = 106;
			return temp;
		}

		private function __LookRoleSkin_UIAsset25_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/liebiao/property_bg.png";
			temp.width = 157;
			temp.x = 4;
			temp.y = 161;
			return temp;
		}

		private function __LookRoleSkin_UIAsset26_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/liebiao/property_bg.png";
			temp.width = 157;
			temp.x = 4;
			temp.y = 184;
			return temp;
		}

		private function __LookRoleSkin_UIAsset27_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/liebiao/property_bg.png";
			temp.width = 157;
			temp.x = 4;
			temp.y = 207;
			return temp;
		}

		private function __LookRoleSkin_UIAsset28_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/liebiao/property_bg.png";
			temp.width = 157;
			temp.x = 4;
			temp.y = 230;
			return temp;
		}

		private function __LookRoleSkin_UIAsset29_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/liebiao/property_bg.png";
			temp.width = 157;
			temp.x = 4;
			temp.y = 253;
			return temp;
		}

		private function __LookRoleSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/common/icon/zl.png";
			temp.x = 121;
			temp.y = 508;
			return temp;
		}

		private function __LookRoleSkin_UIAsset30_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/liebiao/property_bg.png";
			temp.width = 157;
			temp.x = 4;
			temp.y = 277;
			return temp;
		}

		private function __LookRoleSkin_UIAsset31_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/liebiao/property_bg.png";
			temp.width = 157;
			temp.x = 4;
			temp.y = 300;
			return temp;
		}

		private function __LookRoleSkin_UIAsset32_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/liebiao/property_bg.png";
			temp.width = 157;
			temp.x = 4;
			temp.y = 325;
			return temp;
		}

		private function __LookRoleSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/icon/xing.png";
			temp.x = 360;
			temp.y = 79;
			return temp;
		}

		private function __LookRoleSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 24;
			temp.styleName = "ui/common/liebiao/lie_biao_di.png";
			temp.width = 208;
			temp.x = 4;
			temp.y = 280;
			return temp;
		}

		private function __LookRoleSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/liebiao/property_bg.png";
			temp.width = 206;
			temp.x = 6;
			temp.y = 45;
			return temp;
		}

		private function __LookRoleSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/liebiao/property_bg.png";
			temp.width = 206;
			temp.x = 6;
			temp.y = 70;
			return temp;
		}

		private function __LookRoleSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/liebiao/property_bg.png";
			temp.width = 206;
			temp.x = 6;
			temp.y = 95;
			return temp;
		}

		private function __LookRoleSkin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/liebiao/property_bg.png";
			temp.width = 206;
			temp.x = 6;
			temp.y = 126;
			return temp;
		}

		private function __LookRoleSkin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/liebiao/property_bg.png";
			temp.width = 206;
			temp.x = 6;
			temp.y = 310;
			return temp;
		}

		private function achievementIcon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			achievementIcon = temp;
			temp.name = "achievementIcon";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/common/honor/zhu_gong_zhi_wang.png";
			temp.x = 7;
			temp.y = 0;
			return temp;
		}

		private function bg0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg0 = temp;
			temp.name = "bg0";
			temp.height = 439;
			temp.styleName = "ui/common/kang/neikuang1.png";
			temp.width = 215;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg1 = temp;
			temp.name = "bg1";
			temp.height = 439;
			temp.styleName = "ui/common/kang/neikuang1.png";
			temp.width = 165;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.styleName = "ui/app/look/lookRoleBg.jpg";
			temp.x = 37;
			temp.y = 36;
			return temp;
		}

		private function grid0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid0 = temp;
			temp.name = "grid0";
			temp.styleName = "ui/app/look/shi_zhuang.png";
			temp.x = 53;
			temp.y = 120;
			return temp;
		}

		private function grid10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid10 = temp;
			temp.name = "grid10";
			temp.styleName = "ui/app/look/shou_wan.png";
			temp.x = 357;
			temp.y = 364;
			return temp;
		}

		private function grid11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid11 = temp;
			temp.name = "grid11";
			temp.styleName = "ui/app/look/xie_zi.png";
			temp.x = 357;
			temp.y = 425;
			return temp;
		}

		private function grid1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid1 = temp;
			temp.name = "grid1";
			temp.styleName = "ui/app/look/xiang_liang.png";
			temp.x = 53;
			temp.y = 180;
			return temp;
		}

		private function grid2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid2 = temp;
			temp.name = "grid2";
			temp.styleName = "ui/app/look/wu_qi.png";
			temp.x = 53;
			temp.y = 241;
			return temp;
		}

		private function grid3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid3 = temp;
			temp.name = "grid3";
			temp.styleName = "ui/app/look/fu_shou.png";
			temp.x = 53;
			temp.y = 302;
			return temp;
		}

		private function grid4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid4 = temp;
			temp.name = "grid4";
			temp.styleName = "ui/app/look/jie_zhi.png";
			temp.x = 53;
			temp.y = 363;
			return temp;
		}

		private function grid5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid5 = temp;
			temp.name = "grid5";
			temp.styleName = "ui/app/look/jie_zhi.png";
			temp.x = 53;
			temp.y = 423;
			return temp;
		}

		private function grid6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid6 = temp;
			temp.name = "grid6";
			temp.styleName = "ui/app/look/tou_kui.png";
			temp.x = 357;
			temp.y = 120;
			return temp;
		}

		private function grid7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid7 = temp;
			temp.name = "grid7";
			temp.styleName = "ui/app/look/yi_fu.png";
			temp.x = 357;
			temp.y = 180;
			return temp;
		}

		private function grid8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid8 = temp;
			temp.name = "grid8";
			temp.styleName = "ui/app/look/yao_dai.png";
			temp.x = 357;
			temp.y = 241;
			return temp;
		}

		private function grid9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid9 = temp;
			temp.name = "grid9";
			temp.styleName = "ui/app/look/shou_wan.png";
			temp.x = 357;
			temp.y = 303;
			return temp;
		}

		private function honerIcon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			honerIcon = temp;
			temp.name = "honerIcon";
			temp.styleName = "ui/common/tubiao/wang_cheng_zhan.png";
			temp.x = 184;
			temp.y = 65;
			return temp;
		}

		private function icon_ping_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon_ping = temp;
			temp.name = "icon_ping";
			temp.styleName = "ui/common/icon/pingzi/cheng.png";
			temp.x = 381;
			temp.y = 77;
			return temp;
		}

		private function lb_bang_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_bang = temp;
			temp.name = "lb_bang";
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "754";
			temp.textAlign = "right";
			temp.color = 0xF09E01;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 122;
			temp.x = 60;
			temp.y = 72;
			return temp;
		}

		private function lb_bj_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_bj = temp;
			temp.name = "lb_bj";
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "754";
			temp.textAlign = "right";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 83;
			temp.x = 77;
			temp.y = 59;
			return temp;
		}

		private function lb_country_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_country = temp;
			temp.name = "lb_country";
			temp.height = 20;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "无";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 80;
			temp.x = 336;
			temp.y = 52;
			return temp;
		}

		private function lb_dy_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_dy = temp;
			temp.name = "lb_dy";
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "754";
			temp.textAlign = "right";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 83;
			temp.x = 77;
			temp.y = 327;
			return temp;
		}

		private function lb_ff_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_ff = temp;
			temp.name = "lb_ff";
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "754";
			temp.textAlign = "right";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 152;
			temp.x = 58;
			temp.y = 253;
			return temp;
		}

		private function lb_fg_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_fg = temp;
			temp.name = "lb_fg";
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "754";
			temp.textAlign = "right";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 152;
			temp.x = 58;
			temp.y = 203;
			return temp;
		}

		private function lb_fsl_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_fsl = temp;
			temp.name = "lb_fsl";
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "754";
			temp.textAlign = "right";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 83;
			temp.x = 77;
			temp.y = 108;
			return temp;
		}

		private function lb_hf_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_hf = temp;
			temp.name = "lb_hf";
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "754";
			temp.textAlign = "right";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 83;
			temp.x = 77;
			temp.y = 210;
			return temp;
		}

		private function lb_hp_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_hp = temp;
			temp.name = "lb_hp";
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "754";
			temp.textAlign = "right";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 152;
			temp.x = 58;
			temp.y = 128;
			return temp;
		}

		private function lb_jia_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_jia = temp;
			temp.name = "lb_jia";
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "754";
			temp.textAlign = "right";
			temp.color = 0xF09E01;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 83;
			temp.x = 127;
			temp.y = 47;
			return temp;
		}

		private function lb_js_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_js = temp;
			temp.name = "lb_js";
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "754";
			temp.textAlign = "right";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 104;
			temp.x = 107;
			temp.y = 388;
			return temp;
		}

		private function lb_junxian_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_junxian = temp;
			temp.name = "lb_junxian";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.leading = 0;
			temp.fontSize = 14;
			temp.text = "无";
			temp.textAlign = "center";
			temp.color = 0x0066FF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 152;
			temp.x = 154;
			temp.y = 81;
			return temp;
		}

		private function lb_kb_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_kb = temp;
			temp.name = "lb_kb";
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "754";
			temp.textAlign = "right";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 83;
			temp.x = 77;
			temp.y = 84;
			return temp;
		}

		private function lb_leftPoint_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_leftPoint = temp;
			temp.name = "lb_leftPoint";
			temp.leading = 0;
			temp.fontSize = 14;
			temp.text = "0";
			temp.textAlign = "left";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 83;
			temp.x = 96;
			temp.y = 283;
			return temp;
		}

		private function lb_ll_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_ll = temp;
			temp.name = "lb_ll";
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "754";
			temp.textAlign = "right";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 105;
			temp.x = 106;
			temp.y = 311;
			return temp;
		}

		private function lb_mj_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_mj = temp;
			temp.name = "lb_mj";
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "754";
			temp.textAlign = "right";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 105;
			temp.x = 106;
			temp.y = 336;
			return temp;
		}

		private function lb_mp_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_mp = temp;
			temp.name = "lb_mp";
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "754";
			temp.textAlign = "right";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 152;
			temp.x = 58;
			temp.y = 153;
			return temp;
		}

		private function lb_mz_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_mz = temp;
			temp.name = "lb_mz";
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "754";
			temp.textAlign = "right";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 83;
			temp.x = 77;
			temp.y = 9;
			return temp;
		}

		private function lb_name0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_name0 = temp;
			temp.name = "lb_name0";
			temp.height = 20;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "国家：";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 292;
			temp.y = 52;
			return temp;
		}

		private function lb_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_name = temp;
			temp.name = "lb_name";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 18;
			temp.text = "125级";
			temp.textAlign = "left";
			temp.color = 0xDB9736;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 196;
			temp.x = 85;
			temp.y = 51;
			return temp;
		}

		private function lb_pk_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_pk = temp;
			temp.name = "lb_pk";
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "754";
			temp.textAlign = "right";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 83;
			temp.x = 127;
			temp.y = 97;
			return temp;
		}

		private function lb_qh_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_qh = temp;
			temp.name = "lb_qh";
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "754";
			temp.textAlign = "right";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 83;
			temp.x = 77;
			temp.y = 234;
			return temp;
		}

		private function lb_sb_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_sb = temp;
			temp.name = "lb_sb";
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "754";
			temp.textAlign = "right";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 83;
			temp.x = 77;
			temp.y = 34;
			return temp;
		}

		private function lb_shhm_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_shhm = temp;
			temp.name = "lb_shhm";
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "754";
			temp.textAlign = "right";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 83;
			temp.x = 77;
			temp.y = 254;
			return temp;
		}

		private function lb_shjc_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_shjc = temp;
			temp.name = "lb_shjc";
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "754";
			temp.textAlign = "right";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 83;
			temp.x = 77;
			temp.y = 281;
			return temp;
		}

		private function lb_tz_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_tz = temp;
			temp.name = "lb_tz";
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "754";
			temp.textAlign = "right";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 104;
			temp.x = 107;
			temp.y = 413;
			return temp;
		}

		private function lb_wf_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_wf = temp;
			temp.name = "lb_wf";
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "754";
			temp.textAlign = "right";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 152;
			temp.x = 58;
			temp.y = 228;
			return temp;
		}

		private function lb_wg_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_wg = temp;
			temp.name = "lb_wg";
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "754";
			temp.textAlign = "right";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 152;
			temp.x = 58;
			temp.y = 178;
			return temp;
		}

		private function lb_xxb_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_xxb = temp;
			temp.name = "lb_xxb";
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "754";
			temp.textAlign = "right";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 83;
			temp.x = 77;
			temp.y = 186;
			return temp;
		}

		private function lb_xxz_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_xxz = temp;
			temp.name = "lb_xxz";
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "754";
			temp.textAlign = "right";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 83;
			temp.x = 77;
			temp.y = 163;
			return temp;
		}

		private function lb_zj_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_zj = temp;
			temp.name = "lb_zj";
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "754";
			temp.textAlign = "right";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 83;
			temp.x = 77;
			temp.y = 302;
			return temp;
		}

		private function lb_zl_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_zl = temp;
			temp.name = "lb_zl";
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "754";
			temp.textAlign = "right";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 104;
			temp.x = 107;
			temp.y = 362;
			return temp;
		}

		private function numberPower_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			numberPower = temp;
			temp.name = "numberPower";
			temp.height = 41;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.label = "176689";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_power;
			temp.width = 135;
			temp.x = 203;
			temp.y = 510;
			temp.layout = __LookRoleSkin_HorizontalLayout1_i();
			return temp;
		}

		private function zd_left_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			zd_left = temp;
			temp.name = "zd_left";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_mount_btn_zd_left;
			temp.x = 173;
			temp.y = 481;
			return temp;
		}

		private function zd_right_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			zd_right = temp;
			temp.name = "zd_right";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_mount_btn_zd_right;
			temp.x = 252;
			temp.y = 481;
			return temp;
		}

	}
}