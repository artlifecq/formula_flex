package org.mokylin.skin.app.beibao
{
	import feathers.controls.text.Fontter;
	import feathers.layout.IVirtualLayout;
	import feathers.layout.TiledRowsLayout;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.beibao.button.ButtonCunchu;
	import org.mokylin.skin.app.beibao.button.ButtonZhengli;
	import org.mokylin.skin.component.button.ButtonSkin_close2;
	import org.mokylin.skin.component.list.ListSkin1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class cangku_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var btnClose:feathers.controls.Button;

		public var btn_chucun:feathers.controls.Button;

		public var btn_zhengli:feathers.controls.Button;

		public var lb_Num:feathers.controls.Label;

		public var lb_Title:feathers.controls.UIAsset;

		public var lst_pack:feathers.controls.List;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function cangku_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 447;
			this.width = 383;
			this.elementsContent = [__cangku_Skin_Group1_i(),bg_i(),__cangku_Skin_UIAsset3_i(),__cangku_Skin_Label1_i(),lb_Num_i(),btn_zhengli_i(),btn_chucun_i(),btnClose_i(),lst_pack_i(),lb_Title_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __cangku_Skin_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [__cangku_Skin_UIAsset1_i(),__cangku_Skin_UIAsset2_i()];
			return temp;
		}

		private function __cangku_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "仓库空间：";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 16;
			temp.y = 418;
			return temp;
		}

		private function __cangku_Skin_TileLayout1_i():feathers.layout.TiledRowsLayout
		{
			var temp:feathers.layout.TiledRowsLayout = new feathers.layout.TiledRowsLayout();
			temp.requestedColumnCount = 8;
			temp.requestedRowCount = 8;
			return temp;
		}

		private function __cangku_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 447;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 383;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __cangku_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/fenyexian.png";
			temp.width = 383;
			temp.x = 0;
			temp.y = 382;
			return temp;
		}

		private function __cangku_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 23;
			temp.styleName = "ui/common/background/neikuang.png";
			temp.width = 128;
			temp.x = 13;
			temp.y = 416;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.styleName = "ui/app/beibao/cangku/ckmtiao.png";
			temp.x = 3;
			temp.y = 3;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close2;
			temp.x = 362;
			temp.y = 9;
			return temp;
		}

		private function btn_chucun_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_chucun = temp;
			temp.name = "btn_chucun";
			temp.styleClass = org.mokylin.skin.app.beibao.button.ButtonCunchu;
			temp.x = 334;
			temp.y = 395;
			return temp;
		}

		private function btn_zhengli_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_zhengli = temp;
			temp.name = "btn_zhengli";
			temp.styleClass = org.mokylin.skin.app.beibao.button.ButtonZhengli;
			temp.x = 288;
			temp.y = 397;
			return temp;
		}

		private function lb_Num_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_Num = temp;
			temp.name = "lb_Num";
			temp.text = "0/48";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 45;
			temp.x = 94;
			temp.y = 419;
			return temp;
		}

		private function lb_Title_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			lb_Title = temp;
			temp.name = "lb_Title";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/beibao/cangku/cangku.png";
			temp.x = 30;
			temp.y = 7;
			return temp;
		}

		private function lst_pack_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			lst_pack = temp;
			temp.name = "lst_pack";
			temp.height = 360;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 375;
			temp.x = 4;
			temp.y = 31;
			temp.layout = __cangku_Skin_TileLayout1_i();
			return temp;
		}

	}
}