package org.mokylin.skin.app.beibao.Xinfa
{
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.beibao.jingmai.Shuxing_Item;
	import org.mokylin.skin.common.TongYongTanKuang_bg2;
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
		public var bg:feathers.controls.SkinnableContainer;

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
			this.elementsContent = [bg_i(),__Xinfa_Shuxin_UIAsset1_i(),__Xinfa_Shuxin_UIAsset2_i(),btnClose_i(),grpXueWei_i(),grpBianShi_i(),__Xinfa_Shuxin_Group3_i(),__Xinfa_Shuxin_Group4_i(),__Xinfa_Shuxin_UIAsset45_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Xinfa_Shuxin_Group3_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 30;
			temp.y = 50;
			temp.elementsContent = [__Xinfa_Shuxin_UIAsset39_i(),__Xinfa_Shuxin_UIAsset40_i(),__Xinfa_Shuxin_UIAsset41_i()];
			return temp;
		}

		private function __Xinfa_Shuxin_Group4_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 30;
			temp.y = 264;
			temp.elementsContent = [__Xinfa_Shuxin_UIAsset42_i(),__Xinfa_Shuxin_UIAsset43_i(),__Xinfa_Shuxin_UIAsset44_i()];
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

		private function __Xinfa_Shuxin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/beibao/jingmai/shuxingbeijing.jpg";
			temp.x = 11;
			temp.y = 37;
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

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 557;
			var skin:StateSkin = new org.mokylin.skin.common.TongYongTanKuang_bg2()
			temp.skin = skin
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
			temp.elementsContent = [skin2_1_i(),skin2_2_i(),skin2_3_i(),skin2_4_i(),skin2_5_i(),skin2_6_i(),skin2_7_i()];
			return temp;
		}

		private function grpXueWei_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpXueWei = temp;
			temp.name = "grpXueWei";
			temp.x = 32;
			temp.y = 87;
			temp.elementsContent = [skin1_1_i(),skin1_2_i(),skin1_3_i(),skin1_4_i(),skin1_5_i()];
			return temp;
		}

		private function skin1_1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skin1_1 = temp;
			temp.name = "skin1_1";
			var skin:StateSkin = new org.mokylin.skin.app.beibao.jingmai.Shuxing_Item()
			temp.skin = skin
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function skin1_2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skin1_2 = temp;
			temp.name = "skin1_2";
			var skin:StateSkin = new org.mokylin.skin.app.beibao.jingmai.Shuxing_Item()
			temp.skin = skin
			temp.x = 0;
			temp.y = 29;
			return temp;
		}

		private function skin1_3_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skin1_3 = temp;
			temp.name = "skin1_3";
			var skin:StateSkin = new org.mokylin.skin.app.beibao.jingmai.Shuxing_Item()
			temp.skin = skin
			temp.x = 0;
			temp.y = 58;
			return temp;
		}

		private function skin1_4_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skin1_4 = temp;
			temp.name = "skin1_4";
			var skin:StateSkin = new org.mokylin.skin.app.beibao.jingmai.Shuxing_Item()
			temp.skin = skin
			temp.x = 0;
			temp.y = 87;
			return temp;
		}

		private function skin1_5_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skin1_5 = temp;
			temp.name = "skin1_5";
			var skin:StateSkin = new org.mokylin.skin.app.beibao.jingmai.Shuxing_Item()
			temp.skin = skin
			temp.x = 0;
			temp.y = 116;
			return temp;
		}

		private function skin2_1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skin2_1 = temp;
			temp.name = "skin2_1";
			var skin:StateSkin = new org.mokylin.skin.app.beibao.jingmai.Shuxing_Item()
			temp.skin = skin
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function skin2_2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skin2_2 = temp;
			temp.name = "skin2_2";
			var skin:StateSkin = new org.mokylin.skin.app.beibao.jingmai.Shuxing_Item()
			temp.skin = skin
			temp.x = 0;
			temp.y = 29;
			return temp;
		}

		private function skin2_3_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skin2_3 = temp;
			temp.name = "skin2_3";
			var skin:StateSkin = new org.mokylin.skin.app.beibao.jingmai.Shuxing_Item()
			temp.skin = skin
			temp.x = 0;
			temp.y = 58;
			return temp;
		}

		private function skin2_4_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skin2_4 = temp;
			temp.name = "skin2_4";
			var skin:StateSkin = new org.mokylin.skin.app.beibao.jingmai.Shuxing_Item()
			temp.skin = skin
			temp.x = 0;
			temp.y = 87;
			return temp;
		}

		private function skin2_5_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skin2_5 = temp;
			temp.name = "skin2_5";
			var skin:StateSkin = new org.mokylin.skin.app.beibao.jingmai.Shuxing_Item()
			temp.skin = skin
			temp.x = 0;
			temp.y = 116;
			return temp;
		}

		private function skin2_6_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skin2_6 = temp;
			temp.name = "skin2_6";
			var skin:StateSkin = new org.mokylin.skin.app.beibao.jingmai.Shuxing_Item()
			temp.skin = skin
			temp.x = 0;
			temp.y = 145;
			return temp;
		}

		private function skin2_7_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skin2_7 = temp;
			temp.name = "skin2_7";
			var skin:StateSkin = new org.mokylin.skin.app.beibao.jingmai.Shuxing_Item()
			temp.skin = skin
			temp.x = 0;
			temp.y = 174;
			return temp;
		}

	}
}