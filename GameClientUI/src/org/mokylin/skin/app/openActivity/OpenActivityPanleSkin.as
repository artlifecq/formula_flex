package org.mokylin.skin.app.openActivity
{
	import feathers.controls.List;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.common.TongYongPanelbg1;
	import org.mokylin.skin.component.list.ListSkin1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class OpenActivityPanleSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var listCont:feathers.controls.List;

		public var uiRight:feathers.controls.UIAsset;

		public var uiTitle:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function OpenActivityPanleSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 601;
			this.width = 956;
			this.elementsContent = [bg_i(),__OpenActivityPanleSkin_UIAsset1_i(),uiRight_i(),uiTitle_i(),listCont_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __OpenActivityPanleSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 512;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 922;
			temp.x = 18;
			temp.y = 82;
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

		private function listCont_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			listCont = temp;
			temp.name = "listCont";
			temp.height = 500;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 199;
			temp.x = 24;
			temp.y = 89;
			return temp;
		}

		private function uiRight_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiRight = temp;
			temp.name = "uiRight";
			temp.height = 504;
			temp.width = 706;
			temp.x = 224;
			temp.y = 86;
			return temp;
		}

		private function uiTitle_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiTitle = temp;
			temp.name = "uiTitle";
			temp.height = 22;
			temp.touchable = false;
			temp.touchGroup = true;
			temp.width = 76;
			temp.x = 436;
			temp.y = 9;
			return temp;
		}

	}
}