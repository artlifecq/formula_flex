package org.mokylin.skin.app.tips
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Tips_ZhuangBeiVS extends feathers.controls.StateSkin
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

		public var grp_icon:feathers.controls.Group;

		public var grp_zhandouli:feathers.controls.Group;

		public var imgLine1:feathers.controls.UIAsset;

		public var imgLine2:feathers.controls.UIAsset;

		public var imgLine3:feathers.controls.UIAsset;

		public var imgLine4:feathers.controls.UIAsset;

		public var imgLine5:feathers.controls.UIAsset;

		public var imgLine6:feathers.controls.UIAsset;

		public var lbl_buwei:feathers.controls.Label;

		public var lbl_pingzhi:feathers.controls.Label;

		public var lbl_titile:feathers.controls.Label;

		public var lbl_xuqiu:feathers.controls.Label;

		public var lbl_zhiye:feathers.controls.Label;

		public var numbers:feathers.controls.UINumber;

		public var tip_down:feathers.controls.UIAsset;

		public var tip_up:feathers.controls.UIAsset;

		public var uiChanchu:feathers.controls.UIAsset;

		public var uiDuibi:feathers.controls.UIAsset;

		public var uiJianTou:feathers.controls.UIAsset;

		public var uiJiazhi:feathers.controls.UIAsset;

		public var uiShuxing:feathers.controls.UIAsset;

		public var uiXilian:feathers.controls.UIAsset;

		public var uiZuomo:feathers.controls.UIAsset;

		public var yizhuangbei:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Tips_ZhuangBeiVS()
		{
			super();
			
			this.currentState = "normal";
			this.height = 568;
			this.width = 280;
			this.elementsContent = [bg_i(),lbl_titile_i(),imgLine1_i(),imgLine2_i(),imgLine3_i(),imgLine5_i(),imgLine4_i(),imgLine6_i(),grp_icon_i(),grp_zhandouli_i(),grp_head_i(),uiShuxing_i(),uiZuomo_i(),uiXilian_i(),uiChanchu_i(),uiJiazhi_i(),uiDuibi_i(),__Tips_ZhuangBeiVS_Group1_i(),__Tips_ZhuangBeiVS_Group2_i(),yizhuangbei_i(),uiJianTou_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Tips_ZhuangBeiVS_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 10;
			temp.y = 179;
			temp.elementsContent = [];
			return temp;
		}

		private function __Tips_ZhuangBeiVS_Group2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 10;
			temp.y = 462;
			temp.elementsContent = [];
			return temp;
		}

		private function __Tips_ZhuangBeiVS_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "装备等级：";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Tips_ZhuangBeiVS_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "品质等级：";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 0;
			temp.y = 20;
			return temp;
		}

		private function __Tips_ZhuangBeiVS_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "职    业：";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 146;
			temp.y = 0;
			return temp;
		}

		private function __Tips_ZhuangBeiVS_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "部    位：";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 146;
			temp.y = 20;
			return temp;
		}

		private function __Tips_ZhuangBeiVS_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tips/zhuangbei/bg_buttom2.png";
			temp.x = 0;
			temp.y = 489;
			return temp;
		}

		private function __Tips_ZhuangBeiVS_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/grid/normal/64.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Tips_ZhuangBeiVS_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/zhandouli.png";
			temp.x = 0;
			temp.y = 4;
			return temp;
		}

		private function bg_bai_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg_bai = temp;
			temp.name = "bg_bai";
			temp.height = 489;
			temp.styleName = "ui/common/tips/zhuangbei/bg_bai.png";
			temp.visible = false;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg_hong_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg_hong = temp;
			temp.name = "bg_hong";
			temp.height = 489;
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
			temp.height = 489;
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
			temp.elementsContent = [__Tips_ZhuangBeiVS_UIAsset1_i(),bg_lv_i(),bg_lan_i(),bg_zi_i(),bg_huang_i(),bg_bai_i(),bg_hong_i()];
			return temp;
		}

		private function bg_lan_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg_lan = temp;
			temp.name = "bg_lan";
			temp.height = 489;
			temp.styleName = "ui/common/tips/zhuangbei/bg_lan.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg_lv_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg_lv = temp;
			temp.name = "bg_lv";
			temp.height = 489;
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
			temp.height = 489;
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
			temp.elementsContent = [__Tips_ZhuangBeiVS_Label1_i(),__Tips_ZhuangBeiVS_Label2_i(),lbl_xuqiu_i(),lbl_pingzhi_i(),__Tips_ZhuangBeiVS_Label3_i(),__Tips_ZhuangBeiVS_Label4_i(),lbl_zhiye_i(),lbl_buwei_i()];
			return temp;
		}

		private function grp_icon_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_icon = temp;
			temp.name = "grp_icon";
			temp.x = 13;
			temp.y = 39;
			temp.elementsContent = [__Tips_ZhuangBeiVS_UIAsset2_i()];
			return temp;
		}

		private function grp_zhandouli_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_zhandouli = temp;
			temp.name = "grp_zhandouli";
			temp.x = 110;
			temp.y = 59;
			temp.elementsContent = [numbers_i(),__Tips_ZhuangBeiVS_UIAsset3_i(),tip_down_i(),tip_up_i()];
			return temp;
		}

		private function imgLine1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgLine1 = temp;
			temp.name = "imgLine1";
			temp.styleName = "ui/common/tips/xian.png";
			temp.x = 8;
			temp.y = 166;
			return temp;
		}

		private function imgLine2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgLine2 = temp;
			temp.name = "imgLine2";
			temp.styleName = "ui/common/tips/xian.png";
			temp.x = 8;
			temp.y = 264;
			return temp;
		}

		private function imgLine3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgLine3 = temp;
			temp.name = "imgLine3";
			temp.styleName = "ui/common/tips/xian.png";
			temp.x = 8;
			temp.y = 320;
			return temp;
		}

		private function imgLine4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgLine4 = temp;
			temp.name = "imgLine4";
			temp.styleName = "ui/common/tips/xian.png";
			temp.x = 8;
			temp.y = 376;
			return temp;
		}

		private function imgLine5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgLine5 = temp;
			temp.name = "imgLine5";
			temp.styleName = "ui/common/tips/xian.png";
			temp.x = 8;
			temp.y = 434;
			return temp;
		}

		private function imgLine6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgLine6 = temp;
			temp.name = "imgLine6";
			temp.styleName = "ui/common/tips/xian.png";
			temp.x = 8;
			temp.y = 489;
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

		private function uiChanchu_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiChanchu = temp;
			temp.name = "uiChanchu";
			temp.styleName = "ui/common/tips/zhuangbei/zhuangbeichanchu.png";
			temp.x = 13;
			temp.y = 389;
			return temp;
		}

		private function uiDuibi_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiDuibi = temp;
			temp.name = "uiDuibi";
			temp.styleName = "ui/common/tips/zhuangbei/shuxingduibi.png";
			temp.x = 13;
			temp.y = 500;
			return temp;
		}

		private function uiJianTou_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiJianTou = temp;
			temp.name = "uiJianTou";
			temp.styleName = "ui/common/jiantou.png";
			temp.x = -28;
			temp.y = 258;
			return temp;
		}

		private function uiJiazhi_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiJiazhi = temp;
			temp.name = "uiJiazhi";
			temp.styleName = "ui/common/tips/zhuangbei/chushoujiage.png";
			temp.x = 13;
			temp.y = 445;
			return temp;
		}

		private function uiShuxing_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiShuxing = temp;
			temp.name = "uiShuxing";
			temp.styleName = "ui/common/tips/zhuangbei/jichushuxing.png";
			temp.x = 13;
			temp.y = 178;
			return temp;
		}

		private function uiXilian_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiXilian = temp;
			temp.name = "uiXilian";
			temp.styleName = "ui/common/tips/zhuangbei/xilianshuxing.png";
			temp.x = 13;
			temp.y = 331;
			return temp;
		}

		private function uiZuomo_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiZuomo = temp;
			temp.name = "uiZuomo";
			temp.styleName = "ui/common/tips/zhuangbei/zhuomodengji.png";
			temp.x = 13;
			temp.y = 275;
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