package org.mokylin.skin.app.dropGoods
{
	import feathers.controls.text.Fontter;
	import flash.filters.GlowFilter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_button;
	import org.mokylin.skin.component.button.ButtonSkin_close_3;
	import org.mokylin.skin.component.list.ListRedSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class DropGoodsListPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnPickUpAll:feathers.controls.Button;

		public var closeBtn:feathers.controls.Button;

		public var labelFilterBlack:flash.filters.GlowFilter;

		public var list:feathers.controls.List;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function DropGoodsListPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			labelFilterBlack_i();
			this.elementsContent = [__DropGoodsListPanelSkin_UIAsset1_i(),__DropGoodsListPanelSkin_UIAsset2_i(),closeBtn_i(),__DropGoodsListPanelSkin_Label1_i(),__DropGoodsListPanelSkin_UIAsset3_i(),list_i(),btnPickUpAll_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __DropGoodsListPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 24;
			temp.touchable = false;
			temp.fontSize = 14;
			temp.text = "拾取物品";
			temp.textAlign = "center";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 100;
			temp.x = 82;
			temp.y = 6;
			return temp;
		}

		private function __DropGoodsListPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 417;
			temp.styleName = "ui/common/backgound/dikuang.png";
			temp.width = 249;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __DropGoodsListPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/common/kang/taitougaoliang.png";
			temp.width = 241;
			temp.x = 3;
			temp.y = 4;
			return temp;
		}

		private function __DropGoodsListPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 369;
			temp.styleName = "ui/common/backgound/neikuang.png";
			temp.width = 220;
			temp.x = 15;
			temp.y = 38;
			return temp;
		}

		private function btnPickUpAll_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnPickUpAll = temp;
			temp.name = "btnPickUpAll";
			temp.height = 35;
			temp.label = "全部拾取";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_button;
			temp.width = 113;
			temp.x = 71;
			temp.y = 362;
			return temp;
		}

		private function closeBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			closeBtn = temp;
			temp.name = "closeBtn";
			temp.height = 24;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close_3;
			temp.width = 24;
			temp.x = 215;
			temp.y = 6;
			return temp;
		}

		private function labelFilterBlack_i():flash.filters.GlowFilter
		{
			var temp:flash.filters.GlowFilter = new flash.filters.GlowFilter();
			labelFilterBlack = temp;
			temp.alpha = 1;
			temp.blurX = 4;
			temp.blurY = 4;
			temp.color = 0x000000;
			temp.inner = false;
			temp.knockout = false;
			temp.quality = 1;
			temp.strength = 10;
			return temp;
		}

		private function list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list = temp;
			temp.name = "list";
			temp.height = 300;
			temp.styleClass = org.mokylin.skin.component.list.ListRedSkin;
			temp.width = 220;
			temp.x = 16;
			temp.y = 45;
			return temp;
		}

	}
}