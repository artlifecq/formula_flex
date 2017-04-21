package org.mokylin.skin.app.beibao.jingmai
{
	import feathers.controls.text.Fontter;
	import feathers.layout.IVirtualLayout;
	import feathers.layout.TiledRowsLayout;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.list.ListSkin1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Stone_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var lb_Title:feathers.controls.Label;

		public var lst_pack:feathers.controls.List;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Stone_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 352;
			this.width = 364;
			this.elementsContent = [__Stone_Skin_Group1_i(),bg_i(),lb_Title_i(),lst_pack_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Stone_Skin_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [__Stone_Skin_UIAsset1_i()];
			return temp;
		}

		private function __Stone_Skin_TileLayout1_i():feathers.layout.TiledRowsLayout
		{
			var temp:feathers.layout.TiledRowsLayout = new feathers.layout.TiledRowsLayout();
			temp.requestedColumnCount = 7;
			temp.requestedRowCount = 6;
			return temp;
		}

		private function __Stone_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 349;
			temp.styleName = "ui/app/beibao/cangku/bg.png";
			temp.width = 364;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.styleName = "ui/common/titilebg/head_bg.png";
			temp.width = 354;
			temp.x = 5;
			temp.y = 4;
			return temp;
		}

		private function lb_Title_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_Title = temp;
			temp.name = "lb_Title";
			temp.bold = true;
			temp.touchable = false;
			temp.touchGroup = true;
			temp.letterSpacing = 5;
			temp.text = "仓库";
			temp.color = 0xa6a07b;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 33;
			temp.y = 7;
			return temp;
		}

		private function lst_pack_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			lst_pack = temp;
			temp.name = "lst_pack";
			temp.height = 314;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 346;
			temp.x = 9;
			temp.y = 31;
			temp.layout = __Stone_Skin_TileLayout1_i();
			return temp;
		}

	}
}