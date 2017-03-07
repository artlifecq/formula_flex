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
	public class zhuangbeiTips_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg_bai:feathers.controls.UIAsset;

		public var bg_cheng:feathers.controls.UIAsset;

		public var bg_hong:feathers.controls.UIAsset;

		public var bg_lan:feathers.controls.UIAsset;

		public var bg_lv:feathers.controls.UIAsset;

		public var bg_zi:feathers.controls.UIAsset;

		public var grp_duibi:feathers.controls.Group;

		public var grp_head:feathers.controls.Group;

		public var grp_icon:feathers.controls.Group;

		public var grp_titlebg:feathers.controls.Group;

		public var grp_zhandouli:feathers.controls.Group;

		public var imgBG:feathers.controls.UIAsset;

		public var isLock:feathers.controls.Label;

		public var lbl_buwei:feathers.controls.Label;

		public var lbl_pingzhi:feathers.controls.Label;

		public var lbl_qianghua:feathers.controls.Label;

		public var lbl_qianghuatitle:feathers.controls.Label;

		public var lbl_titile:feathers.controls.Label;

		public var lbl_xuqiu:feathers.controls.Label;

		public var lbl_zhiye:feathers.controls.Label;

		public var lbl_zhuomo:feathers.controls.Label;

		public var numbers:feathers.controls.UINumber;

		public var tip_down:feathers.controls.UIAsset;

		public var tip_up:feathers.controls.UIAsset;

		public var titlebg_bai:feathers.controls.UIAsset;

		public var titlebg_cheng:feathers.controls.UIAsset;

		public var titlebg_hong:feathers.controls.UIAsset;

		public var titlebg_lan:feathers.controls.UIAsset;

		public var titlebg_lv:feathers.controls.UIAsset;

		public var titlebg_zi:feathers.controls.UIAsset;

		public var xilian_tip:feathers.controls.Label;

		public var yizhuangbei:feathers.controls.UIAsset;

		public var zhuangbei_bg:feathers.controls.Group;

		public var zhuomo_tip:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function zhuangbeiTips_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 479;
			this.width = 283;
			this.elementsContent = [imgBG_i(),grp_titlebg_i(),lbl_titile_i(),zhuangbei_bg_i(),grp_icon_i(),grp_zhandouli_i(),grp_head_i(),lbl_qianghuatitle_i(),lbl_qianghua_i(),grp_duibi_i(),yizhuangbei_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __zhuangbeiTips_Skin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = -4;
			return temp;
		}

		private function __zhuangbeiTips_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "需求等级：";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __zhuangbeiTips_Skin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "品质等级：";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 24;
			return temp;
		}

		private function __zhuangbeiTips_Skin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "职业：";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 154;
			temp.y = 0;
			return temp;
		}

		private function __zhuangbeiTips_Skin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "部位：";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 154;
			temp.y = 24;
			return temp;
		}

		private function __zhuangbeiTips_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/64.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __zhuangbeiTips_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/zhandouli.png";
			temp.x = 0;
			temp.y = 4;
			return temp;
		}

		private function __zhuangbeiTips_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/biaoti_bg.png";
			return temp;
		}

		private function __zhuangbeiTips_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/sxdb.png";
			temp.y = 4;
			return temp;
		}

		private function bg_bai_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg_bai = temp;
			temp.name = "bg_bai";
			temp.styleName = "ui/common/tips/mc/icon_bg/di_bai.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg_cheng_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg_cheng = temp;
			temp.name = "bg_cheng";
			temp.styleName = "ui/common/tips/mc/icon_bg/di_cheng.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg_hong_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg_hong = temp;
			temp.name = "bg_hong";
			temp.styleName = "ui/common/tips/mc/icon_bg/di_hong.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg_lan_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg_lan = temp;
			temp.name = "bg_lan";
			temp.styleName = "ui/common/tips/mc/icon_bg/di_lan.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg_lv_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg_lv = temp;
			temp.name = "bg_lv";
			temp.styleName = "ui/common/tips/mc/icon_bg/di_lv.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg_zi_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg_zi = temp;
			temp.name = "bg_zi";
			temp.styleName = "ui/common/tips/mc/icon_bg/di_zi.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function grp_duibi_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_duibi = temp;
			temp.name = "grp_duibi";
			temp.x = 9;
			temp.y = 503;
			temp.elementsContent = [__zhuangbeiTips_Skin_UIAsset4_i(),__zhuangbeiTips_Skin_UIAsset5_i()];
			return temp;
		}

		private function grp_head_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_head = temp;
			temp.name = "grp_head";
			temp.x = 9;
			temp.y = 113;
			temp.elementsContent = [__zhuangbeiTips_Skin_Label1_i(),__zhuangbeiTips_Skin_Label2_i(),lbl_xuqiu_i(),lbl_pingzhi_i(),__zhuangbeiTips_Skin_Label3_i(),__zhuangbeiTips_Skin_Label4_i(),lbl_zhiye_i(),lbl_buwei_i()];
			return temp;
		}

		private function grp_icon_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_icon = temp;
			temp.name = "grp_icon";
			temp.x = 7;
			temp.y = 36;
			temp.elementsContent = [__zhuangbeiTips_Skin_UIAsset1_i()];
			return temp;
		}

		private function grp_titlebg_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_titlebg = temp;
			temp.name = "grp_titlebg";
			temp.x = 73;
			temp.y = 4;
			temp.elementsContent = [titlebg_bai_i(),titlebg_lv_i(),titlebg_lan_i(),titlebg_zi_i(),titlebg_cheng_i(),titlebg_hong_i()];
			return temp;
		}

		private function grp_zhandouli_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_zhandouli = temp;
			temp.name = "grp_zhandouli";
			temp.x = 88;
			temp.y = 44;
			temp.elementsContent = [numbers_i(),__zhuangbeiTips_Skin_UIAsset2_i(),tip_down_i(),tip_up_i(),isLock_i()];
			return temp;
		}

		private function imgBG_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBG = temp;
			temp.name = "imgBG";
			temp.height = 545;
			temp.styleName = "ui/common/tips/tips_1.png";
			temp.width = 283;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function isLock_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			isLock = temp;
			temp.name = "isLock";
			temp.text = "【已绑定】";
			temp.color = 0xE1201C;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = -5;
			temp.y = 31;
			return temp;
		}

		private function lbl_buwei_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_buwei = temp;
			temp.name = "lbl_buwei";
			temp.text = "头部";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 68;
			temp.x = 197;
			temp.y = 24;
			return temp;
		}

		private function lbl_pingzhi_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_pingzhi = temp;
			temp.name = "lbl_pingzhi";
			temp.text = "55";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 76;
			temp.x = 71;
			temp.y = 24;
			return temp;
		}

		private function lbl_qianghua_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_qianghua = temp;
			temp.name = "lbl_qianghua";
			temp.text = "0/24";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 49;
			temp.x = 225;
			temp.y = 164;
			return temp;
		}

		private function lbl_qianghuatitle_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_qianghuatitle = temp;
			temp.name = "lbl_qianghuatitle";
			temp.text = "强化等级：";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 153;
			temp.y = 164;
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
			temp.text = "物品名字最多九个字 +21";
			temp.textAlign = "center";
			temp.color = 0x6BCC08;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 283;
			temp.x = 0;
			temp.y = 7;
			return temp;
		}

		private function lbl_xuqiu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_xuqiu = temp;
			temp.name = "lbl_xuqiu";
			temp.text = "一转30级";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
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
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 68;
			temp.x = 197;
			temp.y = 0;
			return temp;
		}

		private function numbers_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			numbers = temp;
			temp.name = "numbers";
			temp.height = 25;
			temp.label = "6521478";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli;
			temp.width = 139;
			temp.x = 54;
			temp.y = 0;
			temp.layout = __zhuangbeiTips_Skin_HorizontalLayout1_i();
			return temp;
		}

		private function tip_down_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			tip_down = temp;
			temp.name = "tip_down";
			temp.styleName = "ui/common/tubiao/xiangxia.png";
			temp.x = 162;
			temp.y = 6;
			return temp;
		}

		private function tip_up_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			tip_up = temp;
			temp.name = "tip_up";
			temp.styleName = "ui/common/tubiao/xiangshang.png";
			temp.x = 162;
			temp.y = 6;
			return temp;
		}

		private function titlebg_bai_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			titlebg_bai = temp;
			temp.name = "titlebg_bai";
			temp.styleName = "ui/common/tips/mc/title_bg/title_bg1.png";
			temp.visible = false;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function titlebg_cheng_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			titlebg_cheng = temp;
			temp.name = "titlebg_cheng";
			temp.styleName = "ui/common/tips/mc/title_bg/title_bg5.png";
			temp.visible = false;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function titlebg_hong_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			titlebg_hong = temp;
			temp.name = "titlebg_hong";
			temp.styleName = "ui/common/tips/mc/title_bg/title_bg6.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function titlebg_lan_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			titlebg_lan = temp;
			temp.name = "titlebg_lan";
			temp.styleName = "ui/common/tips/mc/title_bg/title_bg3.png";
			temp.visible = false;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function titlebg_lv_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			titlebg_lv = temp;
			temp.name = "titlebg_lv";
			temp.styleName = "ui/common/tips/mc/title_bg/title_bg2.png";
			temp.visible = false;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function titlebg_zi_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			titlebg_zi = temp;
			temp.name = "titlebg_zi";
			temp.styleName = "ui/common/tips/mc/title_bg/title_bg4.png";
			temp.visible = false;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function yizhuangbei_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			yizhuangbei = temp;
			temp.name = "yizhuangbei";
			temp.styleName = "ui/common/yzb.png";
			temp.x = 167;
			temp.y = 73;
			return temp;
		}

		private function zhuangbei_bg_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			zhuangbei_bg = temp;
			temp.name = "zhuangbei_bg";
			temp.x = 79;
			temp.y = 41;
			temp.elementsContent = [bg_bai_i(),bg_lv_i(),bg_lan_i(),bg_zi_i(),bg_hong_i(),bg_cheng_i()];
			return temp;
		}

	}
}