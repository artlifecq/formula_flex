package org.mokylin.skin.app.zhanhun
{
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.zhanhun.Shuxing_Skin;
	import org.mokylin.skin.app.zhanhun.button.ButtonQueding;
	import org.mokylin.skin.component.uinumber.UINumberJuese_zhanli;
	import org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli_lv;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ZhanHun_ShengJi extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var btnClose:feathers.controls.Button;

		public var grpShuxing:feathers.controls.Group;

		public var ico_up:feathers.controls.UIAsset;

		public var lab_prop1:feathers.controls.SkinnableContainer;

		public var lab_prop2:feathers.controls.SkinnableContainer;

		public var lab_prop3:feathers.controls.SkinnableContainer;

		public var lab_prop4:feathers.controls.SkinnableContainer;

		public var lab_prop5:feathers.controls.SkinnableContainer;

		public var num_lv:feathers.controls.UINumber;

		public var roleGrp:feathers.controls.Group;

		public var uiGuangquan:feathers.controls.UIAsset;

		public var uiName:feathers.controls.UIAsset;

		public var ui_zhandouli:feathers.controls.UIAsset;

		public var userData:feathers.controls.UINumber;

		public var zhanhunName:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ZhanHun_ShengJi()
		{
			super();
			
			this.currentState = "normal";
			this.height = 558;
			this.width = 1048;
			this.elementsContent = [bg_i(),uiGuangquan_i(),__ZhanHun_ShengJi_UIAsset1_i(),zhanhunName_i(),btnClose_i(),ui_zhandouli_i(),userData_i(),num_lv_i(),ico_up_i(),uiName_i(),roleGrp_i(),grpShuxing_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ZhanHun_ShengJi_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/itembg.png";
			temp.width = 85;
			temp.x = 219;
			temp.y = 1;
			return temp;
		}

		private function __ZhanHun_ShengJi_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/itembg.png";
			temp.width = 85;
			temp.x = 219;
			temp.y = 28;
			return temp;
		}

		private function __ZhanHun_ShengJi_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/zhanhun/bg2.png";
			temp.x = 151;
			temp.y = 127;
			return temp;
		}

		private function __ZhanHun_ShengJi_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/shuxing/gjl.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __ZhanHun_ShengJi_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/shuxing/fyz.png";
			temp.x = 166;
			temp.y = 0;
			return temp;
		}

		private function __ZhanHun_ShengJi_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/shuxing/qx.png";
			temp.x = 0;
			temp.y = 27;
			return temp;
		}

		private function __ZhanHun_ShengJi_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/shuxing/sf.png";
			temp.x = 166;
			temp.y = 27;
			return temp;
		}

		private function __ZhanHun_ShengJi_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/shuxing/mz.png";
			temp.x = 0;
			temp.y = 54;
			return temp;
		}

		private function __ZhanHun_ShengJi_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/itembg.png";
			temp.width = 85;
			temp.x = 53;
			temp.y = 1;
			return temp;
		}

		private function __ZhanHun_ShengJi_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/itembg.png";
			temp.width = 85;
			temp.x = 53;
			temp.y = 28;
			return temp;
		}

		private function __ZhanHun_ShengJi_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/itembg.png";
			temp.width = 85;
			temp.x = 53;
			temp.y = 55;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.styleName = "ui/big_bg/zhanhun/bg3.png";
			temp.x = 386;
			temp.y = 206;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.app.zhanhun.button.ButtonQueding;
			temp.x = 664;
			temp.y = 435;
			return temp;
		}

		private function grpShuxing_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpShuxing = temp;
			temp.name = "grpShuxing";
			temp.x = 616;
			temp.y = 335;
			temp.elementsContent = [__ZhanHun_ShengJi_UIAsset2_i(),__ZhanHun_ShengJi_UIAsset3_i(),__ZhanHun_ShengJi_UIAsset4_i(),__ZhanHun_ShengJi_UIAsset5_i(),__ZhanHun_ShengJi_UIAsset6_i(),__ZhanHun_ShengJi_UIAsset7_i(),__ZhanHun_ShengJi_UIAsset8_i(),__ZhanHun_ShengJi_UIAsset9_i(),__ZhanHun_ShengJi_UIAsset10_i(),__ZhanHun_ShengJi_UIAsset11_i(),lab_prop1_i(),lab_prop2_i(),lab_prop3_i(),lab_prop4_i(),lab_prop5_i()];
			return temp;
		}

		private function ico_up_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico_up = temp;
			temp.name = "ico_up";
			temp.styleName = "ui/common/tubiao/jobup.png";
			temp.x = 846;
			temp.y = 256;
			return temp;
		}

		private function lab_prop1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			lab_prop1 = temp;
			temp.name = "lab_prop1";
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.app.zhanhun.Shuxing_Skin()
			temp.skin = skin
			temp.x = 56;
			temp.y = 0;
			return temp;
		}

		private function lab_prop2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			lab_prop2 = temp;
			temp.name = "lab_prop2";
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.app.zhanhun.Shuxing_Skin()
			temp.skin = skin
			temp.x = 222;
			temp.y = 0;
			return temp;
		}

		private function lab_prop3_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			lab_prop3 = temp;
			temp.name = "lab_prop3";
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.app.zhanhun.Shuxing_Skin()
			temp.skin = skin
			temp.x = 56;
			temp.y = 27;
			return temp;
		}

		private function lab_prop4_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			lab_prop4 = temp;
			temp.name = "lab_prop4";
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.app.zhanhun.Shuxing_Skin()
			temp.skin = skin
			temp.x = 222;
			temp.y = 27;
			return temp;
		}

		private function lab_prop5_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			lab_prop5 = temp;
			temp.name = "lab_prop5";
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.app.zhanhun.Shuxing_Skin()
			temp.skin = skin
			temp.x = 56;
			temp.y = 54;
			return temp;
		}

		private function num_lv_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			num_lv = temp;
			temp.name = "num_lv";
			temp.gap = -4;
			temp.height = 25;
			temp.label = "3000";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli_lv;
			temp.width = 102;
			temp.x = 862;
			temp.y = 254;
			return temp;
		}

		private function roleGrp_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			roleGrp = temp;
			temp.name = "roleGrp";
			temp.height = 235;
			temp.width = 190;
			temp.x = 232;
			temp.y = 177;
			return temp;
		}

		private function uiGuangquan_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiGuangquan = temp;
			temp.name = "uiGuangquan";
			temp.styleName = "ui/big_bg/zhanhun/bg1.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function uiName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiName = temp;
			temp.name = "uiName";
			temp.styleName = "ui/app/zhanhun/jjcg.png";
			temp.x = 592;
			temp.y = 108;
			return temp;
		}

		private function ui_zhandouli_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ui_zhandouli = temp;
			temp.name = "ui_zhandouli";
			temp.styleName = "ui/common/zhandouli1.png";
			temp.x = 614;
			temp.y = 244;
			return temp;
		}

		private function userData_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			userData = temp;
			temp.name = "userData";
			temp.gap = -15;
			temp.height = 40;
			temp.label = "62984567";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberJuese_zhanli;
			temp.width = 162;
			temp.x = 694;
			temp.y = 246;
			return temp;
		}

		private function zhanhunName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			zhanhunName = temp;
			temp.name = "zhanhunName";
			temp.styleName = "ui/app/zhanhun/modename/1.png";
			temp.x = 110;
			temp.y = 347;
			return temp;
		}

	}
}