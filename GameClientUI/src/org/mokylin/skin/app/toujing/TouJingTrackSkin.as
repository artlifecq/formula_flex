package org.mokylin.skin.app.toujing
{
	import feathers.data.ListCollection;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.component.tabbar.TabBarSkin_task_tabBar;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TouJingTrackSkin extends feathers.controls.StateSkin
	{
		public var tabBar:feathers.controls.TabBar;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TouJingTrackSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 242;
			this.width = 230;
			this.elementsContent = [tabBar_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __TouJingTrackSkin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['夺经','刺探','运镖'];
			return temp;
		}

		private function __TouJingTrackSkin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 0;
			return temp;
		}

		private function tabBar_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tabBar = temp;
			temp.name = "tabBar";
			temp.btnWidth = 64;
			temp.styleClass = org.mokylin.skin.component.tabbar.TabBarSkin_task_tabBar;
			temp.width = 64;
			temp.x = 12;
			temp.y = 7;
			temp.layout = __TouJingTrackSkin_HorizontalLayout1_i();
			temp.dataProvider = __TouJingTrackSkin_ArrayCollection1_i();
			return temp;
		}

	}
}