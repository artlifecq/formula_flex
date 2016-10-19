package org.mokylin.skin.app.mount.tabItemPanel
{
	import feathers.controls.text.Fontter;
	import feathers.layout.IVirtualLayout;
	import feathers.layout.TiledRowsLayout;
	import flash.filters.GlowFilter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_left;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_right;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_sanji;
	import org.mokylin.skin.component.list.ListSkin4;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MountFeedSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnFeed:feathers.controls.Button;

		public var gridList:feathers.controls.List;

		public var icon:feathers.controls.UIAsset;

		public var imgProgress:feathers.controls.UIAsset;

		public var item0:feathers.controls.UIAsset;

		public var labExp:feathers.controls.Label;

		public var labStatus:feathers.controls.Label;

		public var labSuccessPro:feathers.controls.Label;

		public var labelFilterBlack:flash.filters.GlowFilter;

		public var leftBtn:feathers.controls.Button;

		public var page:feathers.controls.Label;

		public var rightBtn:feathers.controls.Button;

		public var rightGroup:feathers.controls.Group;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MountFeedSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 464;
			this.width = 285;
			labelFilterBlack_i();
			this.elementsContent = [rightGroup_i(),gridList_i(),__MountFeedSkin_UIAsset2_i(),leftBtn_i(),rightBtn_i(),page_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __MountFeedSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 21;
			temp.fontSize = 14;
			temp.text = "饱食度：";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 63;
			temp.x = 19;
			temp.y = 78;
			return temp;
		}

		private function __MountFeedSkin_TileLayout1_i():feathers.layout.TiledRowsLayout
		{
			var temp:feathers.layout.TiledRowsLayout = new feathers.layout.TiledRowsLayout();
			temp.horizontalGap = 3;
			temp.requestedColumnCount = 6;
			temp.requestedRowCount = 7;
			temp.verticalGap = 3;
			return temp;
		}

		private function __MountFeedSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 15;
			temp.repeatScale9Skin = false;
			temp.styleName = "ui/component/progress/skin_mount/jin_du_tiao_di.png";
			temp.width = 200;
			temp.x = 70;
			temp.y = 79;
			return temp;
		}

		private function __MountFeedSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 24;
			temp.styleName = "ui/common/backgound/mount_di.png";
			temp.width = 100;
			temp.x = 91;
			temp.y = 430;
			return temp;
		}

		private function btnFeed_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnFeed = temp;
			temp.name = "btnFeed";
			temp.height = 24;
			temp.label = "喂养";
			temp.fontSize = 12;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_mount_btn_sanji;
			temp.width = 52;
			temp.x = 225;
			temp.y = 27;
			return temp;
		}

		private function gridList_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			gridList = temp;
			temp.name = "gridList";
			temp.height = 340;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin4;
			temp.width = 297;
			temp.x = 1;
			temp.y = 100;
			temp.layout = __MountFeedSkin_TileLayout1_i();
			return temp;
		}

		private function icon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon = temp;
			temp.name = "icon";
			temp.styleName = "ui/common/kang/mount/tu_biao_di_kuang.png";
			temp.x = 1;
			temp.y = 1;
			return temp;
		}

		private function imgProgress_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgProgress = temp;
			temp.name = "imgProgress";
			temp.height = 8;
			temp.styleName = "ui/component/progress/skin_mount/jin_du_tiao.png";
			temp.width = 182;
			temp.x = 79;
			temp.y = 82;
			return temp;
		}

		private function item0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			item0 = temp;
			temp.name = "item0";
			temp.styleName = "ui/common/kang/mount/tu_biao_kuang.png";
			temp.x = 16;
			temp.y = 13;
			return temp;
		}

		private function labExp_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labExp = temp;
			temp.name = "labExp";
			temp.height = 21;
			temp.text = "100/200";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 182;
			temp.x = 80;
			temp.y = 76;
			return temp;
		}

		private function labStatus_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labStatus = temp;
			temp.name = "labStatus";
			temp.height = 22;
			temp.fontSize = 14;
			temp.text = "坐骑经验 +999999999";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 148;
			temp.x = 80;
			temp.y = 30;
			return temp;
		}

		private function labSuccessPro_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labSuccessPro = temp;
			temp.name = "labSuccessPro";
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 25;
			temp.fontSize = 14;
			temp.text = "饱食度：750/10000";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.visible = false;
			temp.width = 163;
			temp.x = 80;
			temp.y = 40;
			return temp;
		}

		private function labelFilterBlack_i():flash.filters.GlowFilter
		{
			var temp:flash.filters.GlowFilter = new flash.filters.GlowFilter();
			labelFilterBlack = temp;
			temp.alpha = 0.8;
			temp.blurX = 2;
			temp.blurY = 2;
			temp.color = 0x000000;
			temp.inner = false;
			temp.knockout = false;
			temp.quality = 1;
			temp.strength = 10;
			return temp;
		}

		private function leftBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			leftBtn = temp;
			temp.name = "leftBtn";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_mount_btn_left;
			temp.x = 60;
			temp.y = 430;
			return temp;
		}

		private function page_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			page = temp;
			temp.name = "page";
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 19;
			temp.text = "1/1";
			temp.textAlign = "center";
			temp.color = 0xD4C996;
			temp.width = 92;
			temp.x = 93;
			temp.y = 431;
			return temp;
		}

		private function rightBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			rightBtn = temp;
			temp.name = "rightBtn";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_mount_btn_right;
			temp.x = 198;
			temp.y = 430;
			return temp;
		}

		private function rightGroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			rightGroup = temp;
			temp.name = "rightGroup";
			temp.height = 100;
			temp.width = 286;
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [icon_i(),item0_i(),labStatus_i(),labSuccessPro_i(),__MountFeedSkin_Label1_i(),btnFeed_i(),__MountFeedSkin_UIAsset1_i(),imgProgress_i(),labExp_i()];
			return temp;
		}

	}
}