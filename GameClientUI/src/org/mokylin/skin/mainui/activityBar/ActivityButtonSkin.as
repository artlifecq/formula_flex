package org.mokylin.skin.mainui.activityBar
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.mainui.activityBar.ActivityItem;
	import org.mokylin.skin.mainui.activityBar.button.ButtonRacing;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ActivityButtonSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnBar:feathers.controls.Button;

		public var skinItem:feathers.controls.SkinnableContainer;

		public var uiJinXing:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ActivityButtonSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [btnBar_i(),uiJinXing_i(),skinItem_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btnBar_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnBar = temp;
			temp.name = "btnBar";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.styleClass = org.mokylin.skin.mainui.activityBar.button.ButtonRacing;
			temp.color = 0xF9F0CC;
			temp.x = 13;
			temp.y = 5;
			return temp;
		}

		private function skinItem_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinItem = temp;
			temp.name = "skinItem";
			temp.height = 18;
			var skin:StateSkin = new org.mokylin.skin.mainui.activityBar.ActivityItem()
			temp.skin = skin
			temp.width = 73;
			temp.x = 8;
			temp.y = 67;
			return temp;
		}

		private function uiJinXing_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiJinXing = temp;
			temp.name = "uiJinXing";
			temp.styleName = "ui/common/jinxingzhong.png";
			temp.x = 46;
			temp.y = -6;
			return temp;
		}

	}
}