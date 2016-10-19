package org.mokylin.skin.app.stall
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class StallItemrenderSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var border:feathers.controls.UIAsset;

		public var cantSetItem:feathers.controls.Group;

		public var closeStallItem:feathers.controls.UIAsset;

		public var grid:feathers.controls.UIAsset;

		public var itemName:feathers.controls.Label;

		public var lock:feathers.controls.UIAsset;

		public var openStallItem:feathers.controls.Group;

		public var sellItem:feathers.controls.Label;

		public var silver:feathers.controls.Label;

		public var silverIcon:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function StallItemrenderSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [closeStallItem_i(),cantSetItem_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __StallItemrenderSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 63;
			temp.styleName = "ui/app/stall/itemBg.png";
			temp.width = 178;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __StallItemrenderSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/stall/bg_tu_teng.png";
			temp.x = 128;
			temp.y = 2;
			return temp;
		}

		private function border_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			border = temp;
			temp.name = "border";
			temp.height = 66;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/common/version_3/x_xuanzhongkuang/xuan_zhong.png";
			temp.width = 182;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function cantSetItem_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			cantSetItem = temp;
			temp.name = "cantSetItem";
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [openStallItem_i(),border_i(),itemName_i(),silver_i(),sellItem_i(),grid_i(),silverIcon_i(),lock_i()];
			return temp;
		}

		private function closeStallItem_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			closeStallItem = temp;
			temp.name = "closeStallItem";
			temp.styleName = "ui/app/stall/dikuang.png";
			temp.x = 2;
			temp.y = 1;
			return temp;
		}

		private function grid_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid = temp;
			temp.name = "grid";
			temp.styleName = "ui/common/grid/normal/46_3.png";
			temp.visible = false;
			temp.x = 10;
			temp.y = 6;
			return temp;
		}

		private function itemName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			itemName = temp;
			temp.name = "itemName";
			temp.fontSize = 14;
			temp.text = "轻效";
			temp.textAlign = "left";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 115;
			temp.x = 62;
			temp.y = 13;
			return temp;
		}

		private function lock_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			lock = temp;
			temp.name = "lock";
			temp.styleName = "ui/common/version_3/B_bujian/suo_1.png";
			temp.x = 86;
			temp.y = 20;
			return temp;
		}

		private function openStallItem_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			openStallItem = temp;
			temp.name = "openStallItem";
			temp.x = 2;
			temp.y = 1;
			temp.elementsContent = [__StallItemrenderSkin_UIAsset1_i(),__StallItemrenderSkin_UIAsset2_i()];
			return temp;
		}

		private function sellItem_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			sellItem = temp;
			temp.name = "sellItem";
			temp.leading = 0;
			temp.fontSize = 14;
			temp.text = "请上架出售物品";
			temp.textAlign = "left";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 102;
			temp.x = 69;
			temp.y = 26;
			return temp;
		}

		private function silverIcon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			silverIcon = temp;
			temp.name = "silverIcon";
			temp.height = 20;
			temp.styleName = "ui/common/version_3/T_tubiao/T_tongyongxiaotubiao/yin_zi.png";
			temp.width = 20;
			temp.x = 62;
			temp.y = 37;
			return temp;
		}

		private function silver_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			silver = temp;
			temp.name = "silver";
			temp.leading = 0;
			temp.fontSize = 14;
			temp.text = "100锭 11两";
			temp.textAlign = "left";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 102;
			temp.x = 80;
			temp.y = 38;
			return temp;
		}

	}
}