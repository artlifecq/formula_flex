package org.mokylin.skin.app.shejiao.zudui
{
	import feathers.data.ListCollection;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.UIAsset;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.component.tabbar.TabBarSkin_tab;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ZuiDuiSkin extends feathers.controls.StateSkin
	{
		public var tab_duiwu:feathers.controls.TabBar;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ZuiDuiSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 601;
			this.width = 956;
			this.elementsContent = [tab_duiwu_i(),__ZuiDuiSkin_UIAsset2_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ZuiDuiSkin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['我的队伍','附近队伍','附近玩家'];
			return temp;
		}

		private function __ZuiDuiSkin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 0;
			return temp;
		}

		private function __ZuiDuiSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/shejiao/zudui/bg2.jpg";
			temp.x = 23;
			temp.y = 462;
			return temp;
		}

		private function tab_duiwu_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tab_duiwu = temp;
			temp.name = "tab_duiwu";
			temp.btnWidth = 78;
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleClass = org.mokylin.skin.component.tabbar.TabBarSkin_tab;
			temp.x = 39;
			temp.y = 50;
			temp.layout = __ZuiDuiSkin_HorizontalLayout1_i();
			temp.dataProvider = __ZuiDuiSkin_ArrayCollection1_i();
			return temp;
		}

	}
}