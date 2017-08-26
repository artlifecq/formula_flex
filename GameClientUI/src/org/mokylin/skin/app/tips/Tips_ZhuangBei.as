package org.mokylin.skin.app.tips
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Tips_ZhuangBei extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.Group;

		public var bg_bai:feathers.controls.UIAsset;

		public var bg_hong:feathers.controls.UIAsset;

		public var bg_huang:feathers.controls.UIAsset;

		public var bg_lan:feathers.controls.UIAsset;

		public var bg_lv:feathers.controls.UIAsset;

		public var bg_zi:feathers.controls.UIAsset;

		public var grp_head:feathers.controls.Group;

		public var grp_zhandouli:feathers.controls.Group;

		public var lb_power:feathers.controls.Label;

		public var lbl_bangding:feathers.controls.Label;

		public var lbl_buwei:feathers.controls.Label;

		public var lbl_pingzhi:feathers.controls.Label;

		public var lbl_titile:feathers.controls.Label;

		public var lbl_xuqiu:feathers.controls.Label;

		public var lbl_zhiye:feathers.controls.Label;

		public var numbers:feathers.controls.UINumber;

		public var tip_down:feathers.controls.UIAsset;

		public var tip_up:feathers.controls.UIAsset;

		public var uiKuang:feathers.controls.UIAsset;

		public var ui_di:feathers.controls.UIAsset;

		public var yizhuangbei:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Tips_ZhuangBei()
		{
			super();
			
			this.currentState = "normal";
			this.width = 280;
			this.elementsContent = [ui_di_i(),bg_i(),lbl_titile_i(),grp_zhandouli_i(),grp_head_i(),yizhuangbei_i(),lbl_bangding_i(),uiKuang_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Tips_ZhuangBei_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			return temp;
		}

		private function __Tips_ZhuangBei_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "装备等级：";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Tips_ZhuangBei_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "品质等级：";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 0;
			temp.y = 20;
			return temp;
		}

		private function __Tips_ZhuangBei_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "职    业：";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 146;
			temp.y = 0;
			return temp;
		}

		private function __Tips_ZhuangBei_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "部    位：";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 146;
			temp.y = 20;
			return temp;
		}

		private function __Tips_ZhuangBei_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/art_txt/common/zhandouli.png";
			temp.x = 0;
			temp.y = 4;
			return temp;
		}

		private function bg_bai_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg_bai = temp;
			temp.name = "bg_bai";
			temp.height = 462;
			temp.styleName = "ui/common/tips/zhuangbei/bg_bai.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg_hong_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg_hong = temp;
			temp.name = "bg_hong";
			temp.height = 462;
			temp.styleName = "ui/common/tips/zhuangbei/bg_hong.png";
			temp.visible = false;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg_huang_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg_huang = temp;
			temp.name = "bg_huang";
			temp.height = 462;
			temp.styleName = "ui/common/tips/zhuangbei/bg_jin.png";
			temp.visible = false;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			bg = temp;
			temp.name = "bg";
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [bg_bai_i(),bg_lv_i(),bg_lan_i(),bg_zi_i(),bg_huang_i(),bg_hong_i()];
			return temp;
		}

		private function bg_lan_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg_lan = temp;
			temp.name = "bg_lan";
			temp.height = 462;
			temp.styleName = "ui/common/tips/zhuangbei/bg_lan.png";
			temp.visible = false;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg_lv_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg_lv = temp;
			temp.name = "bg_lv";
			temp.height = 462;
			temp.styleName = "ui/common/tips/zhuangbei/bg_lv.png";
			temp.visible = false;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg_zi_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg_zi = temp;
			temp.name = "bg_zi";
			temp.height = 462;
			temp.styleName = "ui/common/tips/zhuangbei/bg_zi.png";
			temp.visible = false;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function grp_head_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_head = temp;
			temp.name = "grp_head";
			temp.x = 10;
			temp.y = 119;
			temp.elementsContent = [__Tips_ZhuangBei_Label1_i(),__Tips_ZhuangBei_Label2_i(),lbl_xuqiu_i(),lbl_pingzhi_i(),__Tips_ZhuangBei_Label3_i(),__Tips_ZhuangBei_Label4_i(),lbl_zhiye_i(),lbl_buwei_i()];
			return temp;
		}

		private function grp_zhandouli_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_zhandouli = temp;
			temp.name = "grp_zhandouli";
			temp.x = 110;
			temp.y = 59;
			temp.elementsContent = [numbers_i(),__Tips_ZhuangBei_UIAsset2_i(),tip_down_i(),tip_up_i(),lb_power_i()];
			return temp;
		}

		private function lb_power_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_power = temp;
			temp.name = "lb_power";
			temp.text = "12";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 133;
			temp.y = 6;
			return temp;
		}

		private function lbl_bangding_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_bangding = temp;
			temp.name = "lbl_bangding";
			temp.text = "【已绑定】";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 74;
			temp.x = 190;
			temp.y = 459;
			return temp;
		}

		private function lbl_buwei_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_buwei = temp;
			temp.name = "lbl_buwei";
			temp.text = "头部";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 48;
			temp.x = 216;
			temp.y = 20;
			return temp;
		}

		private function lbl_pingzhi_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_pingzhi = temp;
			temp.name = "lbl_pingzhi";
			temp.text = "55";
			temp.color = 0xE2D8BE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 76;
			temp.x = 71;
			temp.y = 20;
			return temp;
		}

		private function lbl_titile_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_titile = temp;
			temp.name = "lbl_titile";
			temp.bold = true;
			temp.letterSpacing = 0;
			temp.fontSize = 16;
			temp.text = "物品名字(居中)";
			temp.textAlign = "center";
			temp.color = 0x14A3F3;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 260;
			temp.x = 14;
			temp.y = 11;
			return temp;
		}

		private function lbl_xuqiu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_xuqiu = temp;
			temp.name = "lbl_xuqiu";
			temp.text = "30级";
			temp.color = 0xFF0D0D;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 76;
			temp.x = 71;
			temp.y = 0;
			return temp;
		}

		private function lbl_zhiye_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_zhiye = temp;
			temp.name = "lbl_zhiye";
			temp.text = "兵家";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 48;
			temp.x = 216;
			temp.y = 0;
			return temp;
		}

		private function numbers_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			numbers = temp;
			temp.name = "numbers";
			temp.gap = -1;
			temp.height = 25;
			temp.label = "65214";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli;
			temp.width = 89;
			temp.x = 56;
			temp.y = 4;
			temp.layout = __Tips_ZhuangBei_HorizontalLayout1_i();
			return temp;
		}

		private function tip_down_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			tip_down = temp;
			temp.name = "tip_down";
			temp.styleName = "ui/common/tubiao/jobdown.png";
			temp.x = 122;
			temp.y = 8;
			return temp;
		}

		private function tip_up_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			tip_up = temp;
			temp.name = "tip_up";
			temp.styleName = "ui/common/tubiao/jobup.png";
			temp.x = 122;
			temp.y = 8;
			return temp;
		}

		private function uiKuang_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiKuang = temp;
			temp.name = "uiKuang";
			temp.height = 488;
			temp.styleName = "ui/common/hover/tipsgaoxian.png";
			temp.width = 280;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function ui_di_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ui_di = temp;
			temp.name = "ui_di";
			temp.styleName = "ui/common/tips/zhuangbei/bg_buttom1.png";
			temp.x = 0;
			temp.y = 462;
			return temp;
		}

		private function yizhuangbei_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			yizhuangbei = temp;
			temp.name = "yizhuangbei";
			temp.styleName = "ui/common/yzb.png";
			temp.x = 152;
			temp.y = 81;
			return temp;
		}

	}
}