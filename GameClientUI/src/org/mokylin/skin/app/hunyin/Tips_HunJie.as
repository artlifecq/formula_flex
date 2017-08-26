package org.mokylin.skin.app.hunyin
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.app.hunyin.number.UINumberHunyin_jie;
	import org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Tips_HunJie extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.Group;

		public var bg_di:feathers.controls.UIAsset;

		public var bg_huang:feathers.controls.UIAsset;

		public var bg_lan:feathers.controls.UIAsset;

		public var bg_zi:feathers.controls.UIAsset;

		public var grpDengjie:feathers.controls.Group;

		public var grp_head:feathers.controls.Group;

		public var grp_icon:feathers.controls.Group;

		public var grp_zhandouli:feathers.controls.Group;

		public var imgLine1:feathers.controls.UIAsset;

		public var lbTitle:feathers.controls.Label;

		public var lbl_gongj0:feathers.controls.Label;

		public var lbl_gongj1:feathers.controls.Label;

		public var lbl_pingzhi:feathers.controls.Label;

		public var lbl_xuqiu:feathers.controls.Label;

		public var numJie:feathers.controls.UINumber;

		public var numbers:feathers.controls.UINumber;

		public var tip_down:feathers.controls.UIAsset;

		public var tip_up:feathers.controls.UIAsset;

		public var uiShuxing:feathers.controls.UIAsset;

		public var ui_kuang:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Tips_HunJie()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [bg_di_i(),bg_i(),imgLine1_i(),lbTitle_i(),grp_icon_i(),grp_zhandouli_i(),grpDengjie_i(),grp_head_i(),uiShuxing_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Tips_HunJie_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			return temp;
		}

		private function __Tips_HunJie_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "需求等级：";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Tips_HunJie_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "品质等级：";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 146;
			temp.y = 0;
			return temp;
		}

		private function __Tips_HunJie_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/art_txt/common/zhandouli.png";
			temp.x = 0;
			temp.y = 4;
			return temp;
		}

		private function __Tips_HunJie_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/art_txt/common/dengjie.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg_di_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg_di = temp;
			temp.name = "bg_di";
			temp.styleName = "ui/common/tips/zhuangbei/bg_buttom1.png";
			temp.x = 0;
			temp.y = 205;
			return temp;
		}

		private function bg_huang_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg_huang = temp;
			temp.name = "bg_huang";
			temp.height = 205;
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
			temp.elementsContent = [bg_lan_i(),bg_zi_i(),bg_huang_i()];
			return temp;
		}

		private function bg_lan_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg_lan = temp;
			temp.name = "bg_lan";
			temp.height = 205;
			temp.styleName = "ui/common/tips/zhuangbei/bg_lan.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg_zi_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg_zi = temp;
			temp.name = "bg_zi";
			temp.height = 205;
			temp.styleName = "ui/common/tips/zhuangbei/bg_zi.png";
			temp.visible = false;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function grpDengjie_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpDengjie = temp;
			temp.name = "grpDengjie";
			temp.x = 95;
			temp.y = 68;
			temp.elementsContent = [numJie_i(),__Tips_HunJie_UIAsset2_i()];
			return temp;
		}

		private function grp_head_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_head = temp;
			temp.name = "grp_head";
			temp.x = 11;
			temp.y = 122;
			temp.elementsContent = [__Tips_HunJie_Label2_i(),__Tips_HunJie_Label3_i(),lbl_xuqiu_i(),lbl_pingzhi_i()];
			return temp;
		}

		private function grp_icon_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_icon = temp;
			temp.name = "grp_icon";
			temp.x = 13;
			temp.y = 41;
			temp.elementsContent = [ui_kuang_i()];
			return temp;
		}

		private function grp_zhandouli_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_zhandouli = temp;
			temp.name = "grp_zhandouli";
			temp.x = 95;
			temp.y = 39;
			temp.elementsContent = [numbers_i(),__Tips_HunJie_UIAsset1_i(),tip_down_i(),tip_up_i()];
			return temp;
		}

		private function imgLine1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgLine1 = temp;
			temp.name = "imgLine1";
			temp.styleName = "ui/common/tips/xian.png";
			temp.x = 8;
			temp.y = 149;
			return temp;
		}

		private function lbTitle_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTitle = temp;
			temp.name = "lbTitle";
			temp.bold = true;
			temp.letterSpacing = -1;
			temp.fontSize = 16;
			temp.text = "心心相印";
			temp.textAlign = "center";
			temp.color = 0x00DFFF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 260;
			temp.x = 10;
			temp.y = 11;
			return temp;
		}

		private function lbl_pingzhi_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_pingzhi = temp;
			temp.name = "lbl_pingzhi";
			temp.text = "四阶";
			temp.color = 0xE2D8BE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 48;
			temp.x = 217;
			temp.y = 0;
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

		private function numJie_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			numJie = temp;
			temp.name = "numJie";
			temp.gap = -1;
			temp.height = 18;
			temp.label = "132";
			temp.styleClass = org.mokylin.skin.app.hunyin.number.UINumberHunyin_jie;
			temp.width = 46;
			temp.x = 55;
			temp.y = 4;
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
			temp.layout = __Tips_HunJie_HorizontalLayout1_i();
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

		private function uiShuxing_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiShuxing = temp;
			temp.name = "uiShuxing";
			temp.styleName = "ui/art_txt/common/tips/zhuangbei/jichushuxing.png";
			temp.x = 13;
			temp.y = 161;
			return temp;
		}

		private function ui_kuang_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ui_kuang = temp;
			temp.name = "ui_kuang";
			temp.styleName = "ui/common/grid/normal/64.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}