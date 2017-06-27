package org.mokylin.skin.mainui.activityBar
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.mainui.activityBar.ActiveLabelDg;
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

		public var skinBg1:feathers.controls.SkinnableContainer;

		public var txtTitle:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ActivityButtonSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 86;
			this.width = 86;
			this.elementsContent = [skinBg1_i(),btnBar_i(),txtTitle_i()];
			
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

		private function skinBg1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinBg1 = temp;
			temp.name = "skinBg1";
			temp.height = 16;
			var skin:StateSkin = new org.mokylin.skin.mainui.activityBar.ActiveLabelDg()
			temp.skin = skin
			temp.width = 80;
			temp.x = 1;
			temp.y = 68;
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
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 113;
			temp.x = -13;
			temp.y = 67;
			return temp;
		}

	}
}