package org.mokylin.skin.app.beibao.Xinfa
{
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.beibao.jingmai.Shuxing_Item;
	import org.mokylin.skin.component.button.ButtonSkin_close;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Xinfa_Shuxin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var btnClose:feathers.controls.Button;

		public var grpBianShi:feathers.controls.Group;

		public var grpXueWei:feathers.controls.Group;

		public var skin1_1:feathers.controls.SkinnableContainer;

		public var skin1_2:feathers.controls.SkinnableContainer;

		public var skin1_3:feathers.controls.SkinnableContainer;

		public var skin1_4:feathers.controls.SkinnableContainer;

		public var skin1_5:feathers.controls.SkinnableContainer;

		public var skin2_1:feathers.controls.SkinnableContainer;

		public var skin2_2:feathers.controls.SkinnableContainer;

		public var skin2_3:feathers.controls.SkinnableContainer;

		public var skin2_4:feathers.controls.SkinnableContainer;

		public var skin2_5:feathers.controls.SkinnableContainer;

		public var skin2_6:feathers.controls.SkinnableContainer;

		public var skin2_7:feathers.controls.SkinnableContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Xinfa_Shuxin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 557;
			this.width = 292;
			this.elementsContent = [bg_i(),__Xinfa_Shuxin_UIAsset1_i(),__Xinfa_Shuxin_UIAsset2_i(),btnClose_i(),grpXueWei_i(),grpBianShi_i(),__Xinfa_Shuxin_Group1_i(),__Xinfa_Shuxin_Group2_i(),__Xinfa_Shuxin_UIAsset45_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Xinfa_Shuxin_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 30;
			temp.y = 50;
			temp.elementsContent = [__Xinfa_Shuxin_UIAsset39_i(),__Xinfa_Shuxin_UIAsset40_i(),__Xinfa_Shuxin_UIAsset41_i()];
			return temp;
		}

		private function __Xinfa_Shuxin_Group2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 30;
			temp.y = 264;
			temp.elementsContent = [__Xinfa_Shuxin_UIAsset42_i(),__Xinfa_Shuxin_UIAsset43_i(),__Xinfa_Shuxin_UIAsset44_i()];
			return temp;
		}

		private function __Xinfa_Shuxin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/jingmai/tubiao/mingzhong.png";
			temp.x = 29;
			temp.y = 58;
			return temp;
		}

		private function __Xinfa_Shuxin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/jingmai/tubiao/fangyu.png";
			temp.x = 29;
			temp.y = 87;
			return temp;
		}

		private function __Xinfa_Shuxin_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/jingmai/tubiao/qixue.png";
			temp.x = 29;
			temp.y = 117;
			return temp;
		}

		private function __Xinfa_Shuxin_UIAsset13_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/shuxing/sf.png";
			temp.x = 56;
			temp.y = 2;
			return temp;
		}

		private function __Xinfa_Shuxin_UIAsset14_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/shuxing/gjl.png";
			temp.x = 56;
			temp.y = 31;
			return temp;
		}

		private function __Xinfa_Shuxin_UIAsset15_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/shuxing/mz.png";
			temp.x = 56;
			temp.y = 60;
			return temp;
		}

		private function __Xinfa_Shuxin_UIAsset16_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/shuxing/fyz.png";
			temp.x = 56;
			temp.y = 89;
			return temp;
		}

		private function __Xinfa_Shuxin_UIAsset17_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/shuxing/qx.png";
			temp.x = 56;
			temp.y = 119;
			return temp;
		}

		private function __Xinfa_Shuxin_UIAsset18_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/jingmai/ditiao.png";
			temp.width = 228;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Xinfa_Shuxin_UIAsset19_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/jingmai/ditiao.png";
			temp.width = 228;
			temp.x = 0;
			temp.y = 29;
			return temp;
		}

		private function __Xinfa_Shuxin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 515;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 278;
			temp.x = 7;
			temp.y = 33;
			return temp;
		}

		private function __Xinfa_Shuxin_UIAsset20_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/jingmai/ditiao.png";
			temp.width = 228;
			temp.x = 0;
			temp.y = 58;
			return temp;
		}

		private function __Xinfa_Shuxin_UIAsset21_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/jingmai/ditiao.png";
			temp.width = 228;
			temp.x = 0;
			temp.y = 87;
			return temp;
		}

		private function __Xinfa_Shuxin_UIAsset22_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/jingmai/ditiao.png";
			temp.width = 228;
			temp.x = 0;
			temp.y = 116;
			return temp;
		}

		private function __Xinfa_Shuxin_UIAsset23_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/jingmai/ditiao.png";
			temp.width = 228;
			temp.x = 0;
			temp.y = 145;
			return temp;
		}

		private function __Xinfa_Shuxin_UIAsset24_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/jingmai/ditiao.png";
			temp.width = 228;
			temp.x = 0;
			temp.y = 174;
			return temp;
		}

		private function __Xinfa_Shuxin_UIAsset25_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/jingmai/tubiao/gongji.png";
			temp.x = 29;
			temp.y = 3;
			return temp;
		}

		private function __Xinfa_Shuxin_UIAsset26_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/jingmai/tubiao/mingzhong.png";
			temp.x = 29;
			temp.y = 31;
			return temp;
		}

		private function __Xinfa_Shuxin_UIAsset27_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/jingmai/tubiao/fangyu.png";
			temp.x = 29;
			temp.y = 60;
			return temp;
		}

		private function __Xinfa_Shuxin_UIAsset28_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/jingmai/tubiao/qixue.png";
			temp.x = 29;
			temp.y = 90;
			return temp;
		}

		private function __Xinfa_Shuxin_UIAsset29_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/jingmai/tubiao/shanbi.png";
			temp.x = 29;
			temp.y = 118;
			return temp;
		}

		private function __Xinfa_Shuxin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/beibao/jingmai/shuxingbeijing.jpg";
			temp.x = 11;
			temp.y = 37;
			return temp;
		}

		private function __Xinfa_Shuxin_UIAsset30_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/jingmai/tubiao/baoji.png";
			temp.x = 29;
			temp.y = 146;
			return temp;
		}

		private function __Xinfa_Shuxin_UIAsset31_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/jingmai/tubiao/baoshang.png";
			temp.x = 29;
			temp.y = 174;
			return temp;
		}

		private function __Xinfa_Shuxin_UIAsset32_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/shuxing/gjl.png";
			temp.x = 56;
			temp.y = 2;
			return temp;
		}

		private function __Xinfa_Shuxin_UIAsset33_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/shuxing/mz.png";
			temp.x = 56;
			temp.y = 32;
			return temp;
		}

		private function __Xinfa_Shuxin_UIAsset34_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/shuxing/fyz.png";
			temp.x = 56;
			temp.y = 60;
			return temp;
		}

		private function __Xinfa_Shuxin_UIAsset35_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/shuxing/qx.png";
			temp.x = 56;
			temp.y = 88;
			return temp;
		}

		private function __Xinfa_Shuxin_UIAsset36_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/shuxing/sb.png";
			temp.x = 56;
			temp.y = 117;
			return temp;
		}

		private function __Xinfa_Shuxin_UIAsset37_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/shuxing/bjz.png";
			temp.x = 56;
			temp.y = 147;
			return temp;
		}

		private function __Xinfa_Shuxin_UIAsset38_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/shuxing/bjjc.png";
			temp.x = 56;
			temp.y = 176;
			return temp;
		}

		private function __Xinfa_Shuxin_UIAsset39_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/jingmai/meishuzi/xueweijiachengshuxing.png";
			temp.x = 72;
			temp.y = 0;
			return temp;
		}

		private function __Xinfa_Shuxin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/jingmai/ditiao.png";
			temp.width = 228;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Xinfa_Shuxin_UIAsset40_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/wenshi/huawen_1.png";
			temp.x = 0;
			temp.y = 8;
			return temp;
		}

		private function __Xinfa_Shuxin_UIAsset41_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/wenshi/huawen_2.png";
			temp.x = 172;
			temp.y = 8;
			return temp;
		}

		private function __Xinfa_Shuxin_UIAsset42_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/jingmai/meishuzi/bianshijiachengshuxing.png";
			temp.x = 72;
			temp.y = 0;
			return temp;
		}

		private function __Xinfa_Shuxin_UIAsset43_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/wenshi/huawen_1.png";
			temp.x = 0;
			temp.y = 8;
			return temp;
		}

		private function __Xinfa_Shuxin_UIAsset44_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/wenshi/huawen_2.png";
			temp.x = 172;
			temp.y = 8;
			return temp;
		}

		private function __Xinfa_Shuxin_UIAsset45_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/beibao/jingmai/jiachengzongshuxing.png";
			temp.x = 89;
			temp.y = 7;
			return temp;
		}

		private function __Xinfa_Shuxin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/jingmai/ditiao.png";
			temp.width = 228;
			temp.x = 0;
			temp.y = 29;
			return temp;
		}

		private function __Xinfa_Shuxin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/jingmai/ditiao.png";
			temp.width = 228;
			temp.x = 0;
			temp.y = 58;
			return temp;
		}

		private function __Xinfa_Shuxin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/jingmai/ditiao.png";
			temp.width = 228;
			temp.x = 0;
			temp.y = 87;
			return temp;
		}

		private function __Xinfa_Shuxin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/jingmai/ditiao.png";
			temp.width = 228;
			temp.x = 0;
			temp.y = 116;
			return temp;
		}

		private function __Xinfa_Shuxin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/jingmai/tubiao/shenfa.png";
			temp.x = 29;
			temp.y = 1;
			return temp;
		}

		private function __Xinfa_Shuxin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/jingmai/tubiao/gongji.png";
			temp.x = 29;
			temp.y = 30;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 557;
			temp.styleName = "ui/common/background/erji_kuang.png";
			temp.width = 292;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close;
			temp.x = 258;
			temp.y = 5;
			return temp;
		}

		private function grpBianShi_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpBianShi = temp;
			temp.name = "grpBianShi";
			temp.x = 32;
			temp.y = 304;
			temp.elementsContent = [__Xinfa_Shuxin_UIAsset18_i(),__Xinfa_Shuxin_UIAsset19_i(),__Xinfa_Shuxin_UIAsset20_i(),__Xinfa_Shuxin_UIAsset21_i(),__Xinfa_Shuxin_UIAsset22_i(),__Xinfa_Shuxin_UIAsset23_i(),__Xinfa_Shuxin_UIAsset24_i(),__Xinfa_Shuxin_UIAsset25_i(),__Xinfa_Shuxin_UIAsset26_i(),__Xinfa_Shuxin_UIAsset27_i(),__Xinfa_Shuxin_UIAsset28_i(),__Xinfa_Shuxin_UIAsset29_i(),__Xinfa_Shuxin_UIAsset30_i(),__Xinfa_Shuxin_UIAsset31_i(),__Xinfa_Shuxin_UIAsset32_i(),__Xinfa_Shuxin_UIAsset33_i(),__Xinfa_Shuxin_UIAsset34_i(),__Xinfa_Shuxin_UIAsset35_i(),__Xinfa_Shuxin_UIAsset36_i(),__Xinfa_Shuxin_UIAsset37_i(),__Xinfa_Shuxin_UIAsset38_i(),skin2_1_i(),skin2_2_i(),skin2_3_i(),skin2_4_i(),skin2_5_i(),skin2_6_i(),skin2_7_i()];
			return temp;
		}

		private function grpXueWei_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpXueWei = temp;
			temp.name = "grpXueWei";
			temp.x = 32;
			temp.y = 87;
			temp.elementsContent = [__Xinfa_Shuxin_UIAsset3_i(),__Xinfa_Shuxin_UIAsset4_i(),__Xinfa_Shuxin_UIAsset5_i(),__Xinfa_Shuxin_UIAsset6_i(),__Xinfa_Shuxin_UIAsset7_i(),__Xinfa_Shuxin_UIAsset8_i(),__Xinfa_Shuxin_UIAsset9_i(),__Xinfa_Shuxin_UIAsset10_i(),__Xinfa_Shuxin_UIAsset11_i(),__Xinfa_Shuxin_UIAsset12_i(),__Xinfa_Shuxin_UIAsset13_i(),__Xinfa_Shuxin_UIAsset14_i(),__Xinfa_Shuxin_UIAsset15_i(),__Xinfa_Shuxin_UIAsset16_i(),__Xinfa_Shuxin_UIAsset17_i(),skin1_1_i(),skin1_2_i(),skin1_3_i(),skin1_4_i(),skin1_5_i()];
			return temp;
		}

		private function skin1_1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skin1_1 = temp;
			temp.name = "skin1_1";
			var skin:StateSkin = new org.mokylin.skin.app.beibao.jingmai.Shuxing_Item()
			temp.skin = skin
			temp.x = 46;
			temp.y = 3;
			return temp;
		}

		private function skin1_2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skin1_2 = temp;
			temp.name = "skin1_2";
			var skin:StateSkin = new org.mokylin.skin.app.beibao.jingmai.Shuxing_Item()
			temp.skin = skin
			temp.x = 46;
			temp.y = 32;
			return temp;
		}

		private function skin1_3_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skin1_3 = temp;
			temp.name = "skin1_3";
			var skin:StateSkin = new org.mokylin.skin.app.beibao.jingmai.Shuxing_Item()
			temp.skin = skin
			temp.x = 46;
			temp.y = 61;
			return temp;
		}

		private function skin1_4_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skin1_4 = temp;
			temp.name = "skin1_4";
			var skin:StateSkin = new org.mokylin.skin.app.beibao.jingmai.Shuxing_Item()
			temp.skin = skin
			temp.x = 46;
			temp.y = 90;
			return temp;
		}

		private function skin1_5_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skin1_5 = temp;
			temp.name = "skin1_5";
			var skin:StateSkin = new org.mokylin.skin.app.beibao.jingmai.Shuxing_Item()
			temp.skin = skin
			temp.x = 46;
			temp.y = 119;
			return temp;
		}

		private function skin2_1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skin2_1 = temp;
			temp.name = "skin2_1";
			var skin:StateSkin = new org.mokylin.skin.app.beibao.jingmai.Shuxing_Item()
			temp.skin = skin
			temp.x = 46;
			temp.y = 3;
			return temp;
		}

		private function skin2_2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skin2_2 = temp;
			temp.name = "skin2_2";
			var skin:StateSkin = new org.mokylin.skin.app.beibao.jingmai.Shuxing_Item()
			temp.skin = skin
			temp.x = 46;
			temp.y = 32;
			return temp;
		}

		private function skin2_3_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skin2_3 = temp;
			temp.name = "skin2_3";
			var skin:StateSkin = new org.mokylin.skin.app.beibao.jingmai.Shuxing_Item()
			temp.skin = skin
			temp.x = 46;
			temp.y = 61;
			return temp;
		}

		private function skin2_4_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skin2_4 = temp;
			temp.name = "skin2_4";
			var skin:StateSkin = new org.mokylin.skin.app.beibao.jingmai.Shuxing_Item()
			temp.skin = skin
			temp.x = 46;
			temp.y = 90;
			return temp;
		}

		private function skin2_5_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skin2_5 = temp;
			temp.name = "skin2_5";
			var skin:StateSkin = new org.mokylin.skin.app.beibao.jingmai.Shuxing_Item()
			temp.skin = skin
			temp.x = 46;
			temp.y = 119;
			return temp;
		}

		private function skin2_6_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skin2_6 = temp;
			temp.name = "skin2_6";
			var skin:StateSkin = new org.mokylin.skin.app.beibao.jingmai.Shuxing_Item()
			temp.skin = skin
			temp.x = 46;
			temp.y = 148;
			return temp;
		}

		private function skin2_7_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skin2_7 = temp;
			temp.name = "skin2_7";
			var skin:StateSkin = new org.mokylin.skin.app.beibao.jingmai.Shuxing_Item()
			temp.skin = skin
			temp.x = 46;
			temp.y = 177;
			return temp;
		}

	}
}