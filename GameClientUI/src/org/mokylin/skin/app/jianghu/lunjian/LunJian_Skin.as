package org.mokylin.skin.app.jianghu.lunjian
{
	import feathers.controls.Button;
	import feathers.controls.List;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.layout.VerticalLayout;
	import org.mokylin.skin.component.button.ButtonSkin_info;
	import org.mokylin.skin.component.button.ButtonSkin_jiantou;
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

		public var btnShuoming:feathers.controls.Button;

		public var list_map:feathers.controls.List;

		public var pageList:feathers.controls.List;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function LunJian_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 601;
			this.width = 956;
			this.elementsContent = [__LunJian_Skin_UIAsset2_i(),list_map_i(),__LunJian_Skin_UIAsset3_i(),pageList_i(),btnP_i(),btnN_i(),btnShuoming_i()];
			
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
			temp.styleName = "ui/app/jianghu/lunjian/shubg.jpg";
			temp.x = 22;
			temp.y = 86;
			return temp;
		}

		private function __LunJian_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/jianghu/lunjian/lunjian.png";
			temp.x = 450;
			temp.y = 17;
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
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jiantou;
			temp.x = 896;
			temp.y = 296;
			return temp;
		}

		private function btnP_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnP = temp;
			temp.name = "btnP";
			temp.scaleX = -1;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jiantou;
			temp.x = 224;
			temp.y = 296;
			return temp;
		}

		private function btnShuoming_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnShuoming = temp;
			temp.name = "btnShuoming";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_info;
			temp.x = 25;
			temp.y = 54;
			return temp;
		}

		private function list_map_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list_map = temp;
			temp.name = "list_map";
			temp.height = 494;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 161;
			temp.x = 24;
			temp.y = 90;
			temp.layout = __LunJian_Skin_VerticalLayout1_i();
			return temp;
		}

		private function pageList_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			pageList = temp;
			temp.name = "pageList";
			temp.height = 481;
			temp.width = 748;
			temp.x = 191;
			temp.y = 95;
			return temp;
		}

	}
}