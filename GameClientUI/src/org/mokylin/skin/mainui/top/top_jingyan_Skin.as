package org.mokylin.skin.mainui.top
{
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.mainui.top.jinyan_bar_green;
	import org.mokylin.skin.mainui.top.jinyan_bar_yellow;
	import org.mokylin.skin.mainui.top.topBG_Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class top_jingyan_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var top_bar:feathers.controls.SkinnableContainer;

		public var top_bar2:feathers.controls.SkinnableContainer;

		public var top_bg:feathers.controls.SkinnableContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function top_jingyan_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 9;
			this.width = 200;
			this.elementsContent = [top_bg_i(),top_bar_i(),top_bar2_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function top_bar2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			top_bar2 = temp;
			temp.name = "top_bar2";
			temp.height = 7;
			var skin:StateSkin = new org.mokylin.skin.mainui.top.jinyan_bar_yellow()
			temp.skin = skin
			temp.width = 200;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function top_bar_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			top_bar = temp;
			temp.name = "top_bar";
			temp.height = 7;
			var skin:StateSkin = new org.mokylin.skin.mainui.top.jinyan_bar_green()
			temp.skin = skin
			temp.width = 200;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function top_bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			top_bg = temp;
			temp.name = "top_bg";
			temp.height = 9;
			temp.left = 0;
			temp.right = 0;
			var skin:StateSkin = new org.mokylin.skin.mainui.top.topBG_Skin()
			temp.skin = skin
			temp.y = 0;
			return temp;
		}

	}
}