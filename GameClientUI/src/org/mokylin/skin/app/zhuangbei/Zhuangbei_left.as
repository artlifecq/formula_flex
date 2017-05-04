package org.mokylin.skin.app.zhuangbei
{
	import feathers.controls.text.Fontter;
	import feathers.layout.IVirtualLayout;
	import feathers.layout.TiledRowsLayout;
	import feathers.data.ListCollection;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.UIAsset;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.app.zhuangbei.qianghua.TitileHead;
	import org.mokylin.skin.component.list.ListSkin1;
	import org.mokylin.skin.component.tabbar.TabBarSkin_pack;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Zhuangbei_left extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var lb_yinzi:feathers.controls.Label;

		public var list1:feathers.controls.List;

		public var list2:feathers.controls.List;

		public var monyIcon:feathers.controls.UIAsset;

		public var monyTips:feathers.controls.Label;

		public var tab_pack:feathers.controls.TabBar;

		public var title1:feathers.controls.SkinnableContainer;

		public var title2:feathers.controls.SkinnableContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Zhuangbei_left()
		{
			super();
			
			this.currentState = "normal";
			this.height = 431;
			this.width = 340;
			this.elementsContent = [__Zhuangbei_left_UIAsset1_i(),title1_i(),title2_i(),tab_pack_i(),__Zhuangbei_left_UIAsset2_i(),__Zhuangbei_left_UIAsset3_i(),list1_i(),list2_i(),lb_yinzi_i(),monyTips_i(),monyIcon_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Zhuangbei_left_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['全部','武器','防具','首饰'];
			return temp;
		}

		private function __Zhuangbei_left_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = -2;
			return temp;
		}

		private function __Zhuangbei_left_TileLayout1_i():feathers.layout.TiledRowsLayout
		{
			var temp:feathers.layout.TiledRowsLayout = new feathers.layout.TiledRowsLayout();
			return temp;
		}

		private function __Zhuangbei_left_TileLayout2_i():feathers.layout.TiledRowsLayout
		{
			var temp:feathers.layout.TiledRowsLayout = new feathers.layout.TiledRowsLayout();
			return temp;
		}

		private function __Zhuangbei_left_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 445;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 350;
			temp.x = -4;
			temp.y = -6;
			return temp;
		}

		private function __Zhuangbei_left_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 185;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 339;
			temp.x = 1;
			temp.y = 51;
			return temp;
		}

		private function __Zhuangbei_left_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 143;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 339;
			temp.x = 1;
			temp.y = 264;
			return temp;
		}

		private function lb_yinzi_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_yinzi = temp;
			temp.name = "lb_yinzi";
			temp.htmlText = "消耗绑银：<font color='#CFC6AE'>9999</font>";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 110;
			temp.x = 7;
			temp.y = 412;
			return temp;
		}

		private function list1_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list1 = temp;
			temp.name = "list1";
			temp.height = 175;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 328;
			temp.x = 7;
			temp.y = 56;
			temp.layout = __Zhuangbei_left_TileLayout1_i();
			return temp;
		}

		private function list2_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list2 = temp;
			temp.name = "list2";
			temp.height = 131;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 328;
			temp.x = 7;
			temp.y = 270;
			temp.layout = __Zhuangbei_left_TileLayout2_i();
			return temp;
		}

		private function monyIcon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			monyIcon = temp;
			temp.name = "monyIcon";
			temp.styleName = "ui/common/tubiao/yinzib_24.png";
			temp.x = 117;
			temp.y = 407;
			return temp;
		}

		private function monyTips_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			monyTips = temp;
			temp.name = "monyTips";
			temp.leading = 0;
			temp.letterSpacing = 0;
			temp.text = "（绑银不足将消耗非绑定银两）";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 135;
			temp.y = 413;
			return temp;
		}

		private function tab_pack_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tab_pack = temp;
			temp.name = "tab_pack";
			temp.btnWidth = 67;
			temp.styleClass = org.mokylin.skin.component.tabbar.TabBarSkin_pack;
			temp.width = 326;
			temp.x = 0;
			temp.y = 24;
			temp.layout = __Zhuangbei_left_HorizontalLayout1_i();
			temp.dataProvider = __Zhuangbei_left_ArrayCollection1_i();
			return temp;
		}

		private function title1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			title1 = temp;
			temp.name = "title1";
			temp.height = 23;
			var skin:StateSkin = new org.mokylin.skin.app.zhuangbei.qianghua.TitileHead()
			temp.skin = skin
			temp.width = 336;
			temp.x = 2;
			temp.y = 0;
			return temp;
		}

		private function title2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			title2 = temp;
			temp.name = "title2";
			temp.height = 23;
			var skin:StateSkin = new org.mokylin.skin.app.zhuangbei.qianghua.TitileHead()
			temp.skin = skin
			temp.width = 336;
			temp.x = 2;
			temp.y = 239;
			return temp;
		}

	}
}