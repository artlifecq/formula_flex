package org.mokylin.skin.app.shoujilibao
{
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.shoujilibao.button.ButtonBangdingshouji;
	import org.mokylin.skin.app.shoujilibao.button.ButtonGuanbi;
	import org.mokylin.skin.app.shoujilibao.button.ButtonLingqujiangli;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Shoujilibao_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnBangding:feathers.controls.Button;

		public var btnClose:feathers.controls.Button;

		public var btnLingqu:feathers.controls.Button;

		public var icon2:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Shoujilibao_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 537;
			this.width = 882;
			this.elementsContent = [__Shoujilibao_Skin_UIAsset1_i(),__Shoujilibao_Skin_UIAsset2_i(),__Shoujilibao_Skin_UIAsset3_i(),__Shoujilibao_Skin_UIAsset4_i(),__Shoujilibao_Skin_UIAsset5_i(),__Shoujilibao_Skin_UIAsset6_i(),icon2_i(),btnBangding_i(),btnLingqu_i(),btnClose_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Shoujilibao_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/shoujilibao/bg.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Shoujilibao_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/shoujilibao/title_shoujilibao.png";
			temp.x = 380;
			temp.y = 17;
			return temp;
		}

		private function __Shoujilibao_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/shoujilibao/biaoqian.png";
			temp.x = 314;
			temp.y = 119;
			return temp;
		}

		private function __Shoujilibao_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/shoujilibao/biaoqian.png";
			temp.x = 314;
			temp.y = 191;
			return temp;
		}

		private function __Shoujilibao_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/shoujilibao/wenzi1.png";
			temp.x = 342;
			temp.y = 120;
			return temp;
		}

		private function __Shoujilibao_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/shoujilibao/wenzi2.png";
			temp.x = 341;
			temp.y = 193;
			return temp;
		}

		private function btnBangding_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnBangding = temp;
			temp.name = "btnBangding";
			temp.styleClass = org.mokylin.skin.app.shoujilibao.button.ButtonBangdingshouji;
			temp.x = 421;
			temp.y = 398;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.app.shoujilibao.button.ButtonGuanbi;
			temp.x = 831;
			temp.y = 74;
			return temp;
		}

		private function btnLingqu_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnLingqu = temp;
			temp.name = "btnLingqu";
			temp.styleClass = org.mokylin.skin.app.shoujilibao.button.ButtonLingqujiangli;
			temp.x = 421;
			temp.y = 398;
			return temp;
		}

		private function icon2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon2 = temp;
			temp.name = "icon2";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 509;
			temp.y = 302;
			return temp;
		}

	}
}