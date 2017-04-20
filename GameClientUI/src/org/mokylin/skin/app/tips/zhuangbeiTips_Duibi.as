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
	public class zhuangbeiTips_Duibi extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var Icon_lock:feathers.controls.UIAsset;

		public var bg_bai:feathers.controls.UIAsset;

		public var bg_cheng:feathers.controls.UIAsset;

		public var bg_hong:feathers.controls.UIAsset;

		public var bg_lan:feathers.controls.UIAsset;

		public var bg_lv:feathers.controls.UIAsset;

		public var bg_zi:feathers.controls.UIAsset;

		public var grp_baseAttribute:feathers.controls.Group;

		public var grp_chanchu:feathers.controls.Group;

		public var grp_chushou:feathers.controls.Group;

		public var grp_duibi:feathers.controls.Group;

		public var grp_head:feathers.controls.Group;

		public var grp_icon:feathers.controls.Group;

		public var grp_line:feathers.controls.Group;

		public var grp_titlebg:feathers.controls.Group;

		public var grp_xilian:feathers.controls.Group;

		public var grp_zhandouli:feathers.controls.Group;

		public var grp_zhuomo:feathers.controls.Group;

		public var isLock:feathers.controls.Label;

		public var lbl_add_baojilv:feathers.controls.Label;

		public var lbl_add_fangyuli:feathers.controls.Label;

		public var lbl_add_fangyuli2:feathers.controls.Label;

		public var lbl_add_gongjili:feathers.controls.Label;

		public var lbl_add_gongjili2:feathers.controls.Label;

		public var lbl_add_mingzhonglv:feathers.controls.Label;

		public var lbl_baoji:feathers.controls.Label;

		public var lbl_buwei:feathers.controls.Label;

		public var lbl_gongji:feathers.controls.Label;

		public var lbl_mingzhong:feathers.controls.Label;

		public var lbl_pingzhi:feathers.controls.Label;

		public var lbl_qianghua:feathers.controls.Label;

		public var lbl_shoujia:feathers.controls.Label;

		public var lbl_titile:feathers.controls.Label;

		public var lbl_xuqiu:feathers.controls.Label;

		public var lbl_zhiye:feathers.controls.Label;

		public var lbl_zhuomo:feathers.controls.Label;

		public var line1:feathers.controls.UIAsset;

		public var line2:feathers.controls.UIAsset;

		public var line3:feathers.controls.UIAsset;

		public var line4:feathers.controls.UIAsset;

		public var line5:feathers.controls.UIAsset;

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

		public var zhuangbei_bg:feathers.controls.Group;

		public var zhuomo_tip:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function zhuangbeiTips_Duibi()
		{
			super();
			
			this.currentState = "normal";
			this.height = 600;
			this.width = 283;
			this.elementsContent = [__zhuangbeiTips_Duibi_UIAsset1_i(),grp_line_i(),grp_titlebg_i(),lbl_titile_i(),zhuangbei_bg_i(),grp_icon_i(),grp_zhandouli_i(),grp_head_i(),grp_baseAttribute_i(),grp_zhuomo_i(),grp_xilian_i(),grp_chanchu_i(),grp_chushou_i(),grp_duibi_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function Icon_lock_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icon_lock = temp;
			temp.name = "Icon_lock";
			temp.styleName = "ui/common/tubiao/suo.png";
			temp.x = 56;
			temp.y = 53;
			return temp;
		}

		private function __zhuangbeiTips_Duibi_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = -4;
			return temp;
		}

		private function __zhuangbeiTips_Duibi_Label10_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "琢磨等级：";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __zhuangbeiTips_Duibi_Label11_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "【洗练属性】";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = -6;
			temp.y = 0;
			return temp;
		}

		private function __zhuangbeiTips_Duibi_Label12_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "【装备产出】";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = -6;
			temp.y = 0;
			return temp;
		}

		private function __zhuangbeiTips_Duibi_Label13_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.htmlText = "<font color='#2083b9'>副本</font>掉落，<font color='#2083b9'>打野</font>掉落";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 22;
			return temp;
		}

		private function __zhuangbeiTips_Duibi_Label14_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "售价（银两）：";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 3;
			return temp;
		}

		private function __zhuangbeiTips_Duibi_Label15_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "攻击力：";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 1;
			temp.y = 26;
			return temp;
		}

		private function __zhuangbeiTips_Duibi_Label16_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "防御力：";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 138;
			temp.y = 26;
			return temp;
		}

		private function __zhuangbeiTips_Duibi_Label17_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "命中率：";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 1;
			temp.y = 51;
			return temp;
		}

		private function __zhuangbeiTips_Duibi_Label18_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "暴击率：";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 138;
			temp.y = 51;
			return temp;
		}

		private function __zhuangbeiTips_Duibi_Label19_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "攻击力：";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 1;
			temp.y = 78;
			return temp;
		}

		private function __zhuangbeiTips_Duibi_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "需求等级：";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __zhuangbeiTips_Duibi_Label20_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "防御力：";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 138;
			temp.y = 78;
			return temp;
		}

		private function __zhuangbeiTips_Duibi_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "品质等级：";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 24;
			return temp;
		}

		private function __zhuangbeiTips_Duibi_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "职业：";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 154;
			temp.y = 0;
			return temp;
		}

		private function __zhuangbeiTips_Duibi_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "部位：";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 154;
			temp.y = 24;
			return temp;
		}

		private function __zhuangbeiTips_Duibi_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.letterSpacing = 0;
			temp.text = "【基础属性】";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __zhuangbeiTips_Duibi_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "强化等级：";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 148;
			temp.y = 0;
			return temp;
		}

		private function __zhuangbeiTips_Duibi_Label7_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "攻击力：";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 5;
			temp.y = 20;
			return temp;
		}

		private function __zhuangbeiTips_Duibi_Label8_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "命中值：";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 5;
			temp.y = 41;
			return temp;
		}

		private function __zhuangbeiTips_Duibi_Label9_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "暴击值：";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 5;
			temp.y = 63;
			return temp;
		}

		private function __zhuangbeiTips_Duibi_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 600;
			temp.styleName = "ui/common/tips/tips_1.png";
			temp.width = 283;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __zhuangbeiTips_Duibi_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/64.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __zhuangbeiTips_Duibi_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/zhandouli.png";
			temp.x = 0;
			temp.y = 4;
			return temp;
		}

		private function __zhuangbeiTips_Duibi_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tubiao/yinzi_24.png";
			temp.x = 102;
			temp.y = 0;
			return temp;
		}

		private function __zhuangbeiTips_Duibi_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/biaoti_bg.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __zhuangbeiTips_Duibi_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/sxdb.png";
			temp.x = 2;
			temp.y = 3;
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

		private function grp_baseAttribute_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_baseAttribute = temp;
			temp.name = "grp_baseAttribute";
			temp.x = 5;
			temp.y = 170;
			temp.elementsContent = [__zhuangbeiTips_Duibi_Label5_i(),__zhuangbeiTips_Duibi_Label6_i(),__zhuangbeiTips_Duibi_Label7_i(),__zhuangbeiTips_Duibi_Label8_i(),__zhuangbeiTips_Duibi_Label9_i(),lbl_qianghua_i(),lbl_gongji_i(),lbl_mingzhong_i(),lbl_baoji_i()];
			return temp;
		}

		private function grp_chanchu_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_chanchu = temp;
			temp.name = "grp_chanchu";
			temp.x = 11;
			temp.y = 376;
			temp.elementsContent = [__zhuangbeiTips_Duibi_Label12_i(),__zhuangbeiTips_Duibi_Label13_i()];
			return temp;
		}

		private function grp_chushou_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_chushou = temp;
			temp.name = "grp_chushou";
			temp.x = 9;
			temp.y = 439;
			temp.elementsContent = [__zhuangbeiTips_Duibi_Label14_i(),lbl_shoujia_i(),__zhuangbeiTips_Duibi_UIAsset4_i()];
			return temp;
		}

		private function grp_duibi_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_duibi = temp;
			temp.name = "grp_duibi";
			temp.x = 10;
			temp.y = 487;
			temp.elementsContent = [__zhuangbeiTips_Duibi_Label15_i(),__zhuangbeiTips_Duibi_Label16_i(),__zhuangbeiTips_Duibi_Label17_i(),__zhuangbeiTips_Duibi_Label18_i(),__zhuangbeiTips_Duibi_Label19_i(),__zhuangbeiTips_Duibi_Label20_i(),lbl_add_gongjili_i(),lbl_add_fangyuli_i(),lbl_add_mingzhonglv_i(),lbl_add_baojilv_i(),lbl_add_gongjili2_i(),lbl_add_fangyuli2_i(),__zhuangbeiTips_Duibi_UIAsset5_i(),__zhuangbeiTips_Duibi_UIAsset6_i()];
			return temp;
		}

		private function grp_head_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_head = temp;
			temp.name = "grp_head";
			temp.x = 9;
			temp.y = 113;
			temp.elementsContent = [__zhuangbeiTips_Duibi_Label1_i(),__zhuangbeiTips_Duibi_Label2_i(),lbl_xuqiu_i(),lbl_pingzhi_i(),__zhuangbeiTips_Duibi_Label3_i(),__zhuangbeiTips_Duibi_Label4_i(),lbl_zhiye_i(),lbl_buwei_i()];
			return temp;
		}

		private function grp_icon_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_icon = temp;
			temp.name = "grp_icon";
			temp.x = 7;
			temp.y = 36;
			temp.elementsContent = [__zhuangbeiTips_Duibi_UIAsset2_i(),Icon_lock_i()];
			return temp;
		}

		private function grp_line_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_line = temp;
			temp.name = "grp_line";
			temp.x = 10;
			temp.y = 160;
			temp.elementsContent = [line1_i(),line2_i(),line3_i(),line4_i(),line5_i()];
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

		private function grp_xilian_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_xilian = temp;
			temp.name = "grp_xilian";
			temp.x = 11;
			temp.y = 320;
			temp.elementsContent = [__zhuangbeiTips_Duibi_Label11_i(),xilian_tip_i()];
			return temp;
		}

		private function grp_zhandouli_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_zhandouli = temp;
			temp.name = "grp_zhandouli";
			temp.x = 88;
			temp.y = 44;
			temp.elementsContent = [numbers_i(),__zhuangbeiTips_Duibi_UIAsset3_i(),tip_down_i(),tip_up_i(),isLock_i()];
			return temp;
		}

		private function grp_zhuomo_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_zhuomo = temp;
			temp.name = "grp_zhuomo";
			temp.x = 11;
			temp.y = 265;
			temp.elementsContent = [__zhuangbeiTips_Duibi_Label10_i(),zhuomo_tip_i(),lbl_zhuomo_i()];
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

		private function lbl_add_baojilv_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_add_baojilv = temp;
			temp.name = "lbl_add_baojilv";
			temp.height = 25;
			temp.text = "+11";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 49;
			temp.x = 210;
			temp.y = 51;
			return temp;
		}

		private function lbl_add_fangyuli2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_add_fangyuli2 = temp;
			temp.name = "lbl_add_fangyuli2";
			temp.height = 25;
			temp.text = "+11";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 49;
			temp.x = 210;
			temp.y = 78;
			return temp;
		}

		private function lbl_add_fangyuli_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_add_fangyuli = temp;
			temp.name = "lbl_add_fangyuli";
			temp.height = 25;
			temp.text = "+11";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 49;
			temp.x = 210;
			temp.y = 26;
			return temp;
		}

		private function lbl_add_gongjili2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_add_gongjili2 = temp;
			temp.name = "lbl_add_gongjili2";
			temp.height = 25;
			temp.text = "-11";
			temp.color = 0xE1201C;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 49;
			temp.x = 62;
			temp.y = 78;
			return temp;
		}

		private function lbl_add_gongjili_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_add_gongjili = temp;
			temp.name = "lbl_add_gongjili";
			temp.height = 25;
			temp.text = "-11";
			temp.color = 0xE1201C;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 49;
			temp.x = 62;
			temp.y = 26;
			return temp;
		}

		private function lbl_add_mingzhonglv_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_add_mingzhonglv = temp;
			temp.name = "lbl_add_mingzhonglv";
			temp.height = 25;
			temp.text = "-11";
			temp.color = 0xE1201C;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 49;
			temp.x = 62;
			temp.y = 51;
			return temp;
		}

		private function lbl_baoji_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_baoji = temp;
			temp.name = "lbl_baoji";
			temp.text = "100";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 76;
			temp.x = 63;
			temp.y = 63;
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

		private function lbl_gongji_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_gongji = temp;
			temp.name = "lbl_gongji";
			temp.text = "100";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 76;
			temp.x = 63;
			temp.y = 20;
			return temp;
		}

		private function lbl_mingzhong_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_mingzhong = temp;
			temp.name = "lbl_mingzhong";
			temp.text = "100";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 76;
			temp.x = 63;
			temp.y = 41;
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
			temp.x = 220;
			temp.y = 0;
			return temp;
		}

		private function lbl_shoujia_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_shoujia = temp;
			temp.name = "lbl_shoujia";
			temp.height = 21;
			temp.text = "100";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 112;
			temp.x = 129;
			temp.y = 3;
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
			temp.color = 0x6BCC08;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 63;
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

		private function lbl_zhuomo_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_zhuomo = temp;
			temp.name = "lbl_zhuomo";
			temp.text = "0/24";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 38;
			temp.x = 73;
			temp.y = 0;
			return temp;
		}

		private function line1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			line1 = temp;
			temp.name = "line1";
			temp.styleName = "ui/common/tips/tips_1fengexian.png";
			temp.width = 257;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function line2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			line2 = temp;
			temp.name = "line2";
			temp.styleName = "ui/common/tips/tips_1fengexian.png";
			temp.width = 257;
			temp.x = 0;
			temp.y = 99;
			return temp;
		}

		private function line3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			line3 = temp;
			temp.name = "line3";
			temp.styleName = "ui/common/tips/tips_1fengexian.png";
			temp.width = 257;
			temp.x = 0;
			temp.y = 154;
			return temp;
		}

		private function line4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			line4 = temp;
			temp.name = "line4";
			temp.styleName = "ui/common/tips/tips_1fengexian.png";
			temp.width = 257;
			temp.x = 0;
			temp.y = 210;
			return temp;
		}

		private function line5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			line5 = temp;
			temp.name = "line5";
			temp.styleName = "ui/common/tips/tips_1fengexian.png";
			temp.width = 257;
			temp.x = 0;
			temp.y = 266;
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
			temp.layout = __zhuangbeiTips_Duibi_HorizontalLayout1_i();
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

		private function xilian_tip_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			xilian_tip = temp;
			temp.name = "xilian_tip";
			temp.text = "未激活";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 22;
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

		private function zhuomo_tip_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			zhuomo_tip = temp;
			temp.name = "zhuomo_tip";
			temp.text = "未激活";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 22;
			return temp;
		}

	}
}