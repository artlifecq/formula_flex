package org.mokylin.skin.app.beibao.Xinfa
{
	import feathers.controls.Group;
	import feathers.controls.StateSkin;
	import feathers.controls.ToggleButton;
	import feathers.controls.UIAsset;
	import feathers.controls.UIMovieClip;
	import org.mokylin.skin.app.beibao.Xinfa.button.ButtonDayeqian;
	import org.mokylin.skin.app.beibao.Xinfa.mc.UIMovieClipChongshu2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class XinFaSelect_Item extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btns:feathers.controls.ToggleButton;

		public var gLevel:feathers.controls.Group;

		public var icon:feathers.controls.UIAsset;

		public var mcNum:feathers.controls.UIMovieClip;

		public var uiChong:feathers.controls.UIAsset;

		public var uiDi:feathers.controls.UIAsset;

		public var uiName:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function XinFaSelect_Item()
		{
			super();
			
			this.currentState = "normal";
			this.height = 75;
			this.width = 202;
			this.elementsContent = [btns_i(),__XinFaSelect_Item_UIAsset1_i(),gLevel_i(),icon_i(),uiName_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __XinFaSelect_Item_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/beibao/xinfa/yuanquan.png";
			temp.x = 15;
			temp.y = 2;
			return temp;
		}

		private function btns_i():feathers.controls.ToggleButton
		{
			var temp:feathers.controls.ToggleButton = new feathers.controls.ToggleButton();
			btns = temp;
			temp.name = "btns";
			temp.styleClass = org.mokylin.skin.app.beibao.Xinfa.button.ButtonDayeqian;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function gLevel_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			gLevel = temp;
			temp.name = "gLevel";
			temp.x = 135;
			temp.y = 15;
			temp.elementsContent = [mcNum_i(),uiDi_i(),uiChong_i()];
			return temp;
		}

		private function icon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon = temp;
			temp.name = "icon";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/beibao/xinfa/icon/longxiang.png";
			temp.x = 8;
			temp.y = -3;
			return temp;
		}

		private function mcNum_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			mcNum = temp;
			temp.name = "mcNum";
			temp.autoPlay = false;
			temp.height = 17;
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleClass = org.mokylin.skin.app.beibao.Xinfa.mc.UIMovieClipChongshu2;
			temp.width = 20;
			temp.x = 14;
			temp.y = 0;
			return temp;
		}

		private function uiChong_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiChong = temp;
			temp.name = "uiChong";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/beibao/xinfa/chong.png";
			temp.x = 28;
			temp.y = 0;
			return temp;
		}

		private function uiDi_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiDi = temp;
			temp.name = "uiDi";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/beibao/xinfa/di.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function uiName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiName = temp;
			temp.name = "uiName";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/beibao/xinfa/mingzi1/longxiang.png";
			temp.x = 72;
			temp.y = 17;
			return temp;
		}

	}
}