package org.mokylin.skin.app.wuxue.juexue
{
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.wuxue.juexue.Juexue_Item;
	import org.mokylin.skin.app.wuxue.juexue.Juexue_jihuo;
	import org.mokylin.skin.app.wuxue.juexue.Juxue_Shengji;
	import org.mokylin.skin.component.button.ButtonSkin_shuoming2;

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
		public var btn_shuoming:feathers.controls.Button;

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
			this.elementsContent = [__Juexue_Skin_UIAsset1_i(),__Juexue_Skin_Group1_i(),__Juexue_Skin_Group2_i(),btn_shuoming_i(),sk_jihuo_i(),sk_shengji_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Juexue_Skin_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.visible = false;
			temp.x = 116;
			temp.y = 432;
			temp.elementsContent = [__Juexue_Skin_UIAsset2_i(),__Juexue_Skin_UIAsset3_i(),__Juexue_Skin_UIAsset4_i(),__Juexue_Skin_UIAsset5_i(),__Juexue_Skin_UIAsset6_i(),__Juexue_Skin_UIAsset7_i()];
			return temp;
		}

		private function __Juexue_Skin_Group2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 27;
			temp.y = 417;
			temp.elementsContent = [sk_feisheng_i(),sk_wanghun_i(),skin_bindong_i(),sk_renzhe_i(),sk_shikong_i(),sk_canglong_i(),sk_shengsheng_i()];
			return temp;
		}

		private function __Juexue_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/wuxue/juexue/bg.png";
			temp.x = 20;
			temp.y = 79;
			return temp;
		}

		private function __Juexue_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/wuxue/juexue/xiaotiao.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Juexue_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/wuxue/juexue/xiaotiao.png";
			temp.x = 91;
			temp.y = 0;
			return temp;
		}

		private function __Juexue_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/wuxue/juexue/xiaotiao.png";
			temp.x = 182;
			temp.y = 0;
			return temp;
		}

		private function __Juexue_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/wuxue/juexue/xiaotiao.png";
			temp.x = 274;
			temp.y = 0;
			return temp;
		}

		private function __Juexue_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/wuxue/juexue/xiaotiao.png";
			temp.x = 365;
			temp.y = 0;
			return temp;
		}

		private function __Juexue_Skin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/wuxue/juexue/xiaotiao.png";
			temp.x = 456;
			temp.y = 0;
			return temp;
		}

		private function btn_shuoming_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_shuoming = temp;
			temp.name = "btn_shuoming";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_shuoming2;
			temp.x = 619;
			temp.y = 100;
			return temp;
		}

		private function sk_canglong_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			sk_canglong = temp;
			temp.name = "sk_canglong";
			temp.height = 94;
			var skin:StateSkin = new org.mokylin.skin.app.wuxue.juexue.Juexue_Item()
			temp.skin = skin
			temp.width = 87;
			temp.x = 457;
			temp.y = 0;
			return temp;
		}

		private function sk_feisheng_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			sk_feisheng = temp;
			temp.name = "sk_feisheng";
			temp.height = 94;
			var skin:StateSkin = new org.mokylin.skin.app.wuxue.juexue.Juexue_Item()
			temp.skin = skin
			temp.width = 87;
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
			temp.x = 670;
			temp.y = 79;
			return temp;
		}

		private function sk_renzhe_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			sk_renzhe = temp;
			temp.name = "sk_renzhe";
			temp.height = 94;
			var skin:StateSkin = new org.mokylin.skin.app.wuxue.juexue.Juexue_Item()
			temp.skin = skin
			temp.width = 87;
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
			temp.x = 670;
			temp.y = 79;
			return temp;
		}

		private function sk_shengsheng_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			sk_shengsheng = temp;
			temp.name = "sk_shengsheng";
			temp.height = 94;
			var skin:StateSkin = new org.mokylin.skin.app.wuxue.juexue.Juexue_Item()
			temp.skin = skin
			temp.width = 87;
			temp.x = 549;
			temp.y = 0;
			return temp;
		}

		private function sk_shikong_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			sk_shikong = temp;
			temp.name = "sk_shikong";
			temp.height = 94;
			var skin:StateSkin = new org.mokylin.skin.app.wuxue.juexue.Juexue_Item()
			temp.skin = skin
			temp.width = 87;
			temp.x = 366;
			temp.y = 0;
			return temp;
		}

		private function sk_wanghun_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			sk_wanghun = temp;
			temp.name = "sk_wanghun";
			temp.height = 94;
			var skin:StateSkin = new org.mokylin.skin.app.wuxue.juexue.Juexue_Item()
			temp.skin = skin
			temp.width = 87;
			temp.x = 92;
			temp.y = 0;
			return temp;
		}

		private function skin_bindong_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skin_bindong = temp;
			temp.name = "skin_bindong";
			temp.height = 94;
			var skin:StateSkin = new org.mokylin.skin.app.wuxue.juexue.Juexue_Item()
			temp.skin = skin
			temp.width = 87;
			temp.x = 183;
			temp.y = 0;
			return temp;
		}

	}
}