package org.mokylin.skin.app.wuxue.juexue
{
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UIMovieClip;
	import org.mokylin.skin.app.wuxue.juexue.Juexue_Item;
	import org.mokylin.skin.app.wuxue.juexue.Juexue_jihuo;
	import org.mokylin.skin.app.wuxue.juexue.Juxue_Shengji;
	import org.mokylin.skin.app.wuxue.juexue.mc.UIMovieClipJuexue_name;
	import org.mokylin.skin.component.button.ButtonSkin_info;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Juexue_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg_1:feathers.controls.UIAsset;

		public var bg_2:feathers.controls.UIAsset;

		public var bg_3:feathers.controls.UIAsset;

		public var bg_4:feathers.controls.UIAsset;

		public var bg_5:feathers.controls.UIAsset;

		public var bg_6:feathers.controls.UIAsset;

		public var bg_7:feathers.controls.UIAsset;

		public var btn_shuoming:feathers.controls.Button;

		public var grp_bg:feathers.controls.Group;

		public var grp_btn:feathers.controls.Group;

		public var mc_name:feathers.controls.UIMovieClip;

		public var sk_canglong:feathers.controls.SkinnableContainer;

		public var sk_feisheng:feathers.controls.SkinnableContainer;

		public var sk_jihuo:feathers.controls.SkinnableContainer;

		public var sk_renzhe:feathers.controls.SkinnableContainer;

		public var sk_shengji:feathers.controls.SkinnableContainer;

		public var sk_shengsheng:feathers.controls.SkinnableContainer;

		public var sk_shikong:feathers.controls.SkinnableContainer;

		public var sk_wanghun:feathers.controls.SkinnableContainer;

		public var skin_bindong:feathers.controls.SkinnableContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Juexue_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 601;
			this.width = 956;
			this.elementsContent = [__Juexue_Skin_UIAsset2_i(),__Juexue_Skin_UIAsset3_i(),grp_bg_i(),grp_btn_i(),btn_shuoming_i(),sk_jihuo_i(),sk_shengji_i(),mc_name_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Juexue_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 449;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 653;
			temp.x = 20;
			temp.y = 84;
			return temp;
		}

		private function __Juexue_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/wuxue/juexue/bg.png";
			temp.x = 28;
			temp.y = 421;
			return temp;
		}

		private function bg_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg_1 = temp;
			temp.name = "bg_1";
			temp.styleName = "ui/big_bg/wuxue/juexue/bg_1.jpg";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg_2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg_2 = temp;
			temp.name = "bg_2";
			temp.styleName = "ui/big_bg/wuxue/juexue/bg_2.jpg";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg_3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg_3 = temp;
			temp.name = "bg_3";
			temp.styleName = "ui/big_bg/wuxue/juexue/bg_3.jpg";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg_4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg_4 = temp;
			temp.name = "bg_4";
			temp.styleName = "ui/big_bg/wuxue/juexue/bg_4.jpg";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg_5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg_5 = temp;
			temp.name = "bg_5";
			temp.styleName = "ui/big_bg/wuxue/juexue/bg_5.jpg";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg_6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg_6 = temp;
			temp.name = "bg_6";
			temp.styleName = "ui/big_bg/wuxue/juexue/bg_6.jpg";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg_7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg_7 = temp;
			temp.name = "bg_7";
			temp.styleName = "ui/big_bg/wuxue/juexue/bg_7.jpg";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btn_shuoming_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_shuoming = temp;
			temp.name = "btn_shuoming";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_info;
			temp.x = 632;
			temp.y = 106;
			return temp;
		}

		private function grp_bg_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_bg = temp;
			temp.name = "grp_bg";
			temp.x = 28;
			temp.y = 92;
			temp.elementsContent = [bg_1_i(),bg_2_i(),bg_3_i(),bg_4_i(),bg_5_i(),bg_6_i(),bg_7_i()];
			return temp;
		}

		private function grp_btn_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_btn = temp;
			temp.name = "grp_btn";
			temp.x = 31;
			temp.y = 416;
			temp.elementsContent = [sk_feisheng_i(),sk_wanghun_i(),skin_bindong_i(),sk_renzhe_i(),sk_shikong_i(),sk_canglong_i(),sk_shengsheng_i()];
			return temp;
		}

		private function mc_name_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			mc_name = temp;
			temp.name = "mc_name";
			temp.autoPlay = false;
			temp.height = 119;
			temp.styleClass = org.mokylin.skin.app.wuxue.juexue.mc.UIMovieClipJuexue_name;
			temp.width = 54;
			temp.x = 38;
			temp.y = 103;
			return temp;
		}

		private function sk_canglong_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			sk_canglong = temp;
			temp.name = "sk_canglong";
			temp.height = 106;
			var skin:StateSkin = new org.mokylin.skin.app.wuxue.juexue.Juexue_Item()
			temp.skin = skin
			temp.width = 94;
			temp.x = 457;
			temp.y = 0;
			return temp;
		}

		private function sk_feisheng_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			sk_feisheng = temp;
			temp.name = "sk_feisheng";
			temp.height = 106;
			var skin:StateSkin = new org.mokylin.skin.app.wuxue.juexue.Juexue_Item()
			temp.skin = skin
			temp.width = 94;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function sk_jihuo_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			sk_jihuo = temp;
			temp.name = "sk_jihuo";
			temp.height = 446;
			var skin:StateSkin = new org.mokylin.skin.app.wuxue.juexue.Juexue_jihuo()
			temp.skin = skin
			temp.width = 258;
			temp.x = 673;
			temp.y = 84;
			return temp;
		}

		private function sk_renzhe_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			sk_renzhe = temp;
			temp.name = "sk_renzhe";
			temp.height = 106;
			var skin:StateSkin = new org.mokylin.skin.app.wuxue.juexue.Juexue_Item()
			temp.skin = skin
			temp.width = 94;
			temp.x = 274;
			temp.y = 0;
			return temp;
		}

		private function sk_shengji_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			sk_shengji = temp;
			temp.name = "sk_shengji";
			temp.height = 445;
			var skin:StateSkin = new org.mokylin.skin.app.wuxue.juexue.Juxue_Shengji()
			temp.skin = skin
			temp.width = 260;
			temp.x = 673;
			temp.y = 84;
			return temp;
		}

		private function sk_shengsheng_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			sk_shengsheng = temp;
			temp.name = "sk_shengsheng";
			temp.height = 106;
			var skin:StateSkin = new org.mokylin.skin.app.wuxue.juexue.Juexue_Item()
			temp.skin = skin
			temp.width = 94;
			temp.x = 549;
			temp.y = 0;
			return temp;
		}

		private function sk_shikong_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			sk_shikong = temp;
			temp.name = "sk_shikong";
			temp.height = 106;
			var skin:StateSkin = new org.mokylin.skin.app.wuxue.juexue.Juexue_Item()
			temp.skin = skin
			temp.width = 94;
			temp.x = 366;
			temp.y = 0;
			return temp;
		}

		private function sk_wanghun_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			sk_wanghun = temp;
			temp.name = "sk_wanghun";
			temp.height = 106;
			var skin:StateSkin = new org.mokylin.skin.app.wuxue.juexue.Juexue_Item()
			temp.skin = skin
			temp.width = 94;
			temp.x = 92;
			temp.y = 0;
			return temp;
		}

		private function skin_bindong_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skin_bindong = temp;
			temp.name = "skin_bindong";
			temp.height = 106;
			var skin:StateSkin = new org.mokylin.skin.app.wuxue.juexue.Juexue_Item()
			temp.skin = skin
			temp.width = 94;
			temp.x = 183;
			temp.y = 0;
			return temp;
		}

	}
}