package org.mokylin.skin.app.jianghu.lunjian
{
	import feathers.controls.Button;
	import feathers.controls.List;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.layout.VerticalLayout;
	import org.mokylin.skin.component.button.ButtonSkin_jiantou2;
	import org.mokylin.skin.component.list.ListSkin1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class LunJian_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnN:feathers.controls.Button;

		public var btnP:feathers.controls.Button;

		public var list_map:feathers.controls.List;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function LunJian_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 587;
			this.width = 947;
			this.elementsContent = [__LunJian_Skin_UIAsset2_i(),list_map_i(),__LunJian_Skin_UIAsset3_i(),btnP_i(),btnN_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __LunJian_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 485;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 156;
			temp.x = 20;
			temp.y = 76;
			return temp;
		}

		private function __LunJian_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/jianghu/lunjian/lj.png";
			temp.x = 447;
			temp.y = 13;
			return temp;
		}

		private function __LunJian_Skin_VerticalLayout1_i():feathers.layout.VerticalLayout
		{
			var temp:feathers.layout.VerticalLayout = new feathers.layout.VerticalLayout();
			return temp;
		}

		private function btnN_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnN = temp;
			temp.name = "btnN";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jiantou2;
			temp.x = 896;
			temp.y = 288;
			return temp;
		}

		private function btnP_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnP = temp;
			temp.name = "btnP";
			temp.scaleX = -1;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jiantou2;
			temp.x = 215;
			temp.y = 289;
			return temp;
		}

		private function list_map_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list_map = temp;
			temp.name = "list_map";
			temp.height = 479;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 148;
			temp.x = 25;
			temp.y = 80;
			temp.layout = __LunJian_Skin_VerticalLayout1_i();
			return temp;
		}

	}
}