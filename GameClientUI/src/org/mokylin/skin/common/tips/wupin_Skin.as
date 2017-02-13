package org.mokylin.skin.common.tips
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UIMovieClip;
	import feathers.controls.UINumber;
	import org.mokylin.skin.common.tips.mc.UIMovieClipTitle_bg;
	import org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class wupin_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var grp_date:feathers.controls.Group;

		public var grp_icon:feathers.controls.Group;

		public var grp_zhandouli:feathers.controls.Group;

		public var lbl_add_baojilv:feathers.controls.Label;

		public var lbl_add_cuoshang:feathers.controls.Label;

		public var lbl_add_fangyuli:feathers.controls.Label;

		public var lbl_add_fangyuli2:feathers.controls.Label;

		public var lbl_add_fengmang:feathers.controls.Label;

		public var lbl_add_gongjili:feathers.controls.Label;

		public var lbl_add_gongjili2:feathers.controls.Label;

		public var lbl_add_mingzhonglv:feathers.controls.Label;

		public var lbl_baoji:feathers.controls.Label;

		public var lbl_buwei:feathers.controls.Label;

		public var lbl_gongji:feathers.controls.Label;

		public var lbl_gongji_jihuo:feathers.controls.Label;

		public var lbl_jiangxin:feathers.controls.Label;

		public var lbl_jichu:feathers.controls.Label;

		public var lbl_mingzhong:feathers.controls.Label;

		public var lbl_name:feathers.controls.Label;

		public var lbl_pingzhi:feathers.controls.Label;

		public var lbl_qianghua:feathers.controls.Label;

		public var lbl_shoujia:feathers.controls.Label;

		public var lbl_tip_baoji:feathers.controls.Label;

		public var lbl_tip_cuoshang:feathers.controls.Label;

		public var lbl_tip_fengmang:feathers.controls.Label;

		public var lbl_xuqiu:feathers.controls.Label;

		public var lbl_zhiye:feathers.controls.Label;

		public var lbl_zhuomo:feathers.controls.Label;

		public var lock:feathers.controls.UIAsset;

		public var mc_titlebg:feathers.controls.UIMovieClip;

		public var tip_down:feathers.controls.UIAsset;

		public var tip_up:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function wupin_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 609;
			this.width = 298;
			this.elementsContent = [__wupin_Skin_UIAsset1_i(),mc_titlebg_i(),lbl_name_i(),__wupin_Skin_Group1_i(),grp_icon_i(),grp_zhandouli_i(),__wupin_Skin_Group2_i(),grp_date_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __wupin_Skin_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 11;
			temp.y = 160;
			temp.elementsContent = [__wupin_Skin_UIAsset2_i(),__wupin_Skin_UIAsset3_i(),__wupin_Skin_UIAsset4_i(),__wupin_Skin_UIAsset5_i(),__wupin_Skin_UIAsset6_i(),__wupin_Skin_UIAsset7_i(),__wupin_Skin_UIAsset8_i()];
			return temp;
		}

		private function __wupin_Skin_Group2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 3;
			temp.y = 73;
			temp.elementsContent = [__wupin_Skin_Label1_i(),__wupin_Skin_Label2_i(),__wupin_Skin_Label3_i(),__wupin_Skin_Label4_i(),__wupin_Skin_Label5_i(),__wupin_Skin_Label6_i(),__wupin_Skin_Label7_i(),__wupin_Skin_Label8_i(),__wupin_Skin_Label9_i(),__wupin_Skin_Label10_i(),__wupin_Skin_Label11_i(),__wupin_Skin_Label12_i(),__wupin_Skin_Label13_i(),__wupin_Skin_Label14_i(),__wupin_Skin_Label15_i(),__wupin_Skin_Label16_i(),__wupin_Skin_Label17_i(),__wupin_Skin_Label18_i(),__wupin_Skin_Label19_i(),__wupin_Skin_Label20_i(),__wupin_Skin_Label21_i(),__wupin_Skin_Label22_i(),__wupin_Skin_Label23_i(),__wupin_Skin_Label24_i(),__wupin_Skin_Label25_i()];
			return temp;
		}

		private function __wupin_Skin_Label10_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "【激活属性】";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 186;
			return temp;
		}

		private function __wupin_Skin_Label11_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "暴击值：";
			temp.color = 0x8b8d7b;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 6;
			temp.y = 208;
			return temp;
		}

		private function __wupin_Skin_Label12_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "琢磨等级：";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 6;
			temp.y = 241;
			return temp;
		}

		private function __wupin_Skin_Label13_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "匠心值：";
			temp.color = 0x8b8d7b;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 122;
			temp.y = 241;
			return temp;
		}

		private function __wupin_Skin_Label14_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "基础属性：";
			temp.color = 0x8b8d7b;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 6;
			temp.y = 263;
			return temp;
		}

		private function __wupin_Skin_Label15_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "【附加属性】";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 296;
			return temp;
		}

		private function __wupin_Skin_Label16_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "锋芒Lv3:";
			temp.color = 0x8b8d7b;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 6;
			temp.y = 318;
			return temp;
		}

		private function __wupin_Skin_Label17_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "挫伤Lv5:";
			temp.color = 0x8b8d7b;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 6;
			temp.y = 339;
			return temp;
		}

		private function __wupin_Skin_Label18_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "落花人独立，薇雨燕双飞";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 6;
			temp.y = 375;
			return temp;
		}

		private function __wupin_Skin_Label19_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "售价（银两）：";
			temp.color = 0x8b8d7b;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 6;
			temp.y = 408;
			return temp;
		}

		private function __wupin_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "【使用后绑定&交易后绑定】";
			temp.color = 0x8b8d7b;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 77;
			temp.y = 0;
			return temp;
		}

		private function __wupin_Skin_Label20_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "攻击力：";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 6;
			temp.y = 451;
			return temp;
		}

		private function __wupin_Skin_Label21_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "防御力：";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 136;
			temp.y = 451;
			return temp;
		}

		private function __wupin_Skin_Label22_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "命中率：";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 6;
			temp.y = 476;
			return temp;
		}

		private function __wupin_Skin_Label23_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "暴击率：";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 136;
			temp.y = 476;
			return temp;
		}

		private function __wupin_Skin_Label24_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "攻击力：";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 6;
			temp.y = 503;
			return temp;
		}

		private function __wupin_Skin_Label25_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "防御力：";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 136;
			temp.y = 503;
			return temp;
		}

		private function __wupin_Skin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "需求等级：";
			temp.color = 0x8b8d7b;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 6;
			temp.y = 36;
			return temp;
		}

		private function __wupin_Skin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "品质等级：";
			temp.color = 0x8b8d7b;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 6;
			temp.y = 60;
			return temp;
		}

		private function __wupin_Skin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "职业：";
			temp.color = 0x8b8d7b;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 159;
			temp.y = 36;
			return temp;
		}

		private function __wupin_Skin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "部位：";
			temp.color = 0x8b8d7b;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 159;
			temp.y = 60;
			return temp;
		}

		private function __wupin_Skin_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "强化等级：";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 6;
			temp.y = 91;
			return temp;
		}

		private function __wupin_Skin_Label7_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "攻击力：";
			temp.color = 0x8b8d7b;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 6;
			temp.y = 113;
			return temp;
		}

		private function __wupin_Skin_Label8_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "命中值：";
			temp.color = 0x8b8d7b;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 6;
			temp.y = 134;
			return temp;
		}

		private function __wupin_Skin_Label9_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "暴击值：";
			temp.color = 0x8b8d7b;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 6;
			temp.y = 156;
			return temp;
		}

		private function __wupin_Skin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/zhandouli.png";
			temp.x = 0;
			temp.y = 4;
			return temp;
		}

		private function __wupin_Skin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tubiao/yinzi_24.png";
			temp.x = 45;
			temp.y = 375;
			return temp;
		}

		private function __wupin_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 609;
			temp.styleName = "ui/common/tips/tips_1.png";
			temp.width = 298;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __wupin_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tips/tips_1fengexian.png";
			temp.width = 255;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __wupin_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tips/tips_1fengexian.png";
			temp.width = 255;
			temp.x = 0;
			temp.y = 96;
			return temp;
		}

		private function __wupin_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tips/tips_1fengexian.png";
			temp.width = 255;
			temp.x = 0;
			temp.y = 150;
			return temp;
		}

		private function __wupin_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tips/tips_1fengexian.png";
			temp.width = 255;
			temp.x = 0;
			temp.y = 203;
			return temp;
		}

		private function __wupin_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tips/tips_1fengexian.png";
			temp.width = 255;
			temp.x = 0;
			temp.y = 282;
			return temp;
		}

		private function __wupin_Skin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tips/tips_1fengexian.png";
			temp.width = 255;
			temp.x = 0;
			temp.y = 316;
			return temp;
		}

		private function __wupin_Skin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tips/tips_1fengexian.png";
			temp.width = 255;
			temp.x = 0;
			temp.y = 353;
			return temp;
		}

		private function __wupin_Skin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/60.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __wupin_Skin_UINumber1_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			temp.gap = -6;
			temp.height = 25;
			temp.label = "6521478";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli;
			temp.width = 139;
			temp.x = 53;
			temp.y = 0;
			return temp;
		}

		private function grp_date_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_date = temp;
			temp.name = "grp_date";
			temp.x = 66;
			temp.y = 108;
			temp.elementsContent = [lbl_xuqiu_i(),lbl_pingzhi_i(),lbl_zhiye_i(),lbl_buwei_i(),lbl_qianghua_i(),lbl_gongji_i(),lbl_mingzhong_i(),lbl_baoji_i(),lbl_gongji_jihuo_i(),lbl_tip_baoji_i(),lbl_zhuomo_i(),lbl_jiangxin_i(),lbl_jichu_i(),lbl_add_fengmang_i(),lbl_tip_fengmang_i(),lbl_add_cuoshang_i(),lbl_tip_cuoshang_i(),lbl_shoujia_i(),__wupin_Skin_UIAsset11_i(),lbl_add_gongjili_i(),lbl_add_fangyuli_i(),lbl_add_mingzhonglv_i(),lbl_add_baojilv_i(),lbl_add_gongjili2_i(),lbl_add_fangyuli2_i()];
			return temp;
		}

		private function grp_icon_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_icon = temp;
			temp.name = "grp_icon";
			temp.x = 6;
			temp.y = 36;
			temp.elementsContent = [__wupin_Skin_UIAsset9_i(),lock_i()];
			return temp;
		}

		private function grp_zhandouli_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_zhandouli = temp;
			temp.name = "grp_zhandouli";
			temp.x = 88;
			temp.y = 43;
			temp.elementsContent = [__wupin_Skin_UINumber1_i(),__wupin_Skin_UIAsset10_i(),tip_down_i(),tip_up_i()];
			return temp;
		}

		private function lbl_add_baojilv_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_add_baojilv = temp;
			temp.name = "lbl_add_baojilv";
			temp.height = 25;
			temp.text = "+11";
			temp.color = 0x5cb006;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 49;
			temp.x = 138;
			temp.y = 442;
			return temp;
		}

		private function lbl_add_cuoshang_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_add_cuoshang = temp;
			temp.name = "lbl_add_cuoshang";
			temp.height = 25;
			temp.text = "伤害加深+50%";
			temp.color = 0x5cb006;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 112;
			temp.x = 10;
			temp.y = 303;
			return temp;
		}

		private function lbl_add_fangyuli2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_add_fangyuli2 = temp;
			temp.name = "lbl_add_fangyuli2";
			temp.height = 25;
			temp.text = "+11";
			temp.color = 0x5cb006;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 49;
			temp.x = 138;
			temp.y = 469;
			return temp;
		}

		private function lbl_add_fangyuli_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_add_fangyuli = temp;
			temp.name = "lbl_add_fangyuli";
			temp.height = 25;
			temp.text = "+11";
			temp.color = 0x5cb006;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 49;
			temp.x = 138;
			temp.y = 416;
			return temp;
		}

		private function lbl_add_fengmang_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_add_fengmang = temp;
			temp.name = "lbl_add_fengmang";
			temp.height = 25;
			temp.text = "攻击+300";
			temp.color = 0x5cb006;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 83;
			temp.x = 6;
			temp.y = 283;
			return temp;
		}

		private function lbl_add_gongjili2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_add_gongjili2 = temp;
			temp.name = "lbl_add_gongjili2";
			temp.height = 25;
			temp.text = "-11";
			temp.color = 0xe1201c;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 49;
			temp.x = 5;
			temp.y = 469;
			return temp;
		}

		private function lbl_add_gongjili_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_add_gongjili = temp;
			temp.name = "lbl_add_gongjili";
			temp.height = 25;
			temp.text = "-11";
			temp.color = 0xe1201c;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 49;
			temp.x = 5;
			temp.y = 416;
			return temp;
		}

		private function lbl_add_mingzhonglv_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_add_mingzhonglv = temp;
			temp.name = "lbl_add_mingzhonglv";
			temp.height = 25;
			temp.text = "-11";
			temp.color = 0xe1201c;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 49;
			temp.x = 5;
			temp.y = 442;
			return temp;
		}

		private function lbl_baoji_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_baoji = temp;
			temp.name = "lbl_baoji";
			temp.text = "100";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 76;
			temp.x = 0;
			temp.y = 122;
			return temp;
		}

		private function lbl_buwei_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_buwei = temp;
			temp.name = "lbl_buwei";
			temp.text = "头部";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 76;
			temp.x = 141;
			temp.y = 25;
			return temp;
		}

		private function lbl_gongji_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_gongji = temp;
			temp.name = "lbl_gongji";
			temp.text = "100";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 76;
			temp.x = 0;
			temp.y = 78;
			return temp;
		}

		private function lbl_gongji_jihuo_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_gongji_jihuo = temp;
			temp.name = "lbl_gongji_jihuo";
			temp.text = "100";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 38;
			temp.x = 0;
			temp.y = 174;
			return temp;
		}

		private function lbl_jiangxin_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_jiangxin = temp;
			temp.name = "lbl_jiangxin";
			temp.text = "8";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 38;
			temp.x = 117;
			temp.y = 207;
			return temp;
		}

		private function lbl_jichu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_jichu = temp;
			temp.name = "lbl_jichu";
			temp.text = "+0%";
			temp.color = 0x5cb006;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 38;
			temp.x = 14;
			temp.y = 229;
			return temp;
		}

		private function lbl_mingzhong_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_mingzhong = temp;
			temp.name = "lbl_mingzhong";
			temp.text = "100";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 76;
			temp.x = 0;
			temp.y = 100;
			return temp;
		}

		private function lbl_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_name = temp;
			temp.name = "lbl_name";
			temp.bold = true;
			temp.fontSize = 16;
			temp.text = "物品名字最多九个字";
			temp.textAlign = "center";
			temp.color = 0x25931b;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 218;
			temp.x = 41;
			temp.y = 5;
			return temp;
		}

		private function lbl_pingzhi_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_pingzhi = temp;
			temp.name = "lbl_pingzhi";
			temp.text = "55";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 76;
			temp.x = 15;
			temp.y = 25;
			return temp;
		}

		private function lbl_qianghua_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_qianghua = temp;
			temp.name = "lbl_qianghua";
			temp.text = "0/24";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 76;
			temp.x = 14;
			temp.y = 57;
			return temp;
		}

		private function lbl_shoujia_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_shoujia = temp;
			temp.name = "lbl_shoujia";
			temp.height = 25;
			temp.text = "100";
			temp.color = 0x5cb006;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 112;
			temp.x = 70;
			temp.y = 375;
			return temp;
		}

		private function lbl_tip_baoji_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_tip_baoji = temp;
			temp.name = "lbl_tip_baoji";
			temp.text = "(强化等级2级激活)";
			temp.color = 0xe1201c;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 123;
			temp.x = 32;
			temp.y = 174;
			return temp;
		}

		private function lbl_tip_cuoshang_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_tip_cuoshang = temp;
			temp.name = "lbl_tip_cuoshang";
			temp.height = 25;
			temp.text = "琢磨等级：20";
			temp.color = 0xe1201c;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 105;
			temp.x = 115;
			temp.y = 303;
			return temp;
		}

		private function lbl_tip_fengmang_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_tip_fengmang = temp;
			temp.name = "lbl_tip_fengmang";
			temp.height = 25;
			temp.text = "琢磨等级：15";
			temp.color = 0xe1201c;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 105;
			temp.x = 79;
			temp.y = 283;
			return temp;
		}

		private function lbl_xuqiu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_xuqiu = temp;
			temp.name = "lbl_xuqiu";
			temp.text = "一转30级";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 76;
			temp.x = 15;
			temp.y = 0;
			return temp;
		}

		private function lbl_zhiye_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_zhiye = temp;
			temp.name = "lbl_zhiye";
			temp.text = "兵家";
			temp.color = 0x2482b4;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 76;
			temp.x = 141;
			temp.y = 0;
			return temp;
		}

		private function lbl_zhuomo_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_zhuomo = temp;
			temp.name = "lbl_zhuomo";
			temp.text = "0/24";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 38;
			temp.x = 14;
			temp.y = 207;
			return temp;
		}

		private function lock_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			lock = temp;
			temp.name = "lock";
			temp.styleName = "ui/common/tubiao/suo.png";
			temp.x = 11;
			temp.y = 51;
			return temp;
		}

		private function mc_titlebg_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			mc_titlebg = temp;
			temp.name = "mc_titlebg";
			temp.autoPlay = false;
			temp.height = 29;
			temp.styleClass = org.mokylin.skin.common.tips.mc.UIMovieClipTitle_bg;
			temp.width = 171;
			temp.x = 71;
			temp.y = 2;
			return temp;
		}

		private function tip_down_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			tip_down = temp;
			temp.name = "tip_down";
			temp.styleName = "ui/common/tubiao/xiangxia.png";
			temp.visible = false;
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

	}
}