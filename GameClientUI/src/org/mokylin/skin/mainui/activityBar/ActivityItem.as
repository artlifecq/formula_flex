package org.mokylin.skin.mainui.activityBar
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.mainui.activityBar.ActiveLabelDg;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ActivityItem extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var skinBg:feathers.controls.SkinnableContainer;

		public var txtTitle:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ActivityItem()
		{
			super();
			
			this.currentState = "normal";
			this.height = 20;
			this.width = 113;
			this.elementsContent = [skinBg_i(),txtTitle_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function skinBg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinBg = temp;
			temp.name = "skinBg";
			temp.height = 16;
			var skin:StateSkin = new org.mokylin.skin.mainui.activityBar.ActiveLabelDg()
			temp.skin = skin
			temp.width = 80;
			temp.x = 17;
			temp.y = 1;
			return temp;
		}

		private function txtTitle_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txtTitle = temp;
			temp.name = "txtTitle";
			temp.height = 20;
			temp.touchable = false;
			temp.touchGroup = true;
			temp.text = "30:30后开始";
			temp.textAlign = "center";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 113;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}