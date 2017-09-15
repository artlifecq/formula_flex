package org.mokylin.skin.app.beibao.jingmai
{
	import feathers.layout.IVirtualLayout;
	import feathers.layout.TiledRowsLayout;
	import feathers.controls.Button;
	import feathers.controls.List;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.common.TongYongTanKuang_bg2;
	import org.mokylin.skin.component.button.ButtonSkin_close;
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
		public var btnClose:feathers.controls.Button;

		public var lst_pack:feathers.controls.List;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Stone_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 210;
			this.width = 326;
			this.elementsContent = [__Stone_Skin_SkinnableContainer1_i(),__Stone_Skin_UIAsset1_i(),lst_pack_i(),btnClose_i(),__Stone_Skin_UIAsset2_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Stone_Skin_SkinnableContainer1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			temp.height = 210;
			var skin:StateSkin = new org.mokylin.skin.common.TongYongTanKuang_bg2()
			temp.skin = skin
			temp.width = 326;
			temp.x = 0;
			temp.y = 0;
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
			temp.height = 169;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 312;
			temp.x = 7;
			temp.y = 34;
			return temp;
		}

		private function __Stone_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/art_txt/common/background/bianshiliebiao.png";
			temp.x = 119;
			temp.y = 7;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close;
			temp.x = 290;
			temp.y = 4;
			return temp;
		}

		private function lst_pack_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			lst_pack = temp;
			temp.name = "lst_pack";
			temp.height = 161;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 304;
			temp.x = 12;
			temp.y = 38;
			temp.layout = __Stone_Skin_TileLayout1_i();
			return temp;
		}

	}
}