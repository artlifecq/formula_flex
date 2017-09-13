package org.mokylin.skin.app.fulidating
{
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.UIAsset;
	import feathers.layout.VerticalLayout;
	import org.mokylin.skin.common.TongYongPanelbg1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Fulidating_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var tabBar:feathers.controls.TabBar;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Fulidating_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 601;
			this.width = 956;
			this.elementsContent = [bg_i(),__Fulidating_Skin_UIAsset1_i(),__Fulidating_Skin_UIAsset2_i(),__Fulidating_Skin_UIAsset3_i(),tabBar_i(),__Fulidating_Skin_UIAsset4_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Fulidating_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 512;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 922;
			temp.x = 18;
			temp.y = 82;
			return temp;
		}

		private function __Fulidating_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 508;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 164;
			temp.x = 20;
			temp.y = 84;
			return temp;
		}

		private function __Fulidating_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 508;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 755;
			temp.x = 183;
			temp.y = 84;
			return temp;
		}

		private function __Fulidating_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/fulidating/word/fldt.png";
			temp.x = 431;
			temp.y = 18;
			return temp;
		}

		private function __Fulidating_Skin_VerticalLayout1_i():feathers.layout.VerticalLayout
		{
			var temp:feathers.layout.VerticalLayout = new feathers.layout.VerticalLayout();
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

		private function tabBar_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tabBar = temp;
			temp.name = "tabBar";
			temp.height = 504;
			temp.width = 160;
			temp.x = 21;
			temp.y = 85;
			temp.layout = __Fulidating_Skin_VerticalLayout1_i();
			return temp;
		}

	}
}