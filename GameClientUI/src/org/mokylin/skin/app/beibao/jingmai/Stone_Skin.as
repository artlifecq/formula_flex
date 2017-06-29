package org.mokylin.skin.app.beibao.jingmai
{
	import feathers.layout.IVirtualLayout;
	import feathers.layout.TiledRowsLayout;
	import feathers.controls.List;
	import feathers.controls.SkinnableContainer;
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
		public var lst_pack:feathers.controls.List;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Stone_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 166;
			this.width = 400;
			this.elementsContent = [__Stone_Skin_UIAsset1_i(),lst_pack_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
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
			temp.height = 166;
			temp.styleName = "ui/common/tips/tips_2.png";
			temp.width = 400;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lst_pack_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			lst_pack = temp;
			temp.name = "lst_pack";
			temp.height = 163;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 396;
			temp.x = 3;
			temp.y = 2;
			temp.layout = __Stone_Skin_TileLayout1_i();
			return temp;
		}

	}
}