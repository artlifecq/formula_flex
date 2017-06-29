package org.mokylin.skin.mainui.activityBar
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.mainui.activityBar.ActiveLabelDg;
	import org.mokylin.skin.mainui.activityBar.button.ButtonFubenduilie;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ActivetyFuBenDuiLieSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnBar:feathers.controls.Button;

		public var skinBg1:feathers.controls.SkinnableContainer;

		public var skinBg2:feathers.controls.SkinnableContainer;

		public var txtTitle:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ActivetyFuBenDuiLieSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 107;
			this.width = 82;
			this.elementsContent = [skinBg1_i(),skinBg2_i(),btnBar_i(),txtTitle_i()];
			
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
			temp.styleClass = org.mokylin.skin.mainui.activityBar.button.ButtonFubenduilie;
			temp.x = 6;
			temp.y = 0;
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

		private function skinBg2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinBg2 = temp;
			temp.name = "skinBg2";
			temp.height = 16;
			var skin:StateSkin = new org.mokylin.skin.mainui.activityBar.ActiveLabelDg()
			temp.skin = skin
			temp.width = 80;
			temp.x = 1;
			temp.y = 85;
			return temp;
		}

		private function txtTitle_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txtTitle = temp;
			temp.name = "txtTitle";
			temp.height = 40;
			temp.touchable = false;
			temp.touchGroup = true;
			temp.leading = 3;
			temp.text = "副本列队中00：30";
			temp.textAlign = "center";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 82;
			temp.x = 0;
			temp.y = 67;
			return temp;
		}

	}
}