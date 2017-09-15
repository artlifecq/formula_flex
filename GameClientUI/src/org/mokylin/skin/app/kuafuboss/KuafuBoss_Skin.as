package org.mokylin.skin.app.kuafuboss
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.kuafuboss.KuafuBoss_Item;
	import org.mokylin.skin.app.kuafuboss.button.ButtonTaofa;
	import org.mokylin.skin.common.TongYongPanelbg1;
	import org.mokylin.skin.component.button.ButtonSkin_info;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class KuafuBoss_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var btnTaofa:feathers.controls.Button;

		public var btn_shuoming:feathers.controls.Button;

		public var grpIcon:feathers.controls.Group;

		public var icon1:feathers.controls.UIAsset;

		public var icon2:feathers.controls.UIAsset;

		public var icon3:feathers.controls.UIAsset;

		public var icon4:feathers.controls.UIAsset;

		public var icon5:feathers.controls.UIAsset;

		public var icon6:feathers.controls.UIAsset;

		public var jicon1:feathers.controls.UIAsset;

		public var jicon2:feathers.controls.UIAsset;

		public var jicon3:feathers.controls.UIAsset;

		public var jicon4:feathers.controls.UIAsset;

		public var lbRoleName:feathers.controls.Label;

		public var skinName1:feathers.controls.SkinnableContainer;

		public var skinName2:feathers.controls.SkinnableContainer;

		public var skinName3:feathers.controls.SkinnableContainer;

		public var skinName4:feathers.controls.SkinnableContainer;

		public var skinName5:feathers.controls.SkinnableContainer;

		public var uiName:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function KuafuBoss_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 601;
			this.width = 956;
			this.elementsContent = [bg_i(),__KuafuBoss_Skin_UIAsset1_i(),__KuafuBoss_Skin_UIAsset2_i(),skinName1_i(),skinName2_i(),skinName3_i(),skinName4_i(),skinName5_i(),uiName_i(),__KuafuBoss_Skin_UIAsset3_i(),grpIcon_i(),__KuafuBoss_Skin_UIAsset4_i(),__KuafuBoss_Skin_Label1_i(),lbRoleName_i(),__KuafuBoss_Skin_UIAsset5_i(),__KuafuBoss_Skin_UIAsset6_i(),__KuafuBoss_Skin_UIAsset7_i(),__KuafuBoss_Skin_UIAsset8_i(),__KuafuBoss_Skin_UIAsset9_i(),jicon1_i(),jicon2_i(),jicon3_i(),jicon4_i(),btn_shuoming_i(),__KuafuBoss_Skin_UIAsset10_i(),btnTaofa_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __KuafuBoss_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "上轮击杀：";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 463;
			temp.y = 467;
			return temp;
		}

		private function __KuafuBoss_Skin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/kuafuboss/title.png";
			temp.x = 418;
			temp.y = 7;
			return temp;
		}

		private function __KuafuBoss_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 512;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 922;
			temp.x = 18;
			temp.y = 82;
			return temp;
		}

		private function __KuafuBoss_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/kuafuboss/bg.jpg";
			temp.x = 23;
			temp.y = 87;
			return temp;
		}

		private function __KuafuBoss_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/kuafuboss/gailvdiaoluo.png";
			temp.x = 362;
			temp.y = 492;
			return temp;
		}

		private function __KuafuBoss_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/kuafuboss/tiao.png";
			temp.x = 441;
			temp.y = 464;
			return temp;
		}

		private function __KuafuBoss_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/kuafuboss/youkuang.png";
			temp.x = 782;
			temp.y = 139;
			return temp;
		}

		private function __KuafuBoss_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/kuafuboss/shanghaidiyimingjiangli.png";
			temp.x = 801;
			temp.y = 151;
			return temp;
		}

		private function __KuafuBoss_Skin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/kuafuboss/shanghaidi12-5mingjiangli.png";
			temp.x = 801;
			temp.y = 233;
			return temp;
		}

		private function __KuafuBoss_Skin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/kuafuboss/canyujiangli.png";
			temp.x = 801;
			temp.y = 316;
			return temp;
		}

		private function __KuafuBoss_Skin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/kuafuboss/jishajiangli.png";
			temp.x = 801;
			temp.y = 399;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 601;
			var skin:StateSkin = new org.mokylin.skin.common.TongYongPanelbg1()
			temp.skin = skin
			temp.width = 956;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnTaofa_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnTaofa = temp;
			temp.name = "btnTaofa";
			temp.styleClass = org.mokylin.skin.app.kuafuboss.button.ButtonTaofa;
			temp.x = 812;
			temp.y = 505;
			return temp;
		}

		private function btn_shuoming_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_shuoming = temp;
			temp.name = "btn_shuoming";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_info;
			temp.x = 901;
			temp.y = 96;
			return temp;
		}

		private function grpIcon_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpIcon = temp;
			temp.name = "grpIcon";
			temp.x = 361;
			temp.y = 521;
			temp.elementsContent = [icon1_i(),icon2_i(),icon3_i(),icon4_i(),icon5_i(),icon6_i()];
			return temp;
		}

		private function icon1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon1 = temp;
			temp.name = "icon1";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function icon2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon2 = temp;
			temp.name = "icon2";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 64;
			temp.y = 0;
			return temp;
		}

		private function icon3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon3 = temp;
			temp.name = "icon3";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 128;
			temp.y = 0;
			return temp;
		}

		private function icon4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon4 = temp;
			temp.name = "icon4";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 191;
			temp.y = 0;
			return temp;
		}

		private function icon5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon5 = temp;
			temp.name = "icon5";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 255;
			temp.y = 0;
			return temp;
		}

		private function icon6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon6 = temp;
			temp.name = "icon6";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 319;
			temp.y = 0;
			return temp;
		}

		private function jicon1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			jicon1 = temp;
			temp.name = "jicon1";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 822;
			temp.y = 172;
			return temp;
		}

		private function jicon2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			jicon2 = temp;
			temp.name = "jicon2";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 822;
			temp.y = 254;
			return temp;
		}

		private function jicon3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			jicon3 = temp;
			temp.name = "jicon3";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 822;
			temp.y = 337;
			return temp;
		}

		private function jicon4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			jicon4 = temp;
			temp.name = "jicon4";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 822;
			temp.y = 420;
			return temp;
		}

		private function lbRoleName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbRoleName = temp;
			temp.name = "lbRoleName";
			temp.text = "七月的菊花开";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 93;
			temp.x = 533;
			temp.y = 467;
			return temp;
		}

		private function skinName1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinName1 = temp;
			temp.name = "skinName1";
			temp.height = 86;
			var skin:StateSkin = new org.mokylin.skin.app.kuafuboss.KuafuBoss_Item()
			temp.skin = skin
			temp.width = 254;
			temp.x = 36;
			temp.y = 120;
			return temp;
		}

		private function skinName2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinName2 = temp;
			temp.name = "skinName2";
			temp.height = 86;
			var skin:StateSkin = new org.mokylin.skin.app.kuafuboss.KuafuBoss_Item()
			temp.skin = skin
			temp.width = 254;
			temp.x = 36;
			temp.y = 207;
			return temp;
		}

		private function skinName3_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinName3 = temp;
			temp.name = "skinName3";
			temp.height = 86;
			var skin:StateSkin = new org.mokylin.skin.app.kuafuboss.KuafuBoss_Item()
			temp.skin = skin
			temp.width = 254;
			temp.x = 36;
			temp.y = 295;
			return temp;
		}

		private function skinName4_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinName4 = temp;
			temp.name = "skinName4";
			temp.height = 86;
			var skin:StateSkin = new org.mokylin.skin.app.kuafuboss.KuafuBoss_Item()
			temp.skin = skin
			temp.width = 254;
			temp.x = 36;
			temp.y = 382;
			return temp;
		}

		private function skinName5_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinName5 = temp;
			temp.name = "skinName5";
			temp.height = 86;
			var skin:StateSkin = new org.mokylin.skin.app.kuafuboss.KuafuBoss_Item()
			temp.skin = skin
			temp.width = 254;
			temp.x = 36;
			temp.y = 469;
			return temp;
		}

		private function uiName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiName = temp;
			temp.name = "uiName";
			temp.styleName = "ui/app/kuafuboss/name2/qingshihuang.png";
			temp.x = 310;
			temp.y = 92;
			return temp;
		}

	}
}