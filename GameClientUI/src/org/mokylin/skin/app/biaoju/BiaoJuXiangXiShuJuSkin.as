package org.mokylin.skin.app.biaoju
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.ScrollContainer;
	import org.mokylin.skin.component.scrollbar.skin_red.VScrollBarRedSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class BiaoJuXiangXiShuJuSkin extends feathers.controls.StateSkin
	{
		public var scroller:feathers.controls.ScrollContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function BiaoJuXiangXiShuJuSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 270;
			this.width = 415;
			this.elementsContent = [__BiaoJuXiangXiShuJuSkin_UIAsset1_i(),__BiaoJuXiangXiShuJuSkin_UIAsset2_i(),scroller_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __BiaoJuXiangXiShuJuSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/biaoju/xing_xi_sj.png";
			temp.x = 173;
			temp.y = 15;
			return temp;
		}

		private function __BiaoJuXiangXiShuJuSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/biaoju/fen_ge_xian.png";
			temp.width = 388;
			temp.x = 17;
			temp.y = 44;
			return temp;
		}

		private function scroller_i():feathers.controls.ScrollContainer
		{
			var temp:feathers.controls.ScrollContainer = new feathers.controls.ScrollContainer();
			scroller = temp;
			temp.name = "scroller";
			temp.height = 220;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.scrollbar.skin_red.VScrollBarRedSkin);
			temp.width = 400;
			temp.x = 15;
			temp.y = 50;
			return temp;
		}

	}
}