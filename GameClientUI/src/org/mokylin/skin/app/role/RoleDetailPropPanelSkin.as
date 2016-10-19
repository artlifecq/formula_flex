package org.mokylin.skin.app.role
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class RoleDetailPropPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var lb_bj:feathers.controls.Label;

		public var lb_dy:feathers.controls.Label;

		public var lb_fsl:feathers.controls.Label;

		public var lb_hf:feathers.controls.Label;

		public var lb_kb:feathers.controls.Label;

		public var lb_mz:feathers.controls.Label;

		public var lb_qh:feathers.controls.Label;

		public var lb_sb:feathers.controls.Label;

		public var lb_shhm:feathers.controls.Label;

		public var lb_shjc:feathers.controls.Label;

		public var lb_xxb:feathers.controls.Label;

		public var lb_xxz:feathers.controls.Label;

		public var lb_zj:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function RoleDetailPropPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 476;
			this.width = 218;
			this.elementsContent = [bg_i(),__RoleDetailPropPanelSkin_UIAsset1_i(),__RoleDetailPropPanelSkin_Label1_i(),__RoleDetailPropPanelSkin_UIAsset2_i(),__RoleDetailPropPanelSkin_UIAsset3_i(),__RoleDetailPropPanelSkin_UIAsset4_i(),__RoleDetailPropPanelSkin_UIAsset5_i(),__RoleDetailPropPanelSkin_UIAsset6_i(),__RoleDetailPropPanelSkin_UIAsset7_i(),__RoleDetailPropPanelSkin_UIAsset8_i(),__RoleDetailPropPanelSkin_UIAsset9_i(),__RoleDetailPropPanelSkin_UIAsset10_i(),__RoleDetailPropPanelSkin_UIAsset11_i(),__RoleDetailPropPanelSkin_UIAsset12_i(),__RoleDetailPropPanelSkin_UIAsset13_i(),__RoleDetailPropPanelSkin_UIAsset14_i(),__RoleDetailPropPanelSkin_UIAsset15_i(),__RoleDetailPropPanelSkin_Label2_i(),__RoleDetailPropPanelSkin_Label3_i(),__RoleDetailPropPanelSkin_Label4_i(),__RoleDetailPropPanelSkin_Label5_i(),__RoleDetailPropPanelSkin_Label6_i(),__RoleDetailPropPanelSkin_Label7_i(),__RoleDetailPropPanelSkin_Label8_i(),__RoleDetailPropPanelSkin_Label9_i(),__RoleDetailPropPanelSkin_Label10_i(),__RoleDetailPropPanelSkin_Label11_i(),__RoleDetailPropPanelSkin_Label12_i(),__RoleDetailPropPanelSkin_Label13_i(),__RoleDetailPropPanelSkin_Label14_i(),lb_mz_i(),lb_sb_i(),lb_bj_i(),lb_kb_i(),lb_fsl_i(),lb_xxz_i(),lb_xxb_i(),lb_hf_i(),lb_qh_i(),lb_shhm_i(),lb_shjc_i(),lb_zj_i(),lb_dy_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __RoleDetailPropPanelSkin_Label10_i():feathers.controls.Label
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
			temp.x = 11;
			temp.y = 330;
			return temp;
		}

		private function __RoleDetailPropPanelSkin_Label11_i():feathers.controls.Label
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
			temp.x = 11;
			temp.y = 37;
			return temp;
		}

		private function __RoleDetailPropPanelSkin_Label12_i():feathers.controls.Label
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
			temp.x = 11;
			temp.y = 62;
			return temp;
		}

		private function __RoleDetailPropPanelSkin_Label13_i():feathers.controls.Label
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
			temp.x = 11;
			temp.y = 87;
			return temp;
		}

		private function __RoleDetailPropPanelSkin_Label14_i():feathers.controls.Label
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
			temp.x = 11;
			temp.y = 111;
			return temp;
		}

		private function __RoleDetailPropPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.fontSize = 14;
			temp.text = "特殊属性";
			temp.textAlign = "center";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 173;
			temp.x = 24;
			temp.y = 135;
			return temp;
		}

		private function __RoleDetailPropPanelSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.fontSize = 14;
			temp.text = "命  中：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 70;
			temp.x = 11;
			temp.y = 12;
			return temp;
		}

		private function __RoleDetailPropPanelSkin_Label3_i():feathers.controls.Label
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
			temp.x = 11;
			temp.y = 165;
			return temp;
		}

		private function __RoleDetailPropPanelSkin_Label4_i():feathers.controls.Label
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
			temp.x = 11;
			temp.y = 188;
			return temp;
		}

		private function __RoleDetailPropPanelSkin_Label5_i():feathers.controls.Label
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
			temp.x = 11;
			temp.y = 212;
			return temp;
		}

		private function __RoleDetailPropPanelSkin_Label6_i():feathers.controls.Label
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
			temp.x = 11;
			temp.y = 235;
			return temp;
		}

		private function __RoleDetailPropPanelSkin_Label7_i():feathers.controls.Label
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
			temp.x = 11;
			temp.y = 258;
			return temp;
		}

		private function __RoleDetailPropPanelSkin_Label8_i():feathers.controls.Label
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
			temp.x = 11;
			temp.y = 282;
			return temp;
		}

		private function __RoleDetailPropPanelSkin_Label9_i():feathers.controls.Label
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
			temp.x = 11;
			temp.y = 305;
			return temp;
		}

		private function __RoleDetailPropPanelSkin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/liebiao/property_bg.png";
			temp.x = 6;
			temp.y = 233;
			return temp;
		}

		private function __RoleDetailPropPanelSkin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/liebiao/property_bg.png";
			temp.x = 6;
			temp.y = 256;
			return temp;
		}

		private function __RoleDetailPropPanelSkin_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/liebiao/property_bg.png";
			temp.x = 6;
			temp.y = 280;
			return temp;
		}

		private function __RoleDetailPropPanelSkin_UIAsset13_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/liebiao/property_bg.png";
			temp.x = 6;
			temp.y = 303;
			return temp;
		}

		private function __RoleDetailPropPanelSkin_UIAsset14_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/liebiao/property_bg.png";
			temp.x = 6;
			temp.y = 328;
			return temp;
		}

		private function __RoleDetailPropPanelSkin_UIAsset15_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/role/more.png";
			temp.x = 18;
			temp.y = 387;
			return temp;
		}

		private function __RoleDetailPropPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 24;
			temp.styleName = "ui/common/liebiao/lie_biao_di.png";
			temp.width = 208;
			temp.x = 4;
			temp.y = 132;
			return temp;
		}

		private function __RoleDetailPropPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/liebiao/property_bg.png";
			temp.x = 6;
			temp.y = 11;
			return temp;
		}

		private function __RoleDetailPropPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/liebiao/property_bg.png";
			temp.x = 6;
			temp.y = 35.5;
			return temp;
		}

		private function __RoleDetailPropPanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/liebiao/property_bg.png";
			temp.x = 6;
			temp.y = 60.5;
			return temp;
		}

		private function __RoleDetailPropPanelSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/liebiao/property_bg.png";
			temp.x = 6;
			temp.y = 85.5;
			return temp;
		}

		private function __RoleDetailPropPanelSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/liebiao/property_bg.png";
			temp.x = 6;
			temp.y = 109.5;
			return temp;
		}

		private function __RoleDetailPropPanelSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/liebiao/property_bg.png";
			temp.x = 6;
			temp.y = 164;
			return temp;
		}

		private function __RoleDetailPropPanelSkin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/liebiao/property_bg.png";
			temp.x = 6;
			temp.y = 187;
			return temp;
		}

		private function __RoleDetailPropPanelSkin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/liebiao/property_bg.png";
			temp.x = 6;
			temp.y = 210;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 476;
			temp.styleName = "ui/common/kang/neikuang1.png";
			temp.width = 217;
			temp.x = 0;
			temp.y = 0;
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
			temp.x = 127;
			temp.y = 62;
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
			temp.x = 127;
			temp.y = 330;
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
			temp.x = 127;
			temp.y = 111;
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
			temp.x = 127;
			temp.y = 213;
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
			temp.x = 127;
			temp.y = 87;
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
			temp.x = 127;
			temp.y = 12.5;
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
			temp.x = 127;
			temp.y = 237;
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
			temp.x = 127;
			temp.y = 37;
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
			temp.x = 127;
			temp.y = 257;
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
			temp.x = 127;
			temp.y = 284;
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
			temp.x = 127;
			temp.y = 189;
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
			temp.x = 127;
			temp.y = 166;
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
			temp.x = 127;
			temp.y = 305;
			return temp;
		}

	}
}