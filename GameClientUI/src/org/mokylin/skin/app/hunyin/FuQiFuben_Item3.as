package org.mokylin.skin.app.hunyin
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UIMovieClip;
	import org.mokylin.skin.app.hunyin.mc.UIMovieClipTiaozhan_dao;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class FuQiFuben_Item3 extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnZhan1:feathers.controls.Button;

		public var btnZhan2:feathers.controls.Button;

		public var grpZhan:feathers.controls.Group;

		public var selectBg:feathers.controls.UIAsset;

		public var skinMc:feathers.controls.UIMovieClip;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FuQiFuben_Item3()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__FuQiFuben_Item3_UIAsset1_i(),__FuQiFuben_Item3_UIAsset2_i(),__FuQiFuben_Item3_UIAsset3_i(),skinMc_i(),selectBg_i(),grpZhan_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __FuQiFuben_Item3_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/hunyin/kunnan.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __FuQiFuben_Item3_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 38;
			temp.styleName = "ui/app/hunyin/bantoudi.png";
			temp.x = 49;
			temp.y = 237;
			return temp;
		}

		private function __FuQiFuben_Item3_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/hunyin/100jikaiqi.png";
			temp.x = 66;
			temp.y = 242;
			return temp;
		}

		private function btnZhan1_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnZhan1 = temp;
			temp.name = "btnZhan1";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "夫妻挑战";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnZhan2_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnZhan2 = temp;
			temp.name = "btnZhan2";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "直接挑战";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.x = 110;
			temp.y = 0;
			return temp;
		}

		private function grpZhan_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpZhan = temp;
			temp.name = "grpZhan";
			temp.x = 50;
			temp.y = 314;
			temp.elementsContent = [btnZhan1_i(),btnZhan2_i()];
			return temp;
		}

		private function selectBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			selectBg = temp;
			temp.name = "selectBg";
			temp.height = 390;
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/hunyin/liangkuang.png";
			temp.width = 298;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function skinMc_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			skinMc = temp;
			temp.name = "skinMc";
			temp.autoPlay = false;
			temp.height = 103;
			temp.styleClass = org.mokylin.skin.app.hunyin.mc.UIMovieClipTiaozhan_dao;
			temp.width = 197;
			temp.x = 50.5;
			temp.y = 276;
			return temp;
		}

	}
}